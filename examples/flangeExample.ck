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

@import "../lick/effect/Blueshift"

adc => Blueshift flange => dac;

0.8 => flange.mix;
1.0 => flange.rate;
0.8 => flange.depth;

<<<"sinLfo">>>;
flange.sinLfo();
1::minute => now;

<<<"triLfo">>>;
flange.triLfo();
1::minute => now;

<<<"sqrLfo">>>;
flange.sqrLfo();
1::minute => now;

<<<"done">>>;
