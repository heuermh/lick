/*

    LiCK  Library for ChucK.
    Copyright (c) 2007-2024 held jointly by the individual authors.

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

public class Chord
{
    "Chord" => string name;
    "Chord" => string description;
    "" => string symbol;
    0.0 => float root;
    ArrayList intervals;
    Intervals.unison() @=> Interval unison;

    fun void forEach(FloatProcedure procedure)
    {
        procedure.run(root);
    }

    fun float sample()
    {
        return sampleInterval().evaluate(root);
    }

    fun Interval sampleInterval()
    {
        return unison;
    }

    fun float valueAt(int i)
    {
        return intervalAt(i).evaluate(root);
    }

    fun Interval intervalAt(int i)
    {
        intervals.get(i) $ Interval @=> Interval interval;
        return interval;
    }
}
