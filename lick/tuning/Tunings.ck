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

public class Tunings
{

    fun static Tuning std()
    {
        //return create("Standard", 52, 57, 62, 67, 71, 76);
        Tuning tuning;
        return tuning;
    }

    fun static Tuning standard()
    {
        return std();
    }

    fun static Tuning lowerEb()
    {
        std().down() @=> Tuning tuning;
        "Lowered D#/Eb" => tuning.name;
        return tuning;
    }

    fun static Tuning lowerD()
    {
        std().down(2) @=> Tuning tuning;
        "Lowered D" => tuning.name;
        return tuning;
    }

    fun static Tuning lowerDb()
    {
        std().down(3) @=> Tuning tuning;
        "Lowered C#/Db" => tuning.name;
        return tuning;
    }

    fun static Tuning lowerC()
    {
        std().down(4) @=> Tuning tuning;
        "Lowered C" => tuning.name;
        return tuning;
    }

    fun static Tuning lowerB()
    {
        std().down(5) @=> Tuning tuning;
        "Lowered B" => tuning.name;
        return tuning;
    }

    fun static Tuning lowerBb()
    {
        std().down(6) @=> Tuning tuning;
        "Lowered A#/Bb" => tuning.name;
        return tuning;
    }

    fun static Tuning lowerA()
    {
        std().down(7) @=> Tuning tuning;
        "Lowered A" => tuning.name;
        return tuning;
    }

    fun static Tuning lowerAb()
    {
        std().down(8) @=> Tuning tuning;
        "Lowered G#/Ab" => tuning.name;
        return tuning;
    }

    fun static Tuning lowerG()
    {
        std().down(9) @=> Tuning tuning;
        "Lowered G" => tuning.name;
        return tuning;
    }

    fun static Tuning lowerGb()
    {
        std().down(10) @=> Tuning tuning;
        "Lowered F#/Gb" => tuning.name;
        return tuning;
    }

    fun static Tuning lowerF()
    {
        std().down(11) @=> Tuning tuning;
        "Lowered F" => tuning.name;
        return tuning;
    }

    fun static Tuning lowerOctave()
    {
        std().down(12) @=> Tuning tuning;
        "Lowered Octave" => tuning.name;
        return tuning;
    }

    fun static Tuning raiseEb()
    {
        std().up(11) @=> Tuning tuning;
        "Raised D#/Eb" => tuning.name;
        return tuning;
    }

    fun static Tuning raiseD()
    {
        std().up(10) @=> Tuning tuning;
        "Raised D" => tuning.name;
        return tuning;
    }

    fun static Tuning raiseDb()
    {
        std().up(9) @=> Tuning tuning;
        "Raised C#/Db" => tuning.name;
        return tuning;
    }

    fun static Tuning raiseC()
    {
        std().up(8) @=> Tuning tuning;
        "Raised C" => tuning.name;
        return tuning;
    }

    fun static Tuning raiseB()
    {
        std().up(7) @=> Tuning tuning;
        "Raised B" => tuning.name;
        return tuning;
    }

    fun static Tuning raiseBb()
    {
        std().up(6) @=> Tuning tuning;
        "Raised A#/Bb" => tuning.name;
        return tuning;
    }

    fun static Tuning raiseA()
    {
        std().up(5) @=> Tuning tuning;
        "Raised A" => tuning.name;
        return tuning;
    }

    fun static Tuning raiseAb()
    {
        std().up(4) @=> Tuning tuning;
        "Raised G#/Ab" => tuning.name;
        return tuning;
    }

    fun static Tuning raiseG()
    {
        std().up(3) @=> Tuning tuning;
        "Raised G" => tuning.name;
        return tuning;
    }

    fun static Tuning raiseGb()
    {
        std().up(2) @=> Tuning tuning;
        "Raised F#/Gb" => tuning.name;
        return tuning;
    }

    fun static Tuning raiseF()
    {
        std().up(1) @=> Tuning tuning;
        "Raised F" => tuning.name;
        return tuning;
    }

    fun static Tuning raiseOctave()
    {
        std().up(12) @=> Tuning tuning;
        "Raised Octave" => tuning.name;
        return tuning;
    }

