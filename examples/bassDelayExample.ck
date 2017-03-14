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

BassDelay bd => dac;

2::second => bd.max;

2.0 => bd.x;
0.60 => bd.feedback;

41.203 => float e;
Scales.majorBlues(e, "E") @=> Scale scale;
TimeSignature.common(160) @=> TimeSignature t;

while (true)
{
    for (1 => int i; i < 5; i++)
    {
        //1.0 * i => bd.x;

        bd.noteOn(scale.sample());
        t.h => now;
        bd.noteOff();
        t.e => now;
    }
    t.accel(1.02, t.q);
    bd.feedback() * 1.02 => bd.feedback;
    <<<bd.feedback()>>>;
}
