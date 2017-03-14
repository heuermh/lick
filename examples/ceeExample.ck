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

SawOsc saw;
220.0 => saw.freq;

ADSR adsr;
adsr.set(10::ms, 300::ms, 0.9, 200::ms);

Cee cee;
0.01666 => cee.rate;

saw => adsr => cee => dac;

for (0 => int i; i < 10; i++)
{
    <<<"depth", cee.depth()>>>;
    for (0 => int j; j < 10; j++)
    {
        1 => adsr.keyOn;
        400::ms => now;
        1 => adsr.keyOff;
        300::ms => now;
    }
    cee.depth() * 1.2 => cee.depth;
}
