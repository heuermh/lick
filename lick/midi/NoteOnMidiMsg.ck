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

public class NoteOnMidiMsg extends MidiMsg
{
    {
        // set status byte, default to channel 1
        0x90 => data1;
    }

    fun void channel(int channel)
    {
        // update status byte, x in 9x
        ((0x9 & 0xf) << 4) | ((channel - 1) & 0xf) => data1;
    }

    fun void note(int note)
    {
        note & 0x7f => data2;
    }

    fun void velocity(int velocity)
    {
        velocity & 0x7f => data3;
    }
}
