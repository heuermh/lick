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

Poly poly;

poly.outputL => LPF lpfL => dac.left;
poly.outputR => LPF lpfR => dac.right;

<<<"ready">>>;
20.0 => float f;
220.0 => float cutoff;
0.1 => float resonance;
while (true)
{
    f => poly.freq;
    for (0 => int i; i < 100; i++)
    {
        220.0 + (220.0 * i) => lpfL.freq;
        110.0 + (110.0 * i) => lpfR.freq;
        0.1 + (i * 0.01) => lpfL.Q;
        0.0 + (i * 0.01) => lpfR.Q;        
        100::ms => now;
    }
    f * 2 => f;
}