    fun static Tuning dropD()
    {
        return create("Drop D", 50, 57, 62, 67, 71, 76);
    }

    fun static Tuning dropDb()
    {
        dropD().down(1) @=> Tuning tuning;
        "Drop C#/Db" => tuning.name;
        return tuning;
    }

    fun static Tuning dropC()
    {
        dropD().down(2) @=> Tuning tuning;
        "Drop C" => tuning.name;
        return tuning;
    }

    fun static Tuning dropB()
    {
        dropD().down(3) @=> Tuning tuning;
        "Drop B" => tuning.name;
        return tuning;
    }

    fun static Tuning dropBb()
    {
        dropD().down(4) @=> Tuning tuning;
        "Drop A#/Bb" => tuning.name;
        return tuning;
    }

    fun static Tuning dropA()
    {
        dropD().down(5) @=> Tuning tuning;
        "Drop A" => tuning.name;
        return tuning;
    }

    fun static Tuning dropAb()
    {
        dropD().down(6) @=> Tuning tuning;
        "Drop G#/Ab" => tuning.name;
        return tuning;
    }

    fun static Tuning dropG()
    {
        dropD().down(7) @=> Tuning tuning;
        "Drop G" => tuning.name;
        return tuning;
    }

    fun static Tuning dropGb()
    {
        dropD().down(8) @=> Tuning tuning;
        "Drop F#/Gb" => tuning.name;
        return tuning;
    }

    fun static Tuning dropF()
    {
        dropD().down(9) @=> Tuning tuning;
        "Drop F" => tuning.name;
        return tuning;
    }

    fun static Tuning dropE()
    {
        dropD().down(10) @=> Tuning tuning;
        "Drop E" => tuning.name;
        return tuning;
    }

    fun static Tuning dropEb()
    {
        dropD().down(11) @=> Tuning tuning;
        "Drop D#/Eb" => tuning.name;
        return tuning;
    }

    fun static Tuning dropOctave()
    {
        dropD().down(12) @=> Tuning tuning;
        "Drop Octave" => tuning.name;
        return tuning;
    }

    fun static Tuning doubleDropD()
    {
        return create("Double-drop D", 50, 57, 62, 67, 71, 74);
    }

    fun static Tuning dadGad()
    {
        return create("Dad-Gad", 50, 57, 62, 67, 69, 74);
    }

    fun static Tuning dadDad()
    {
        return create("Dad-Dad", 50, 57, 62, 62, 69, 74);
    }

    fun static Tuning openC()
    {
        return create("Open C", 48, 55, 60, 67, 72, 76);
    }

    fun static Tuning openC6()
    {
        return create("Open C6", 48, 57, 60, 67, 72, 76);
    }

    fun static Tuning openD()
    {
        return create("Open D", 50, 57, 62, 66, 69, 74);
    }

    fun static Tuning modalD()
    {
        return create("Modal D", 50, 57, 62, 67, 69, 74);
    }

    fun static Tuning openDMinor()
    {
        return create("Open D Minor", 50, 57, 62, 65, 69, 74);
    }

    fun static Tuning openE()
    {
        return create("Open E", 52, 59, 64, 68, 71, 76);
    }

    fun static Tuning openF()
    {
        return create("Open F", 48, 53, 60, 65, 72, 77);
    }

    fun static Tuning openG()
    {
        return create("Open G", 50, 55, 62, 67, 71, 74);
    }

    fun static Tuning modalG()
    {
        return create("Modal G", 50, 55, 62, 67, 72, 74);
    }

    fun static Tuning openGMinor()
    {
        return create("Open G Minor", 50, 55, 62, 67, 70, 74);
    }

    fun static Tuning openA()
    {
        return create("Open A", 52, 57, 61, 64, 69, 76);
    }

    fun static Tuning create(string name, MidiNote strings[])
    {
        return Tuning.create(name, strings);
    }

    fun static Tuning create(string name, int s1, int s2, int s3, int s4, int s5, int s6)
    {
        return Tuning.create(name, s1, s2, s3, s4, s5, s6);
    }
}
