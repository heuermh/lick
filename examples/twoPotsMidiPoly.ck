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

class Freq extends IntProcedure
{
    fun void run(int value)
    {
        22.0 * value => poly.freq;
    }
}

class Filter extends IntProcedure
{
    fun void run(int value)
    {
        (value/255.0) => lpfL.Q;
        220.0 * value => lpfL.freq;

        (value/255.0) => lpfR.Q;
        220.0 * value => lpfR.freq;
    }
}

TwoPotsMidi twoPotsMidi;
Freq freq;
Filter filter;
freq @=> twoPotsMidi.pot1;
filter @=> twoPotsMidi.pot2;

twoPotsMidi.open(0);
