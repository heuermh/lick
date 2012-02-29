/*

    LiCK  Library for ChucK.
    Copyright (c) 2007-2012 held jointly by the individual authors.

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

BigMono bigMono;
TimeSignature.common(98) @=> TimeSignature t;

spork ~ Loops.loop(bigMono.kick.asProcedure(), t.half(), t.bar * 8).run();
spork ~ Loops.loop(bigMono.kick.asProcedure(), t.whole() + t.eighth(), t.whole() + t.half(), t.bar * 2).run();
spork ~ Loops.loop(bigMono.snare.asProcedure(), t.quarter(), t.half(), t.bar * 8).run();

// humanize eighth notes
t.eighthProvider() @=> HumanizedDurProvider eighth;
0.0025 => eighth.anticipation;
0.005 => eighth.delay;

spork ~ Loops.loop(bigMono.closedHat.asProcedure(), t.whole(), eighth, t.bar * 4 * 8).run();

1::minute => now;