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

1::second => now;

SeptSubGen sept;
sept.outputL => dac.left;
sept.outputR => dac.right;

0.8 => sept.outputL.gain;
0.8 => sept.outputR.gain;

30.0 => sept.freq;
2.0 => sept.freqSpread;
0.0 => sept.phase;
0.0 => sept.phaseSpread;

-1.0 => sept.gen1.pan.pan;
1.0 => sept.gen2.pan.pan;

200::ms => sept.gen3.delay.delayL.max;
200::ms => sept.gen3.delay.delayR.max;
200::ms => sept.gen3.delay.delayL.delay;
200::ms => sept.gen3.delay.delayR.delay;

300::ms => sept.gen4.delay.delayL.max;
300::ms => sept.gen4.delay.delayR.max;
300::ms => sept.gen4.delay.delayL.delay;
300::ms => sept.gen4.delay.delayR.delay;

0.1 => sept.gen3.delay.feedbackL.gain;
0.1 => sept.gen3.delay.feedbackR.gain;

0.2 => sept.gen4.delay.feedbackL.gain;
0.2 => sept.gen4.delay.feedbackR.gain;

0.72 => sept.gen0.sinOsc.gain;
0.04 => sept.gen0.sqrOsc.gain;
0.12 => sept.gen0.triOsc.gain;
0.12 => sept.gen0.sawOsc.gain;

for (0 => int i; i < 14; i++)
{
    4::second => now;

    sept.gen3.delay.feedbackL.gain() * 1.1 => sept.gen3.delay.feedbackL.gain;
    sept.gen3.delay.feedbackR.gain() * 1.1 => sept.gen3.delay.feedbackR.gain;

    sept.gen4.delay.feedbackL.gain() * 1.1 => sept.gen4.delay.feedbackL.gain;
    sept.gen4.delay.feedbackR.gain() * 1.1 => sept.gen4.delay.feedbackR.gain;

    sept.freqSpread(sept.freqSpread() + 1);
}

<<<"done">>>;
