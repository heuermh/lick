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

@import "../lick/device/KorgSq64"
@import "../lick/drum/RolandTr808"

RolandTr808 tr808;
KorgSq64 korgSq64;

class KeyOn extends IntIntProcedure
{
    fun void run(int arg0, int arg1)
    {
        <<<"   keyOn ", arg0, arg1>>>;
    }
}

class KeyOff extends IntProcedure
{
    fun void run(int value)
    {
        <<<"   keyOff ", value>>>;
    }
}

class Play extends Procedure
{
    fun void run()
    {
        <<<"play">>>;
    }
}

class Stop extends Procedure
{
    fun void run()
    {
        <<<"stop">>>;
    }
}

KeyOn keyOn;
KeyOff keyOff;
Play play;
Stop stop;

keyOn @=> korgSq64.a.keyOn;
keyOff @=> korgSq64.a.keyOff;
keyOn @=> korgSq64.b.keyOn;
keyOff @=> korgSq64.b.keyOff;
keyOn @=> korgSq64.c.keyOn;
keyOff @=> korgSq64.c.keyOff;
//keyOn @=> korgSq64.d.keyOn;
//keyOff @=> korgSq64.d.keyOff;

play @=> korgSq64.play;
stop @=> korgSq64.stop;

tr808.kickA.asIntProcedure() @=> korgSq64.d1;
tr808.kickC.asIntProcedure() @=> korgSq64.d2;
tr808.kickE.asIntProcedure() @=> korgSq64.d3;
tr808.snareA.asIntProcedure() @=> korgSq64.d4;
tr808.snareB.asIntProcedure() @=> korgSq64.d5;
tr808.openHat.asIntProcedure() @=> korgSq64.d6;
tr808.closedHat.asIntProcedure() @=> korgSq64.d7;

korgSq64.open(1);
<<<"ready">>>;

1::hour => now;
