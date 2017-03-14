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

class SingleIntervalHarmonizer extends Harmonizer
{
    PitShift pitchShift;
    Interval @ interval;

    1.0 => pitchShift.mix;

    inlet => pitchShift => wet;

    fun void init()
    {
        interval.evaluate(1.0) => pitchShift.shift;
    }
}

class MultipleIntervalHarmonizer extends Harmonizer
{
    ArrayList @ intervals;

    fun void init()
    {
        intervals.iterator() @=> Iterator iterator;
        while (iterator.hasNext())
        {
            iterator.next() $ Interval @=> Interval interval;
            SingleIntervalHarmonizer h;
            interval @=> h.interval;
            h.init();
            inlet => h => wet;
        }
    }
}

public class Harmonizers
{
    fun static Harmonizer asc(Interval interval)
    {
        SingleIntervalHarmonizer harmonizer;
        interval @=> harmonizer.interval;
        harmonizer.init();
        return harmonizer;
    }

    fun static Harmonizer asc(Chord chord)
    {
        MultipleIntervalHarmonizer harmonizer;
        chord.intervals @=> harmonizer.intervals;
        harmonizer.init();
        return harmonizer;
    }

    fun static Harmonizer asc(Scale scale)
    {
        MultipleIntervalHarmonizer harmonizer;
        scale.intervals @=> harmonizer.intervals;
        harmonizer.init();
        return harmonizer;
    }

    fun static Harmonizer desc(Interval interval)
    {
        SingleIntervalHarmonizer harmonizer;
        interval.desc() @=> harmonizer.interval;
        harmonizer.init();
        return harmonizer;
    }

    fun static Harmonizer desc(Chord chord)
    {
        MultipleIntervalHarmonizer harmonizer;
        chord.intervals.iterator() @=> Iterator iterator;
        while (iterator.hasNext())
        {
            iterator.next() $ Interval @=> Interval interval;
            interval.desc();
        }
        chord.intervals @=> harmonizer.intervals;
        harmonizer.init();
        return harmonizer;
    }

    fun static Harmonizer desc(Scale scale)
    {
        MultipleIntervalHarmonizer harmonizer;
        scale.intervals.iterator() @=> Iterator iterator;
        while (iterator.hasNext())
        {
            iterator.next() $ Interval @=> Interval interval;
            interval.desc();
        }
        scale.intervals @=> harmonizer.intervals;
        harmonizer.init();
        return harmonizer;
    }
}
