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

TimeSignature.common(110) @=> TimeSignature t;

32.703 => float c;
Scales.majorBlues(c, "C") @=> Scale c_majorBlues;

Sauce s => dac;

1 => s.keyOff;
0.8 => s.sin;
0.0 => s.saw;
0.2 => s.depth;
s.adsr(t.s, t.q, 0.8, t.h);
s.env(t.q, t.h, 0.8, t.h);

while (true)
{
    Math.random2f(1.0, 1.8) => float g;
    <<<g>>>;
    g => s.over;
    c_majorBlues.sample() => s.freq;
    1 => s.keyOn;
    t.w => now;
    1 => s.keyOff;
    t.h => now;
}
