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

StereoFeedbackMachine fm;

1200::ms => fm.delay1.delayL.max;
1200::ms => fm.delay1.delayL.delay;
0.40 => fm.delay1.feedbackL.gain;
0.80 => fm.delay1.outputL.gain;

1100::ms => fm.delay1.delayR.max;
1100::ms => fm.delay1.delayR.delay;
0.40 => fm.delay1.feedbackR.gain;
0.80 => fm.delay1.outputR.gain;

1600::ms => fm.delay2.delayL.max;
1600::ms => fm.delay2.delayL.delay;
0.40 => fm.delay2.feedbackL.gain;
0.80 => fm.delay2.outputL.gain;

1800::ms => fm.delay2.delayR.max;
1800::ms => fm.delay2.delayR.delay;
0.40 => fm.delay2.feedbackR.gain;
0.80 => fm.delay2.outputR.gain;

200::ms => fm.delay3.delayL.max;
200::ms => fm.delay3.delayL.delay;
0.90 => fm.delay3.feedbackL.gain;
0.80 => fm.delay3.outputL.gain;

100::ms => fm.delay3.delayR.max;
100::ms => fm.delay3.delayR.delay;
0.90 => fm.delay3.feedbackR.gain;
0.80 => fm.delay3.outputR.gain;

300::ms => fm.delay4.delayL.max;
300::ms => fm.delay4.delayL.delay;
0.90 => fm.delay4.feedbackL.gain;
0.80 => fm.delay4.outputL.gain;

500::ms => fm.delay4.delayR.max;
500::ms => fm.delay4.delayR.delay;
0.90 => fm.delay4.feedbackR.gain;
0.80 => fm.delay4.outputR.gain;

0.1 => fm.route1Lto2L.gain;
0.0 => fm.route1Lto3L.gain;
0.3 => fm.route1Lto4L.gain;
0.0 => fm.route2Lto1L.gain;
0.1 => fm.route2Lto3L.gain;
0.0 => fm.route2Lto4L.gain;
0.0 => fm.route3Lto1L.gain;
0.2 => fm.route3Lto2L.gain;
0.1 => fm.route3Lto4L.gain;
0.0 => fm.route4Lto1L.gain;
0.3 => fm.route4Lto2L.gain;
0.0 => fm.route4Lto3L.gain;

0.0 => fm.route1Rto2R.gain;
0.1 => fm.route1Rto3R.gain;
0.0 => fm.route1Rto4R.gain;
0.3 => fm.route2Rto1R.gain;
0.1 => fm.route2Rto3R.gain;
0.0 => fm.route2Rto4R.gain;
0.2 => fm.route3Rto1R.gain;
0.0 => fm.route3Rto2R.gain;
0.0 => fm.route3Rto4R.gain;
0.1 => fm.route4Rto1R.gain;
0.0 => fm.route4Rto2R.gain;
0.3 => fm.route4Rto3R.gain;


BeeThree bt;
bt.noteOff(1.0);

bt => fm.inputL;
bt => fm.inputR;

0.1 => fm.dryL.gain;
0.1 => fm.dryR.gain;
0.9 => fm.wetL.gain;
0.9 => fm.wetR.gain;

fm.dryL => dac.left;
fm.dryR => dac.right;
fm.wetL => dac.left;
fm.wetR => dac.right;


500::ms => now;
for (0 => int i; i < 10; i++)
{
    <<<i>>>;
    bt.noteOn(1.0);
    800::ms => now;
    bt.noteOff(1.0);
    800::ms => now;
}

12::second => now;

<<<"done">>>;
