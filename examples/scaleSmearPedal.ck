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

0 => int interval;
440.0 => float root;
Scales.majorBlues(root) @=> Scale scale;

16 => int z;
0.8 => float m;
0.995 => float f;
ScaleSmear.create(z, m, f, scale) @=> ScaleSmear smear;

adc => smear => dac;
0.6 => smear.mix;

class Toggle extends Procedure
{
    fun void run()
    {
        smear.toggle();
        <<<"running", smear.running()>>>;
    }
}

class FreqUp extends Procedure
{
    fun void run()
    {
        <<<"freq up", smear.up()>>>;
    }
}

class FreqDown extends Procedure
{
    fun void run()
    {
        <<<"freq down", smear.down()>>>;
    }
}

class FeedbackUp extends Procedure
{
    fun void run()
    {
        <<<"feedback up", smear.feedbackUp()>>>;
    }
}

class FeedbackDown extends Procedure
{
    fun void run()
    {
        <<<"feedback down", smear.feedbackDown()>>>;
    }
}

class SmearUp extends Procedure
{
    fun void run()
    {
        <<<"smear up", smear.smearUp()>>>;
    }
}

class SmearDown extends Procedure
{
    fun void run()
    {
        <<<"smear down", smear.smearDown()>>>;
    }
}

Toggle toggle;
FreqUp freqUp;
FreqDown freqDown;
FeedbackUp feedbackUp;
FeedbackDown feedbackDown;
SmearUp smearUp;
SmearDown smearDown;

StompKeyboard stomp;
toggle @=> stomp.button0Down;
freqUp @=> stomp.button1Down;
freqDown @=> stomp.button2Down;
feedbackUp @=> stomp.button3Down;
feedbackDown @=> stomp.button4Down;
//smearUp @=> stomp.button5Down;
//smearDown @=> stomp.button6Down;

stomp.open(0);
