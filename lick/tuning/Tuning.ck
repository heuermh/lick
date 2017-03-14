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

public class Tuning
{
    MidiNote @ _std[6];
    MidiNote @ strings[6];
    "Standard" => string name;
    "E A D G B E" => string description;
    "s s s s s s" => string delta;

    {
        MidiNote.forNote(52) @=> _std[0];
        MidiNote.forNote(57) @=> _std[1];
        MidiNote.forNote(62) @=> _std[2];
        MidiNote.forNote(67) @=> _std[3];
        MidiNote.forNote(71) @=> _std[4];
        MidiNote.forNote(76) @=> _std[5];

        _std @=> strings;
    }

    fun void init()
    {
        strings[0].simpleName + " " + strings[1].simpleName + " " +
            strings[2].simpleName + " " + strings[3].simpleName + " " +
            strings[4].simpleName + " " + strings[5].simpleName => description;

        _delta(0) + " " + _delta(1) + " " + _delta(2) + " " +
            _delta(3) + " " + _delta(4) + " " + _delta(5) => delta;
    }

    fun string _delta(int index)
    {
        _std[index] @=> MidiNote stdMidiNote;
        strings[index] @=> MidiNote midiNote;
        stdMidiNote.simpleName() => string s;
        if (midiNote.note() == stdMidiNote.note())
        {
            return s;
        }
        else if (midiNote.note() < stdMidiNote.note())
        {
            return s + "d" + (stdMidiNote.note() - midiNote.note());
        }
        return s + "u" + (midiNote.note() - stdMidiNote.note());
    }

    fun MidiNote sample()
    {
        Std.rand2(0, 5) => int i;
        return strings[i];
    }

    fun int sampleNote()
    {
        return sample().note();
    }

    fun float sampleFreq()
    {
        return sample().freq();
    }

    fun void forEach(IntProcedure procedure)
    {
        for (0 => int i; i < 6; i++)
        {
            spork ~ strings[i].forEach(procedure);
        }
    }

    fun void forEach(FloatProcedure procedure)
    {
        for (0 => int i; i < 6; i++)
        {
            spork ~ strings[i].forEach(procedure);
        }
    }

    fun void fret(int s1, int s2, int s3, int s4, int s5, int s6, IntProcedure procedure)
    {
        if (s1 >= 0)
        {
            spork ~ procedure.run(strings[0].note() + s1);
        }
        if (s2 >= 0)
        {
            spork ~ procedure.run(strings[1].note() + s2);
        }
        if (s3 >= 0)
        {
            spork ~ procedure.run(strings[2].note() + s3);
        }
        if (s4 >= 0)
        {
            spork ~ procedure.run(strings[3].note() + s4);
        }
        if (s5 >= 0)
        {
            spork ~ procedure.run(strings[4].note() + s5);
        }
        if (s6 >= 0)
        {
            spork ~ procedure.run(strings[5].note() + s6);
        }
    }

    fun void fret(int s1, int s2, int s3, int s4, int s5, int s6, FloatProcedure procedure)
    {
        if (s1 >= 0)
        {
            spork ~ procedure.run(Std.mtof(strings[0].note() + s1));
        }
        if (s2 >= 0)
        {
            spork ~ procedure.run(Std.mtof(strings[1].note() + s2));
        }
        if (s3 >= 0)
        {
            spork ~ procedure.run(Std.mtof(strings[2].note() + s3));
        }
        if (s4 >= 0)
        {
            spork ~ procedure.run(Std.mtof(strings[3].note() + s4));
        }
        if (s5 >= 0)
        {
            spork ~ procedure.run(Std.mtof(strings[4].note() + s5));
        }
        if (s6 >= 0)
        {
            spork ~ procedure.run(Std.mtof(strings[5].note() + s6));
        }
    }


    // with style methods, must assign return value

    fun Tuning up()
    {
        return up(1);
    }

    fun Tuning up(int halfSteps)
    {
        return create(name + "(up " + halfSteps + " half steps)",
            strings[0].note() + halfSteps, strings[1].note() + halfSteps,
            strings[2].note() + halfSteps, strings[3].note() + halfSteps,
            strings[4].note() + halfSteps, strings[5].note() + halfSteps);
    }

    fun Tuning down()
    {
        return down(1);
    }

    fun Tuning down(int halfSteps)
    {
        return create(name + " (down " + halfSteps + " half steps)",
            strings[0].note() - halfSteps, strings[1].note() - halfSteps,
            strings[2].note() - halfSteps, strings[3].note() - halfSteps,
            strings[4].note() - halfSteps, strings[5].note() - halfSteps);
    }

    fun static Tuning create(string name, MidiNote strings[])
    {
        Tuning tuning;
        name => tuning.name;
        strings @=> tuning.strings;
        tuning.init();
        return tuning;
    }

    fun static Tuning create(string name, int s1, int s2, int s3, int s4, int s5, int s6)
    {
        MidiNote @ s[6];
        MidiNote.forNote(s1) @=> s[0];
        MidiNote.forNote(s2) @=> s[1];
        MidiNote.forNote(s3) @=> s[2];
        MidiNote.forNote(s4) @=> s[3];
        MidiNote.forNote(s5) @=> s[4];
        MidiNote.forNote(s6) @=> s[5];
        return create(name, s);
    }
}
