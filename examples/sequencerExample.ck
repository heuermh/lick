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

Sequences.sequence(0.0, 0.25, 0.50, 0.75) @=> Sequence asc;
Sequences.sequence("1.0, 0.75, 0.50, 0.25, 0.0") @=> Sequence desc;

Msg msg;
TimeSignature.common(110) @=> TimeSignature t;

<<<"asc x4">>>;
Loops.loop(Sequencers.forward(asc, msg, t.e), t.q, 4).run();

<<<"desc x4">>>;
Loops.loop(Sequencers.forward(desc, msg, t.e), t.q, 4).run();

<<<"asc forwardReverse x2">>>;
Loops.loop(Sequencers.forwardReverse(asc, msg, t.e), t.q, 2).run();

<<<"asc forwardReverse skipTwo x4">>>;
Patterns.pattern("001") @=> Pattern skipTwo;
Loops.loop(Sequencers.forwardReverse(asc, skipTwo, msg, t.e), t.q, 4).run();

<<<"done">>>;
