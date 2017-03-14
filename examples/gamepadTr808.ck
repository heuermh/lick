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

RolandTr808 rolandTr808;
LogitechGamepadF310 gamepad;

class PlayKick extends FloatProcedure
{
    fun void run(float value)
    {
        if (gamepad.isDPadUp())
        {
            rolandTr808.kickA.play();
        }
        if (gamepad.isDPadDown())
        {
            rolandTr808.kickE.play();
        }
        if (gamepad.isDPadLeft())
        {
            rolandTr808.kickC.play();
        }
        if (gamepad.isDPadRight())
        {
            rolandTr808.kickD.play();
        }
    }
}

rolandTr808.snareD.asProcedure() @=> gamepad.aDown;
rolandTr808.crash.asProcedure() @=> gamepad.bDown;
rolandTr808.snareE.asProcedure() @=> gamepad.xDown;
rolandTr808.openHat.asProcedure() @=> gamepad.yDown;
rolandTr808.highTom.asProcedure() @=> gamepad.lbDown;
rolandTr808.middleTom.asProcedure() @=> gamepad.ltDown;
rolandTr808.lowTom.asProcedure() @=> gamepad.rbDown;
rolandTr808.closedHat.asProcedure() @=> gamepad.rtDown;

PlayKick playKick;
playKick @=> gamepad.dPad;

gamepad.open(0);
