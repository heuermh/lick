/*

    LiCK  Library for ChucK.
    Copyright (c) 2007-2012 held jointly by the individual authors.

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

FeedbackMachines.fourMono(0.95) @=> FeedbackMachine fm;

1700::ms => fm.delay1.delay.max;
1700::ms => fm.delay1.delay.delay;
1300::ms => fm.delay2.delay.max;
1300::ms => fm.delay2.delay.delay;
1100::ms => fm.delay3.delay.max;
1100::ms => fm.delay3.delay.delay;
700::ms => fm.delay4.delay.max;
700::ms => fm.delay4.delay.delay;

adc => fm.input;
1.0 => fm.dry.gain;
0.0 => fm.wet.gain;
fm.dry => dac;
fm.wet => dac;

class Toggle extends Procedure
{
    0 => int state;

    fun void run()
    {
        if (state)
        {
            // todo:  spork a fade from wet to dry
            1.0 => fm.dry.gain;
            0.0 => fm.wet.gain;
            0 => state;
        }
        else
        {
            0.2 => fm.dry.gain;
            0.8 => fm.wet.gain;
            1 => state;
        }
        <<<fm.dry.gain(), fm.wet.gain()>>>;
    }
}

Toggle toggle;
StompKeyboard stomp;
toggle @=> stomp.button0Down;

stomp.open(0);
