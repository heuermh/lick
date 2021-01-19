/*

    LiCK  Library for ChucK.
    Copyright (c) 2007-2021 held jointly by the individual authors.

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

public class Triphaser extends Effect
{
    Blueshift high;
    Blueshift middle;
    Blueshift low;
    CrossOver3 crossOver;

    {
        inlet => crossOver.in;
        crossOver.out1 => high => wet;
        crossOver.out2 => middle => wet;
        crossOver.out3 => low => wet;

        0.8 => high.mix;
        0.4 => middle.mix;
        0.1 => low.mix;
        200.0 => crossOver.freq1;
        4000.0 => crossOver.freq2;
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

    fun static Triphaser create()
    {
        Triphaser triphaser;
        return triphaser;
    }

    fun static Triphaser create(float f)
    {
        Triphaser triphaser;
        triphaser.syncLfo(f);
        return triphaser;
    }

    fun static Triphaser create(float f, UGen out1, UGen out2, UGen out3)
    {
        Triphaser triphaser;
        triphaser.syncLfo(f);
        triphaser.crossOver.out1 => out1;
        triphaser.crossOver.out2 => out2;
        triphaser.crossOver.out3 => out3;
        return triphaser;
    }

    fun static Triphaser create(float f, Interval i)
    {
        Triphaser triphaser;
        triphaser.syncLfo(f, i);
        return triphaser;
    }

    fun static Triphaser create(float f, Interval i, UGen out1, UGen out2, UGen out3)
    {
        Triphaser triphaser;
        triphaser.syncLfo(f, i);
        triphaser.crossOver.out1 => out1;
        triphaser.crossOver.out2 => out2;
        triphaser.crossOver.out3 => out3;
        return triphaser;
    }
}
