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

CircleRamp circle => dac;

65.406 => float c;
Scales.majorBlues(c, "C") @=> Scale scale;
TimeSignature.common(100) @=> TimeSignature t;

circle.adsr.set(t.s, t.e, 0.8, t.s);

while (true)
{
    for (1 => int i; i < 16; i++)
    {
        t.f * i => circle.ramp;

        circle.noteOn(scale.sample());
        t.h => now;
        circle.noteOff();
        t.e => now;
    }
    t.accel(1.2, t.q);
}
