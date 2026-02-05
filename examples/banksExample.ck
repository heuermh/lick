/*

    LiCK  Library for ChucK.
    Copyright (c) 2007-2026 held jointly by the individual authors.

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

TimeSignature.common(90) @=> TimeSignature t;

Banks banks => ADSR adsr => dac;
adsr.set(10::ms, 8::ms, 0.8, t.w);

class Play extends FloatProcedure
{
    fun void run(float value)
    {
        value => banks.freq;
        adsr.keyOn();
    }
}

261.6256 => float c;
Chords.majorTriad(c, "C") @=> Chord c_maj;

<<<c_maj.description>>>;

Play play;
Arpeggiators.up(c_maj, play, t.q) @=> Arpeggiator upC;
Loops.loop(upC, 4).run();

<<<"done">>>;
