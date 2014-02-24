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

public class Tunings
{

    fun static Tuning std()
    {
        return standard();
    }

    fun static Tuning standard()
    {
        Tuning tuning;
        return tuning;
    }

    fun static Tuning dropD()
    {
        return create("Drop D", 50, 57, 62, 67, 71, 76);
    }

    fun static Tuning openC()
    {
        return create("Open C", 48, 55, 60, 67, 72, 76);
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

    fun static Tuning create(string name, MidiNote[] strings)
    {
        return Tuning.create(name, strings);
    }

    fun static Tuning create(string name, int s1, int s2, int s3, int s4, int s5, int s6)
    {
        return Tuning.create(name, s1, s2, s3, s4, s5, s6);
    }
}