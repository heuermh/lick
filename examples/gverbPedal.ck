/*

    LiCK  Library for ChucK.
    Copyright (c) 2007-2017 held jointly by the individual authors.

    This file is part of LiCK.

    LiCK is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    LiCK is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with LiCK.  If not, see <http://www.gnu.org/licenses/>.

*/

GVerb gverb;

0.3 => float dry;
0.2 => float early;
0.5 => float tail;
30.0 => float room;

dry => gverb.dry;
early => gverb.early;
tail => gverb.tail;
room => gverb.roomsize;

class Toggle extends Procedure
{
    1 => int _running;

    fun void run()
    {
        if (_running)
        {
            1.0 => gverb.dry;
            0.0 => gverb.early;
            0.0 => gverb.tail;
            0 => _running;
        }
        else
        {
            dry => gverb.dry;
            early => gverb.early;
            tail => gverb.tail;
            1 => _running;
        }
        <<<"running", _running>>>;
    }
}

class MoreRoom extends Procedure
{
    fun void run()
    {
        Math.min(300.0, room * 1.1) => room;
        room => gverb.roomsize;
        <<<"room", room>>>;
    }
}

class LessRoom extends Procedure
{
    fun void run()
    {
        Math.max(1.0, room * 0.9) => room;
        room => gverb.roomsize;
        <<<"room", room>>>;
    }
}

class MoreEarly extends Procedure
{
    fun void run()
    {
        early + tail => float sum;
        Math.min(0.98 * sum, early * 1.1) => early;
        sum - early => tail;
        early => gverb.early;
        tail => gverb.tail;
        <<<"early", early>>>;
        <<<"tail", tail>>>;
    }
}

class MoreTail extends Procedure
{
    fun void run()
    {
        early + tail => float sum;
        Math.min(0.98 * sum, tail * 1.1) => tail;
        sum - tail => early;
        early => gverb.early;
        tail => gverb.tail;
        <<<"early", early>>>;
        <<<"tail", tail>>>;
    }
}

FeedbackMachines.cascade(0.8) @=> FeedbackMachine fm;

1700::ms => fm.delay1.delay.max;
1700::ms => fm.delay1.delay.delay;
1300::ms => fm.delay2.delay.max;
1300::ms => fm.delay2.delay.delay;
1100::ms => fm.delay3.delay.max;
1100::ms => fm.delay3.delay.delay;
700::ms => fm.delay4.delay.max;
700::ms => fm.delay4.delay.delay;

adc => fm.input;
0.4 => fm.dry.gain;
0.6 => fm.wet.gain;
fm.dry => gverb;
fm.wet => gverb;

gverb => dac;

Toggle toggle;
MoreRoom moreRoom;
LessRoom lessRoom;
MoreEarly moreEarly;
MoreTail moreTail;

StompKeyboard stomp;

toggle @=> stomp.button0Down;
moreRoom @=> stomp.button1Down;
lessRoom @=> stomp.button2Down;
moreEarly @=> stomp.button3Down;
moreTail @=> stomp.button4Down;

stomp.open(0);
