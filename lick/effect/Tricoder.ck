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

public class Tricoder extends Effect
{
    Tremolo high;
    Tremolo middle;
    Tremolo low;
    CrossOver3 crossOver;

    {
        inlet => crossOver.in;
        crossOver.out1 => high => wet;
        crossOver.out2 => middle => wet;
        crossOver.out3 => low => wet;
    }

    fun void syncLfo(float f)
    {
        f => low.rate;
        f => middle.rate;
        f => high.rate;
    }

    fun void syncLfo(float f, Interval i)
    {
        f => low.rate;
        i.evaluate(f) => middle.rate;
        i.evaluate(i.evaluate(f)) => high.rate;
    }

    fun static Tricoder create()
    {
        Tricoder tricoder;
        return tricoder;
    }

    fun static Tricoder create(float f)
    {
        Tricoder tricoder;
        tricoder.syncLfo(f);
        return tricoder;
    }

    fun static Tricoder create(float f, UGen out1, UGen out2, UGen out3)
    {
        Tricoder tricoder;
        tricoder.syncLfo(f);
        tricoder.crossOver.out1 => out1;
        tricoder.crossOver.out2 => out2;
        tricoder.crossOver.out3 => out3;
        return tricoder;
    }

    fun static Tricoder create(float f, Interval i)
    {
        Tricoder tricoder;
        tricoder.syncLfo(f, i);
        return tricoder;
    }

    fun static Tricoder create(float f, Interval i, UGen out1, UGen out2, UGen out3)
    {
        Tricoder tricoder;
        tricoder.syncLfo(f, i);
        tricoder.crossOver.out1 => out1;
        tricoder.crossOver.out2 => out2;
        tricoder.crossOver.out3 => out3;
        return tricoder;
    }
}
