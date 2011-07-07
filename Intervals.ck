/*

    LiCK  Library for ChucK.
    Copyright (c) 2007-2011 held jointly by the individual authors.

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

// see http://en.wikipedia.org/wiki/List_of_musical_intervals
public class Intervals
{
    fun static Unison unison()
    {
        Unison unison;
        return unison;
    }

    fun static Octave octave()
    {
        Octave octave;
        return octave;
    }

    fun static Fifteenth fifteenth()
    {
        Fifteenth fifteenth;
        return fifteenth;
    }

    fun static Interval interval(float antecedent, float consequent)
    {
        Interval interval;
        antecedent => interval.antecedent;
        consequent => interval.consequent;
        antecedent + ":" + consequent => interval.ratio;
        return interval;
    }

    fun static Interval interval(float antecedent, float consequent, string ratio)
    {
        Interval interval;
        antecedent => interval.antecedent;
        consequent => interval.consequent;
        ratio => interval.ratio;
        return interval;
    }

    fun static Interval interval(float antecedent, float consequent, string ratio, string name, string description)
    {
        Interval interval;
        antecedent => interval.antecedent;
        consequent => interval.consequent;
        ratio => interval.ratio;
        name => interval.name;
        description => interval.description;
        return interval;
    }

    fun static Interval inversion(Interval interval)
    {
        Interval inversion;
        interval.antecedent => inversion.antecedent;
        interval.consequent => inversion.consequent;
        interval.ratio => inversion.ratio;
        interval.name => inversion.name;
        interval.description => inversion.description;
        inversion.inversion();
        return inversion;
    }
}

class Unison extends Interval
{
    "Unison" => name;
    "Unison" => description;
}

class Octave extends Interval
{
    2.0 => antecedent;
    "2:1" => ratio;
    "Octave" => name;
    "Octave or diapason" => name;
}

class Fifteenth extends Interval
{
    4.0 => antecedent;
    "4:1" => ratio;
    "Fifteenth" => name;
    "Fifteenth or two octaves" => name;
}
