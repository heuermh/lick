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

class FloatMsg extends FloatProcedure
{
    fun void run(float value)
    {
        <<<value>>>;
    }
}
class IntMsg extends IntProcedure
{
    fun void run(int value)
    {
        <<<value>>>;
    }
}

Patterns.pattern("1") @=> Pattern all;
Patterns.pattern("01") @=> Pattern alternate;
Patterns.pattern("001") @=> Pattern skipTwo;
Patterns.pattern("000000001") @=> Pattern long;

IntMsg intMsg;
<<<"all">>>;
all.pattern.forEach(intMsg);

<<<"alternate">>>;
alternate.pattern.forEach(intMsg);

<<<"skipTwo">>>;
skipTwo.pattern.forEach(intMsg);

<<<"long">>>;
long.pattern.forEach(intMsg);

110.0 => float a;

FloatMsg msg;
Chords.minorThirteenth(a, "A") @=> Chord a_min13;
TimeSignature.common(110) @=> TimeSignature t;

t.w => now;

<<<"up x4 all">>>;
Loops.loop(Arpeggiators.up(a_min13, all, msg, t.e), t.q, 4).run();

<<<"up x4 alternate">>>;
Loops.loop(Arpeggiators.up(a_min13, alternate, msg, t.e), t.q, 4).run();

<<<"up x4 skipTwo">>>;
Loops.loop(Arpeggiators.up(a_min13, skipTwo, msg, t.e), t.q, 4).run();

<<<"up x4 long">>>;
Loops.loop(Arpeggiators.up(a_min13, long, msg, t.e), t.q, 4).run();

<<<"done">>>;
