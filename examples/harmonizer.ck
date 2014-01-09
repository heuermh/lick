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

class Intervaler extends Effect
{
    PitShift pitchShift;
    Interval interval;

    1.0 => pitchShift.mix;

    spork ~ _sporkAtSampleRate();

    inlet => pitchShift => wet;

    fun void _sporkAtSampleRate()
    {
        while (true)
        {
            1::samp => now;
            interval.evaluate(1.0) => pitchShift.shift;
        }
    }
}

class Harmonizer extends Effect
{
    ArrayList @ intervals;

    fun void init()
    {
        intervals.iterator() @=> Iterator iterator;
        while (iterator.hasNext())
        {
            iterator.next() $ Interval @=> Interval interval;
            Intervaler iv;
            interval @=> iv.interval;
            inlet => iv => wet;
        }
    }
}

//fun static Harmonizer create(Interval interval) ?

fun static Harmonizer createAsc(Chord chord)
{
    Harmonizer harmonizer;
    chord.intervals @=> harmonizer.intervals;
    harmonizer.init();
    return harmonizer;
}

fun static Harmonizer createDesc(Chord chord)
{
    Harmonizer harmonizer;
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

fun static Harmonizer createAsc(Scale scale)
{
    Harmonizer harmonizer;
    scale.intervals @=> harmonizer.intervals;
    harmonizer.init();
    return harmonizer;
}

fun static Harmonizer createDesc(Scale scale)
{
    Harmonizer harmonizer;
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

//createAsc(Chords.majorTriad(220.0)) @=> Harmonizer harmonizer;
createDesc(Scales.minorBlues(220.0)) @=> Harmonizer harmonizer;

adc => harmonizer => dac;

1::minute => now;

<<<"done">>>;