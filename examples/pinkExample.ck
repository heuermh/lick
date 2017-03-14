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

Noise n;
0.2 => n.gain;
Pke pke;
Pk3 pk3;

SinOsc lfo1;
Swirl swirl1;
0.06 => lfo1.freq;
0.2 => lfo1.gain;
lfo1 => swirl1.cv;

SinOsc lfo2;
Swirl swirl2;
0.2 => lfo2.gain;
0.5 => lfo2.phase;
0.20 => lfo2.freq;
lfo2 => swirl2.cv;

Tremolo trem;
trem.sinLfo();
0.01 => trem.rate;
0.3 => trem.depth;

n => trem;
trem => pke => swirl1.input;
trem => pk3 => swirl2.input;

swirl1.outputL => dac.chan(0);
swirl1.outputR => dac.chan(1);

swirl2.outputL => dac.chan(0);
swirl2.outputR => dac.chan(1);

<<<"ready">>>;
1::minute => now;
