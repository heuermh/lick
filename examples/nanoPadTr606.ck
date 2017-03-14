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
RolandTr606 rolandTr606;

//rolandTr606.kick @=> nanoPad.button1 if ChucK supported multiple inheritance

// assign samples to buttons
rolandTr606.kick.asIntProcedure() @=> nanoPad.button1;
rolandTr606.kick.asIntProcedure() @=> nanoPad.button7;
rolandTr606.snare.asIntProcedure() @=> nanoPad.button2;
rolandTr606.snare.asIntProcedure() @=> nanoPad.button8;
rolandTr606.closedHat.asIntProcedure() @=> nanoPad.button3;
rolandTr606.openHat.asIntProcedure() @=> nanoPad.button9;
rolandTr606.crash.asIntProcedure() @=> nanoPad.button4;
rolandTr606.crash.asIntProcedure() @=> nanoPad.button10;
rolandTr606.middleTom.asIntProcedure() @=> nanoPad.button5;
rolandTr606.lowTom.asIntProcedure() @=> nanoPad.button11;
rolandTr606.highTom.asIntProcedure() @=> nanoPad.button6;
rolandTr606.kick.asIntProcedure() @=> nanoPad.button12;

// turn down gain on crash and hats
0.25 => rolandTr606.closedHat.maxGain;
0.25 => rolandTr606.openHat.maxGain;
0.25 => rolandTr606.crash.maxGain;

// add a little echo to snare
rolandTr606.snare.buf =< dac;
rolandTr606.snare.buf => Echo echo => dac;
1200::ms => echo.max;
800::ms => echo.delay;
0.20 => echo.mix;

nanoPad.open(0);
