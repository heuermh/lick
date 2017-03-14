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

RolandTr808 tr808;
IntIntProcedure noop;

EuclidMidi euclid;
// assign tr808 samples to noteOn MIDI messages by channel
euclid.addPattern(1, tr808.kickA.asIntIntProcedure(), noop);
euclid.addPattern(2, tr808.kickB.asIntIntProcedure(), noop);
euclid.addPattern(3, tr808.kickC.asIntIntProcedure(), noop);
euclid.addPattern(4, tr808.kickD.asIntIntProcedure(), noop);
euclid.addPattern(5, tr808.kickE.asIntIntProcedure(), noop);
euclid.addPattern(6, tr808.snareA.asIntIntProcedure(), noop);
euclid.addPattern(7, tr808.snareB.asIntIntProcedure(), noop);
euclid.addPattern(8, tr808.openHat.asIntIntProcedure(), noop);
euclid.addPattern(9, tr808.closedHat.asIntIntProcedure(), noop);

euclid.open(0);
<<<"ready">>>;

1::hour => now;
