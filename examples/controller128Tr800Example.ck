/*

    LiCK  Library for ChucK.
    Copyright (c) 2007-2021 held jointly by the individual authors.

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
Controller128 controller128;

tr808.kickA.asProcedure() @=> controller128.row1;
tr808.kickC.asProcedure() @=> controller128.row2;
tr808.kickE.asProcedure() @=> controller128.row3;
tr808.snareA.asProcedure() @=> controller128.row4;
tr808.snareB.asProcedure() @=> controller128.row5;
tr808.openHat.asProcedure() @=> controller128.row6;
tr808.closedHat.asProcedure() @=> controller128.row7;

controller128.open(0);
<<<"ready">>>;

1::hour => now;
