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

MotelSix six;

class Toggle extends Procedure
{
    fun void run()
    {
        six.toggle();
        <<<"running", six.running()>>>;
    }
}

class Trigger extends Procedure
{
    fun void run()
    {
        six.trigger();
    }
}

class IncreaseRate extends Procedure
{
    fun void run()
    {
        Constrain.constrainf(six.rate() * 1.1, 0.01, 20000.0) => six.rate;
        <<<"rate", six.rate()>>>;
    }
}

class DecreaseRate extends Procedure
{
    fun void run()
    {
        Constrain.constrainf(six.rate() * 0.9, 0.01, 20000.0) => six.rate;
        <<<"rate", six.rate()>>>;
    }
}

class TogglePitchShift extends Procedure
{
    0 => static int ON;
    1 => static int OFF;
    ON => int status;

    fun void run()
    {
        if (ON == status)
        {
            Intervals.unison() @=> six._pitchShiftInterval;
            OFF => status;
        }
        else
        {
            Intervals.octave().desc() @=> six._pitchShiftInterval;
            ON => status;
        }
        <<<"pitchShift", status>>>;
    }
}

adc => six => dac;

Toggle toggle;
Trigger trigger;
IncreaseRate increaseRate;
DecreaseRate decreaseRate;
TogglePitchShift togglePitchShift;

StompKeyboard stomp;
toggle @=> stomp.button0Down;
trigger @=> stomp.button1Down;
increaseRate @=> stomp.button2Down;
decreaseRate @=> stomp.button3Down;
togglePitchShift @=> stomp.button4Down;

stomp.open(0);

