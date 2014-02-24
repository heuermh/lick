/*

    LiCK  Library for ChucK.
    Copyright (c) 2007-2014 held jointly by the individual authors.

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

public class MidiNotes
{
    static MidiNote @ notes[127];

    //static
    {
        MidiNote.create(0, "C0", "C", Std.mtof(0)) @=> notes[0];
        // ...
    }

    fun static MidiNote note(int i)
    {
        return notes[i];
    }

    // would rather these were on MidiNote, but that creates a circular dependency
    fun static MidiNote up(MidiNote n)
    {
        return up(n, 1);
    }

    fun static MidiNote up(MidiNote n, int halfSteps)
    {
        Constrain.constrain(n.note() + halfSteps, 0, 127) => int i;
        return note(i);
    }

    fun static MidiNote down(MidiNote n)
    {
        return down(n, 1);
    }

    fun static MidiNote down(MidiNote n, int halfSteps)
    {
        Constrain.constrain(n.note() - halfSteps, 0, 127) => int i;
        return note(i);
    }
}