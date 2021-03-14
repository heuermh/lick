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
RolandA49 keyboard;

200.0 => duff.bend;
400::ms => duff.decay;
100::ms => duff.pitchDecay;

class Decay extends IntProcedure
{
    fun void run(int cc)
    {
        <<<"decay", cc>>>;
        Interpolate.linear(cc, 0.0, 127.0, 0.0, 1.0) * 1800::ms + 200::ms => duff.decay;
    }
}

class Shape extends IntProcedure
{
    fun void run(int cc)
    {
        <<<"shape", cc>>>;
        Interpolate.linear(cc, 0.0, 127.0, 0.0, 1.0) => duff.shape;
    }
}

class Modulation extends IntProcedure
{
    fun void run(int cc)
    {
        <<<"bend", cc>>>;
        Interpolate.linear(cc, 0.0, 127.0, 200.0, 2000.0) => duff.bend;
    }
}

class PitchBend extends IntIntProcedure
{
    fun void run(int cc1, int cc2)
    {
        <<<"pitchDecay", cc2>>>;
        Interpolate.linear(cc2, 0.0, 127.0, -0.4, 1.0) * 200::ms + 100::ms => duff.pitchDecay;
    }
}

class KeyOn extends IntIntProcedure
{
    fun void run(int note, int velocity)
    {
        <<<"keyOn", note, velocity>>>;
        Std.mtof(note) => duff.freq;
        Interpolate.linear(velocity, 0.0, 127.0, 0.0, 1.0) => duff._vca.gain;
        duff.play();
    }
}

Decay decay;
Shape shape;
Modulation modulation;
PitchBend pitchBend;
KeyOn keyOn;

decay @=> keyboard.rotary1;
shape @=> keyboard.rotary2;
modulation @=> keyboard.modulation;
pitchBend @=> keyboard.pitchBend;
keyOn @=> keyboard.keyOn;

<<<"ready">>>;
keyboard.open(0);
