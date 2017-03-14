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

// emulates the TwoPots midi device
public class TwoPots
{
    IntProcedure pot1; // cc 12
    IntProcedure pot2;  // cc 13
    IntProcedure pot1Msb; // cc 16
    IntProcedure pot1Lsb; // cc 48 (16+32)
    IntProcedure pot2Msb; // cc 17
    IntProcedure pot2Lsb; // cc 49 (17+32)

    fun int open(int device)
    {
        <<<"open", device>>>;
    }

    fun void lowColor1(int r, int g, int b)
    {
    }

    fun void highColor1(int r, int g, int b)
    {
    }

    fun void lowColor2(int r, int g, int b)
    {
    }

    fun void highColor2(int r, int g, int b)
    {
    }
}
