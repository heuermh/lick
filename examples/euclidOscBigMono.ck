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
IntIntProcedure noop;

EuclidOsc euclid;
// assign big mono samples to noteOn OSC messages
euclid.addPattern("/eu/kick", bigMono.kick.asIntIntProcedure(), noop);
euclid.addPattern("/eu/snare", bigMono.snare.asIntIntProcedure(), noop);
euclid.addPattern("/eu/hardSnare", bigMono.hardSnare.asIntIntProcedure(), noop);
euclid.addPattern("/eu/openHat", bigMono.openHat.asIntIntProcedure(), noop);
euclid.addPattern("/eu/closedHat", bigMono.closedHat.asIntIntProcedure(), noop);
euclid.addPattern("/eu/crash", bigMono.crash.asIntIntProcedure(), noop);
euclid.addPattern("/eu/darkCrash", bigMono.darkCrash.asIntIntProcedure(), noop);

euclid.connect();
<<<"ready">>>;

1::hour => now;
