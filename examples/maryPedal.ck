/*

    LiCK  Library for ChucK.
    Copyright (c) 2007-2025 held jointly by the individual authors.

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

adc => Mary mary => dac;

1.0 => mary.mix;

class Toggle extends Procedure
{
    fun void run()
    {
        mary.toggle();
        <<<"running", mary.running()>>>;
    }
}

class IncreaseFreq extends Procedure
{
    fun void run()
    {
        mary.freq() * 1.1 => mary.freq;
        <<<"mary freq", mary.freq()>>>;
    }
}

class DecreaseFreq extends Procedure
{
    fun void run()
    {
        mary.freq() * 0.9 => mary.freq;
        <<<"mary freq", mary.freq()>>>;
    }
}

class IncreaseLfoRate extends Procedure
{
    fun void run()
    {
        mary.rate() * 1.1 => mary.rate;
        <<<"mary lfo rate", mary.rate()>>>;
    }
}

class DecreaseLfoRate extends Procedure
{
    fun void run()
    {
        mary.rate() * 0.9 => mary.rate;
        <<<"mary lfo rate", mary.rate()>>>;
    }
}

class IncreaseLfoDepth extends Procedure
{
    fun void run()
    {
        mary.depth() * 1.1 => mary.depth;
        <<<"mary lfo depth", mary.depth()>>>;
    }
}

class DecreaseLfoDepth extends Procedure
{
    fun void run()
    {
        mary.depth() * 0.9 => mary.depth;
        <<<"mary lfo depth", mary.depth()>>>;
    }
}

adc => mary => dac;

Toggle toggle;
IncreaseFreq increaseFreq;
DecreaseFreq decreaseFreq;
IncreaseLfoRate increaseLfoRate;
DecreaseLfoRate decreaseLfoRate;
IncreaseLfoDepth increaseLfoDepth;
DecreaseLfoDepth decreaseLfoDepth;

StompKeyboard stomp;
toggle @=> stomp.button0Down;
increaseFreq @=> stomp.button1Down;
decreaseFreq @=> stomp.button2Down;
increaseLfoRate @=> stomp.button3Down;
decreaseLfoRate @=> stomp.button4Down;
increaseLfoDepth @=> stomp.button5Down;
//decreaseLfoDepth @=> stomp.button6Down;

<<<"ready">>>;
stomp.open(0);
