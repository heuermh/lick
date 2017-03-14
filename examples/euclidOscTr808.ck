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

EuclidOsc euclid;
// assign tr808 samples to noteOn OSC messages
euclid.addPattern("/eu/kickA", tr808.kickA.asIntIntProcedure(), noop);
euclid.addPattern("/eu/kickB", tr808.kickB.asIntIntProcedure(), noop);
euclid.addPattern("/eu/kickC", tr808.kickC.asIntIntProcedure(), noop);
euclid.addPattern("/eu/kickD", tr808.kickD.asIntIntProcedure(), noop);
euclid.addPattern("/eu/kickE", tr808.kickE.asIntIntProcedure(), noop);
euclid.addPattern("/eu/snareA", tr808.snareA.asIntIntProcedure(), noop);
euclid.addPattern("/eu/snareB", tr808.snareB.asIntIntProcedure(), noop);
euclid.addPattern("/eu/openHat", tr808.openHat.asIntIntProcedure(), noop);
euclid.addPattern("/eu/closedHat", tr808.closedHat.asIntIntProcedure(), noop);

euclid.connect();
<<<"ready">>>;

1::hour => now;
