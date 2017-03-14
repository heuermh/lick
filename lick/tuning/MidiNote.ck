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

public class MidiNote
{
    int _note;
    string _name;
    string _simpleName;
    float _freq;
    string _names[12];

    {
        "C" => _names[0];
        "C#" => _names[1];
        "D" => _names[2];
        "Eb" => _names[3];
        "E" => _names[4];
        "F" => _names[5];
        "F#" => _names[6];
        "G" => _names[7];
        "G#" => _names[8];
        "A" => _names[9];
        "Bb" => _names[10];
        "B" => _names[11];
    }

    fun string _nameFor(int i)
    {
        return _names[i % 12] + (i / 12);
    }

    fun string _simpleNameFor(int i)
    {
        return _names[i % 12];
    }

    fun int note()
    {
        return _note;
    }

    fun string name()
    {
        return _name;
    }

    fun string simpleName()
    {
        return _simpleName;
    }

    fun float freq()
    {
        return _freq;
    }    

    fun void forEach(IntProcedure procedure)
    {
        procedure.run(_note);
    }

    fun void forEach(FloatProcedure procedure)
    {
        procedure.run(_freq);
    }

    fun MidiNote up()
    {
        return up(1);
    }

    fun MidiNote up(int halfSteps)
    {
        Constrain.constrain(_note + halfSteps, 0, 127) => int i;
        return forNote(i);
    }

    fun MidiNote down()
    {
        return down(1);
    }

    fun MidiNote down(int halfSteps)
    {
        Constrain.constrain(_note - halfSteps, 0, 127) => int i;
        return forNote(i);
    }

    fun static MidiNote forNote(int i)
    {
        MidiNote midiNote;
        return _create(i, midiNote._nameFor(i), midiNote._simpleNameFor(i), Std.mtof(i));
    }

    fun static MidiNote _create(int note, string name, string simpleName, float freq)
    {
        MidiNote midiNote;
        note => midiNote._note;
        name => midiNote._name;
        simpleName => midiNote._simpleName;
        freq => midiNote._freq;
    }
}
