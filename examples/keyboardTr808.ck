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

ArrayList keyMapping;
keyMapping.size(256);
keyMapping.assign(rolandTr808.kickA);

// asdf, in US keyboard layout
keyMapping.set(30, rolandTr808.kickB);
keyMapping.set(31, rolandTr808.kickC);
keyMapping.set(32, rolandTr808.kickD);
keyMapping.set(33, rolandTr808.kickE);
// jkl;
keyMapping.set(36, rolandTr808.snareE);
keyMapping.set(37, rolandTr808.snareD);
keyMapping.set(38, rolandTr808.snareC);
keyMapping.set(39, rolandTr808.snareB);
// wer
keyMapping.set(17, rolandTr808.lowTom);
keyMapping.set(18, rolandTr808.middleTom);
keyMapping.set(19, rolandTr808.highTom);
// uio
keyMapping.set(22, rolandTr808.crash);
keyMapping.set(23, rolandTr808.rim);
keyMapping.set(24, rolandTr808.clap);
// gh
keyMapping.set(34, rolandTr808.closedHat);
keyMapping.set(35, rolandTr808.openHat);

class KeyDown extends IntProcedure
{
    fun void run(int value)
    {
        keyMapping.get(value) $ Sample @=> Sample sample;
        sample.play();
    }
}

Keyboard keyboard;
KeyDown keyDown;
keyDown @=> keyboard.keyDown;

keyboard.open(0);
