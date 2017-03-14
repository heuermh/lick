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

// AlesisQX25 --> MeeBlip micro MIDI mapping
MeeBlipMidi meeBlip;

-1 => int lastKey;

class KeyOn extends IntIntProcedure
{
    fun void run(int value0, int value1)
    {
        <<<"keyOn", value0, value1>>>;

        if (lastKey >= 0)
        {
            meeBlip.noteOff(lastKey, 0);
        }
        value0 => lastKey;
        meeBlip.noteOn(value0, value1);
    }
}

class KeyOff extends IntProcedure
{
    fun void run(int value)
    {
        <<<"keyOff", value>>>;
        meeBlip.noteOff(value, 0);
    }
}

class Modulation extends IntProcedure
{
    fun void run(int value)
    {
        <<<"oscDetune", value>>>;
        meeBlip.oscDetune(value);
    }
}

class Rotary1 extends IntProcedure
{
    fun void run(int value)
    {
        <<<"filterResonance", value>>>;
        meeBlip.filterResonance(value);
    }
}

class Rotary2 extends IntProcedure
{
    fun void run(int value)
    {
        <<<"filterCutoff", value>>>;
        meeBlip.filterCutoff(value);
    }
}

class Rotary3 extends IntProcedure
{
    fun void run(int value)
    {
        <<<"lfoFreq", value>>>;
        meeBlip.lfoFreq(value);
    }
}

class Rotary4 extends IntProcedure
{
    fun void run(int value)
    {
        <<<"lfoLevel", value>>>;
        meeBlip.lfoLevel(value);
    }
}

class Rotary5 extends IntProcedure
{
    fun void run(int value)
    {
        <<<"filterDecay", value>>>;
        meeBlip.filterDecay(value);
    }
}

class Rotary6 extends IntProcedure
{
    fun void run(int value)
    {
        <<<"filterAttack", value>>>;
        meeBlip.filterAttack(value);
    }
}

class Rotary7 extends IntProcedure
{
    fun void run(int value)
    {
        <<<"ampDecay", value>>>;
        meeBlip.ampDecay(value);
    }
}

class Rotary8 extends IntProcedure
{
    fun void run(int value)
    {
        <<<"ampAttack", value>>>;
        meeBlip.ampAttack(value);
    }
}

class Slider extends IntProcedure
{
    fun void run(int value)
    {
        <<<"portamento", value>>>;
        meeBlip.portamento(value);
    }
}

KeyOn keyOn;
KeyOff keyOff;
Modulation modulation;
Rotary1 rotary1;
Rotary2 rotary2;
Rotary3 rotary3;
Rotary4 rotary4;
Rotary5 rotary5;
Rotary6 rotary6;
Rotary7 rotary7;
Rotary8 rotary8;
Slider slider;

AlesisQX25 qx25;
keyOn @=> qx25.keyOn;
keyOff @=> qx25.keyOff;
modulation @=> qx25.modulation;
rotary1 @=> qx25.rotary1;
rotary2 @=> qx25.rotary2;
rotary3 @=> qx25.rotary3;
rotary4 @=> qx25.rotary4;
rotary5 @=> qx25.rotary5;
rotary6 @=> qx25.rotary6;
rotary7 @=> qx25.rotary7;
rotary8 @=> qx25.rotary8;
slider @=> qx25.slider;


// double-check in & out midi device lists with chuck --probe
meeBlip.open(1);
qx25.open(0);
