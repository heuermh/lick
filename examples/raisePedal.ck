/*

    LiCK  Library for ChucK.
    Copyright (c) 2007-2014 held jointly by the individual authors.

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

adc => Raise raise => dac;

class Toggle extends Procedure
{
    fun void run()
    {
        raise.toggle();
        <<<"running", raise.running()>>>;
    }
}

class RaiseOctave extends Procedure
{
    fun void run()
    {
        Intervals.octave().desc() => raise.interval;
        raise.raise();
    }
}

class RaisePerfectFifth extends Procedure
{
    fun void run()
    {
        Intervals.perfectFifth().desc() => raise.interval;
        raise.raise();
    }
}

class RaiseMajorThird extends Procedure
{
    fun void run()
    {
        Intervals.majorThird().desc() => raise.interval;
        raise.raise();
    }
}

class RaiseMinorSecond extends Procedure
{
    fun void run()
    {
        Intervals.minorSecond().desc() => raise.interval;
        raise.raise();
    }
}

Toggle toggle;
RaiseOctave raiseOctave;
RaisePerfectFifth raisePerfectFifth;
RaiseMajorThird raiseMajorThird;
RaiseMinorSecond raiseMinorSecond;

StompKeyboard stomp;
toggle @=> stomp.button0Down;
raiseOctave @=> stomp.button1Down;
raisePerfectFifth @=> stomp.button2Down;
raiseMajorThird @=> stomp.button3Down;
raiseMinorSecond @=> stomp.button4Down;

stomp.open(0);