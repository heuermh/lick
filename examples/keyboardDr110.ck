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

ArrayList keyMapping;
keyMapping.size(256);
keyMapping.assign(bossDr110.kick);

// asdf, in US keyboard layout
keyMapping.set(30, bossDr110.kick);
keyMapping.set(31, bossDr110.kick);
keyMapping.set(32, bossDr110.kick);
keyMapping.set(33, bossDr110.kick);
// jkl;
keyMapping.set(36, bossDr110.snare);
keyMapping.set(37, bossDr110.snare);
keyMapping.set(38, bossDr110.snare);
keyMapping.set(39, bossDr110.snare);
// uio
keyMapping.set(22, bossDr110.crash);
keyMapping.set(23, bossDr110.clap);
keyMapping.set(24, bossDr110.pedalHat);
// gh
keyMapping.set(34, bossDr110.closedHat);
keyMapping.set(35, bossDr110.openHat);

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
