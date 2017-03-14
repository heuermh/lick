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

SinOsc lfo0;
0.3 => lfo0.freq;
0.8 => lfo0.gain;

SqrOsc lfo1;
1.0 => lfo1.freq;
0.1 => lfo1.gain;

TriOsc lfo2;
0.7 => lfo2.freq;
0.1 => lfo2.gain;

Swirl swirl;

adc => swirl.input;
lfo0 => swirl.cv;
lfo1 => swirl.cv;
lfo2 => swirl.cv;
swirl.outputL => dac.chan(0);
swirl.outputR => dac.chan(1);

class Toggle extends Procedure
{
    fun void run()
    {
        swirl.toggle();
        <<<"running", swirl.running()>>>;
    }
}

class IncreaseLfo0Freq extends Procedure
{
    fun void run()
    {
        lfo0.freq() * 1.1 => lfo0.freq;
        <<<"lfo0 freq", lfo0.freq()>>>;
    }
}

class DecreaseLfo0Freq extends Procedure
{
    fun void run()
    {
        lfo0.freq() * 0.9 => lfo0.freq;
        <<<"lfo0 freq", lfo0.freq()>>>;
    }
}

class IncreaseLfo1Freq extends Procedure
{
    fun void run()
    {
        lfo1.freq() * 1.1 => lfo1.freq;
        <<<"lfo1 freq", lfo1.freq()>>>;
    }
}

class DecreaseLfo1Freq extends Procedure
{
    fun void run()
    {
        lfo1.freq() * 0.9 => lfo1.freq;
        <<<"lfo1 freq", lfo1.freq()>>>;
    }
}

Toggle toggle;
IncreaseLfo0Freq increaseLfo0Freq;
DecreaseLfo0Freq decreaseLfo0Freq;
IncreaseLfo1Freq increaseLfo1Freq;
DecreaseLfo1Freq decreaseLfo1Freq;

StompKeyboard stomp;
toggle @=> stomp.button0Down;
increaseLfo0Freq @=> stomp.button1Down;
decreaseLfo0Freq @=> stomp.button2Down;
increaseLfo1Freq @=> stomp.button3Down;
decreaseLfo1Freq @=> stomp.button4Down;

stomp.open(0);
