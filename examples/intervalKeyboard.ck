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

BeeThree bt => dac;
440 => bt.freq;

ArrayList keyMapping;
keyMapping.size(256);
keyMapping.assign(Intervals.unison());

// asdf, in US keyboard layout
keyMapping.set(30, Intervals.majorSeventh().desc());
keyMapping.set(31, Intervals.perfectFifth().desc());
keyMapping.set(32, Intervals.perfectFourth().desc());
keyMapping.set(33, Intervals.majorThird().desc());
// jkl;
keyMapping.set(36, Intervals.majorThird()); // asc() is default
keyMapping.set(37, Intervals.perfectFourth());
keyMapping.set(38, Intervals.perfectFifth());
keyMapping.set(39, Intervals.majorSeventh());

class KeyDown extends IntProcedure
{
    fun void run(int value)
    {
        keyMapping.get(value) $ Interval @=> Interval interval;
        interval.evaluate(bt.freq()) => bt.freq;
        bt.noteOn(1.0);
    }
}

class KeyUp extends IntProcedure
{
    fun void run(int value)
    {
        bt.noteOff(1.0);
    }
}

Keyboard keyboard;
KeyDown keyDown;
KeyUp keyUp;
keyDown @=> keyboard.keyDown;
keyUp @=> keyboard.keyUp;

keyboard.open(0);
