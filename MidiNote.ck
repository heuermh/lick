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

public class MidiNote
{
    int _note;
    string _name;
    string _simpleName;
    float _freq;

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

    fun static MidiNote create(int note, string name, string simpleName, float freq)
    {
        MidiNote midiNote;
        note => midiNote._note;
        name => midiNote._name;
        simpleName => midiNote._simpleName;
        freq => midiNote._freq;
    }
}