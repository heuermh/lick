/*

    LiCK  Library for ChucK.
    Copyright (c) 2007-2021 held jointly by the individual authors.

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

Duff duff => dac;

for (20.0 => float f; f < 2000.0; f * 2 => f)
{
    for (400.0 => float b; b > 80.0; b / 2.0 => b)
    {
        for (100::ms => dur d; d < 1400::ms; d + 400::ms => d)
        {
            for (10::ms => dur pd; pd < 100::ms; pd * 2.0 => pd)
            {
                for (0.0 => float s; s < 1.0; s + 0.333 => s)
                {
                    <<<f, b, d, pd, s>>>;
                    f => duff.freq;
                    b => duff.bend;
                    d => duff.decay;
                    pd => duff.pitchDecay;
                    s => duff.shape;
                    duff.play();

                    1500::ms => now;
                }
            }
        }
    }
}

<<<"done">>>;
