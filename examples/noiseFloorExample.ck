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

Noise noise => dac.left;
noise => NoiseFloor noiseFloor => dac.right;

dac => WvOut2 out => blackhole;

"noiseFloorExample.wav" => out.wavFilename;

0.1f => noiseFloor.amount;
1::ms => noiseFloor.time;
0.001f => noiseFloor.noiseFloor;

2::second => now;

<<<"done">>>;
