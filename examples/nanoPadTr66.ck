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

NanoPad nanoPad;
RolandTr66 rolandTr66;

//rolandTr66.kick @=> nanoPad.button1 if ChucK supported multiple inheritance

// assign samples to buttons
rolandTr66.kick.asIntProcedure() @=> nanoPad.button1;
rolandTr66.kick.asIntProcedure() @=> nanoPad.button7;
rolandTr66.snare.asIntProcedure() @=> nanoPad.button2;
rolandTr66.snare.asIntProcedure() @=> nanoPad.button8;
rolandTr66.closedHat.asIntProcedure() @=> nanoPad.button3;
rolandTr66.openHat.asIntProcedure() @=> nanoPad.button9;
rolandTr66.crash.asIntProcedure() @=> nanoPad.button4;
rolandTr66.rim.asIntProcedure() @=> nanoPad.button10;
rolandTr66.lowConga.asIntProcedure() @=> nanoPad.button5;
rolandTr66.highConga.asIntProcedure() @=> nanoPad.button11;
rolandTr66.kick.asIntProcedure() @=> nanoPad.button6;
rolandTr66.kick.asIntProcedure() @=> nanoPad.button12;

// turn down gain on crash and hats
0.25 => rolandTr66.closedHat.maxGain;
0.25 => rolandTr66.openHat.maxGain;
0.25 => rolandTr66.crash.maxGain;

nanoPad.open(0);
