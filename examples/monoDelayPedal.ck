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

MonoDelay d;
Gain wet;
Gain dry;

1.0 => dry.gain;
0.0 => wet.gain;

200::ms => d.delay.max;
200::ms => d.delay.delay;
0.95 => d.feedback.gain;
0.80 => d.output.gain;

adc => d.input;
adc => dry => dac;
d.output => wet => dac;

class Toggle extends Procedure
{
    0 => int state;

    fun void run()
    {
        if (state)
        {
            1.0 => dry.gain;
            0.0 => wet.gain;
            0 => state;
        }
        else
        {
            0.2 => dry.gain;
            0.8 => wet.gain;
            1 => state;
        }
        <<<dry.gain(), wet.gain()>>>;
    }
}

Toggle toggle;
StompKeyboard stomp;
toggle @=> stomp.button0Down;

stomp.open(0);
