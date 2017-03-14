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

BigMono bigMono;
TimeSignature.common(130) @=> TimeSignature t;

spork ~ Loops.loop(bigMono.kick, t.half(), t.bar * 8).run();
spork ~ Loops.loop(bigMono.kick, t.whole() + t.eighth(), t.whole() + t.half(), t.bar * 2).run();
spork ~ Loops.loop(bigMono.snare, t.quarter(), t.half(), t.bar * 8).run();

// humanize eighth notes
t.eighthProvider() @=> HumanizedDurProvider eighth;
0.000125 => eighth.anticipation;
0.0025 => eighth.delay;

spork ~ Loops.loop(bigMono.closedHat, t.whole(), eighth, t.bar * 4 * 8).run();

<<<"waiting three whole notes . . .">>>;
3 * t.w => now;

<<<"changing tempo to 60 bpm immediately . . .">>>;
<<<"   (note that only loops based on dur providers are affected)">>>;
t.tempo(65);

<<<"waiting two whole notes . . .">>>;
2 * t.w => now;

<<<"changing tempo back to 130 bpm immediately . . .">>>;
t.tempo(130);

<<<"waiting two whole notes . . .">>>;
2 * t.w => now;

<<<"sporking tempo decrease by half over six whole notes (at current tempo) . . .">>>;
spork ~ t.decel(0.5, t.w * 6);

1::minute => now;
