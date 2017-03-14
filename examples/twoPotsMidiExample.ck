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

TriOsc tri1 => dac;
TriOsc tri2 => dac;

1.0 => tri1.gain;
1.0 => tri2.gain;

class Tri1 extends IntProcedure
{
    fun void run(int value)
    {
        220.0 * value => tri1.freq;
    }
}

class Tri2 extends IntProcedure
{
    fun void run(int value)
    {
        55.1 * value => tri2.freq;
    }
}

TwoPotsMidi twoPotsMidi;
Tri1 _tri1;
Tri2 _tri2;
_tri1 @=> twoPotsMidi.pot1;
_tri2 @=> twoPotsMidi.pot2;

twoPotsMidi.open(0);
