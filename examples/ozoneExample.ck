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

class DumpPitch extends IntIntProcedure
{
    fun void run(int value0, int value1)
    {
        <<<"pitch", value0, value1>>>;
    }
}

class DumpMod extends IntProcedure
{
    fun void run(int value)
    {
        <<<"mod", value>>>;
    }
}

class DumpKeyOn extends IntIntProcedure
{
    fun void run(int value0, int value1)
    {
        <<<"keyOn", value0, value1>>>;
    }
}

class DumpKeyOff extends IntProcedure
{
    fun void run(int value)
    {
        <<<"keyOff", value>>>;
    }
}

class DumpSustainOn extends Procedure
{
    fun void run()
    {
        <<<"sustainOn">>>;
    }
}

class DumpSustainOff extends Procedure
{
    fun void run()
    {
        <<<"sustainOff">>>;
    }
}

DumpPitch pitch;
DumpMod mod;
DumpKeyOn keyOn;
DumpKeyOff keyOff;
DumpSustainOn sustainOn;
DumpSustainOff sustainOff;

MAudioOzone ozone;
pitch @=> ozone.pitchBend;
mod @=> ozone.modulation;
mod @=> ozone.rotary1;
mod @=> ozone.rotary2;
mod @=> ozone.rotary3;
mod @=> ozone.rotary4;
mod @=> ozone.rotary5;
mod @=> ozone.rotary6;
mod @=> ozone.rotary7;
mod @=> ozone.rotary8;
keyOn @=> ozone.keyOn;
keyOff @=> ozone.keyOff;
sustainOn @=> ozone.sustainPedalOn;
sustainOff @=> ozone.sustainPedalOff;
ozone.open(8);

1::minute => now;
