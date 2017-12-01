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

CircleRamp circleRamp => dac;

class KeyOn extends IntIntProcedure
{
    fun void run(int value0, int value1)
    {
        <<<"keyOn", value0, value1>>>;
        value0 => circleRamp.noteOn;
    }
}

class KeyOff extends IntProcedure
{
    fun void run(int value)
    {
        <<<"keyOff", value>>>;
        circleRamp.noteOff();
    }
}

KeyOn keyOn;
KeyOff keyOff;

RolandA49 a49;
keyOn @=> a49.keyOn;
keyOff @=> a49.keyOff;

<<<"ready">>>;
a49.open(1);
