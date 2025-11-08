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

SinOsc sin => Offset offset => Bezier bezier => dac;

440.0 => sin.freq;
0.5 => sin.gain;
0.5 => offset.offset;

SqrOsc oscA => bezier.a;
SinOsc oscB => bezier.b;
Step stepC => bezier.c;
SinOsc oscD => bezier.d;

0.5 => oscA.gain;
0.5 => oscD.gain;

110.0 => oscA.freq;
0.2837 => oscB.freq;
0.827 => oscD.freq;

0.7 => stepC.next;

<<<"ready...">>>;
1::minute => now;
<<<"done">>>;
