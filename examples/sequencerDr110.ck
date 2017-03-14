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

BossDr110 bossDr110;
TimeSignature.common(106) @=> TimeSignature t;

Patterns.pattern("x---------x-----") @=> Pattern kick;
Patterns.pattern("----x-------x---") @=> Pattern snare;
Patterns.pattern("--x---x-x-------") @=> Pattern closedHat;
Patterns.pattern("----------x---x-") @=> Pattern openHat;
Patterns.pattern("---------------x") @=> Pattern pedalHat;
Patterns.pattern("--------x-------") @=> Pattern clap;
Patterns.pattern("x---------------") @=> Pattern crash;
Patterns.pattern("----------------") @=> Pattern empty;

Sequences.sequence(1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0) @=> Sequence loud;
Sequences.sequence(0.4, 0.4, 0.4, 0.4, 0.4, 0.4, 0.4, 0.4, 0.4, 0.4, 0.4, 0.4, 0.4, 0.4, 0.5, 0.6) @=> Sequence quiet;

spork ~ Loops.loop(Sequencers.forward(loud, kick, bossDr110.kick.asFloatProcedure(), t.e), 8).run();
spork ~ Loops.loop(Sequencers.forward(loud, snare, bossDr110.snare.asFloatProcedure(), t.e), 8).run();
spork ~ Loops.loop(Sequencers.forward(quiet, closedHat, bossDr110.closedHat.asFloatProcedure(), t.e), 8).run();
spork ~ Loops.loop(Sequencers.forward(quiet, openHat, bossDr110.openHat.asFloatProcedure(), t.e), 8).run();
spork ~ Loops.loop(Sequencers.forward(quiet, pedalHat, bossDr110.pedalHat.asFloatProcedure(), t.e), 8).run();
spork ~ Loops.loop(Sequencers.forward(quiet, clap, bossDr110.clap.asFloatProcedure(), t.e), 8).run();
spork ~ Loops.loop(Sequencers.forward(loud, crash, bossDr110.crash.asFloatProcedure(), t.e), 8).run();

16 * t.w => now;

<<<"done">>>;
