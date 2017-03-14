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

StereoDelay d;

200::ms => d.delayL.max;
200::ms => d.delayL.delay;
0.95 => d.feedbackL.gain;
0.80 => d.outputL.gain;

400::ms => d.delayR.max;
400::ms => d.delayR.delay;
0.95 => d.feedbackR.gain;
0.80 => d.outputR.gain;


BeeThree bt;
bt.noteOff(1.0);

bt => d.inputL;
bt => d.inputR;
d.outputL => dac.left;
d.outputR => dac.right;


500::ms => now;
for (0 => int i; i < 10; i++)
{
    <<<i>>>;
    bt.noteOn(1.0);
    800::ms => now;
    bt.noteOff(1.0);
    800::ms => now;
}

10::second => now;

<<<"done">>>;
