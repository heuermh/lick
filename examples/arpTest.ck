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

class Msg extends FloatProcedure
{
    fun void run(float value)
    {
        <<<value>>>;
    }
}

110.0 => float a;

Msg msg;
Chords.minorThirteenth(a, "A") @=> Chord a_min13;
TimeSignature.common(110) @=> TimeSignature t;

t.w => now;

<<<"up x4">>>;
Loops.loop(Arpeggiators.up(a_min13, msg, t.s), t.e, 4).run();

<<<"down x4">>>;
Loops.loop(Arpeggiators.down(a_min13, msg, t.s), t.e, 4).run();

<<<"upDown x4">>>;
Loops.loop(Arpeggiators.upDown(a_min13, msg, t.s), t.e, 4).run();

<<<"downUp x4">>>;
Loops.loop(Arpeggiators.downUp(a_min13, msg, t.s), t.e, 4).run();

<<<"upDownRepeatLast x4">>>;
Loops.loop(Arpeggiators.upDownRepeatLast(a_min13, msg, t.s), t.e, 4).run();

<<<"downUpRepeatLast x4">>>;
Loops.loop(Arpeggiators.downUpRepeatLast(a_min13, msg, t.s), t.e, 4).run();

<<<"random x4">>>;
Loops.loop(Arpeggiators.random(a_min13, msg, t.s), t.e, 4).run();

<<<"done">>>;
