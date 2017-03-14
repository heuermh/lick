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

class KeyOn extends IntIntProcedure
{
    fun void run(int value0, int value1)
    {
        <<<"keyOn", value0, value1>>>;
    }
}

class KeyOff extends IntProcedure
{
    fun void run(int value)
    {
        <<<"keyOff", value>>>;
    }
}

KeyOn keyOn;
KeyOff keyOff;

AlesisQX25 qx25;
keyOn @=> qx25.keyOn;
keyOff @=> qx25.keyOff;

<<<"ready">>>;
qx25.open(1);
