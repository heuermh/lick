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

FeedbackMachines.dualPingpong(0.8) @=> FeedbackMachine fm;

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
fm.dry => dac;
fm.wet => dac;

fm.stop();

class Toggle extends Procedure
{
    fun void run()
    {
        fm.toggle();
        <<<"running",fm.running>>>;
    }
}

Toggle toggle;
StompKeyboard stomp;
toggle @=> stomp.button0Down;

stomp.open(0);
