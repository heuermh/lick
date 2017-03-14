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

adc => Vibrato vibrato => dac;

0.9 => vibrato.mix;

class Toggle extends Procedure
{
    fun void run()
    {
        vibrato.toggle();
        <<<"running", vibrato.running()>>>;
    }
}

class IncreaseRate extends Procedure
{
    fun void run()
    {
        Constrain.constrainf(vibrato.rate() * 1.1, 2.0, 8.0) => vibrato.rate;
        <<<"rate", vibrato.rate()>>>;
    }
}

class DecreaseRate extends Procedure
{
    fun void run()
    {
        Constrain.constrainf(vibrato.rate() * 0.9, 2.0, 8.0) => vibrato.rate;
        <<<"rate", vibrato.rate()>>>;
    }
}

class IncreaseLfoRate extends Procedure
{
    fun void run()
    {
        vibrato.lfoRate() * 1.1 => vibrato.lfoRate;
        <<<"lfo rate", vibrato.lfoRate()>>>;
    }
}

class DecreaseLfoRate extends Procedure
{
    fun void run()
    {
        vibrato.lfoRate() * 0.9 => vibrato.lfoRate;
        <<<"lfo rate", vibrato.lfoRate()>>>;
    }
}

Toggle toggle;
IncreaseRate increaseRate;
DecreaseRate decreaseRate;
IncreaseLfoRate increaseLfoRate;
DecreaseLfoRate decreaseLfoRate;

StompKeyboard stomp;
toggle @=> stomp.button0Down;
increaseRate @=> stomp.button1Down;
decreaseRate @=> stomp.button2Down;
increaseLfoRate @=> stomp.button3Down;
decreaseLfoRate @=> stomp.button4Down;

stomp.open(0);
