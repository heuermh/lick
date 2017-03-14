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

class IntervalListScale extends Scale
{
    fun void forEach(FloatProcedure procedure)
    {
        intervals.iterator() @=> Iterator iterator;
        while (iterator.hasNext())
        {
            iterator.next() $ Interval @=> Interval interval;
            procedure.run(interval.evaluate(root));
        }
    }

    fun Interval sampleInterval()
    {
        intervals.sample() $ Interval @=> Interval interval;
        return interval;
    }
}

class Major extends IntervalListScale {
    intervals.add(Intervals.unison());
    intervals.add(Intervals.majorSecond());
    intervals.add(Intervals.majorThird());
    intervals.add(Intervals.perfectFourth());
    intervals.add(Intervals.perfectFifth());
    intervals.add(Intervals.majorSixth());
    intervals.add(Intervals.majorSeventh());
    intervals.add(Intervals.octave());
    "Major" => name;
    "major" => description;
}

class MajorBlues extends IntervalListScale {
    intervals.add(Intervals.unison());
    intervals.add(Intervals.majorSecond());
    intervals.add(Intervals.minorThird());
    intervals.add(Intervals.majorThird());
    intervals.add(Intervals.perfectFifth());
    intervals.add(Intervals.majorSixth());
    intervals.add(Intervals.octave());
    "MajorBlues" => name;
    "major blues" => description;
}

class MajorPentatonic extends IntervalListScale {
    intervals.add(Intervals.unison());
    intervals.add(Intervals.majorSecond());
    intervals.add(Intervals.majorThird());
    intervals.add(Intervals.perfectFifth());
    intervals.add(Intervals.majorSixth());
    intervals.add(Intervals.octave());
    "MajorPentatonic" => name;
    "major pentatonic" => description;
}

class Minor extends IntervalListScale {
    intervals.add(Intervals.unison());
    intervals.add(Intervals.majorSecond());
    intervals.add(Intervals.minorThird());
    intervals.add(Intervals.perfectFourth());
    intervals.add(Intervals.perfectFifth());
    intervals.add(Intervals.minorSixth());
    intervals.add(Intervals.minorSeventh());
    intervals.add(Intervals.octave());
    "Minor" => name;
    "minor" => description;
}

class MinorBlues extends IntervalListScale {
    intervals.add(Intervals.unison());
    intervals.add(Intervals.minorThird());
    intervals.add(Intervals.perfectFourth());
    intervals.add(Intervals.tritone());
    intervals.add(Intervals.perfectFifth());
    intervals.add(Intervals.minorSeventh());
    intervals.add(Intervals.octave());
    "MinorBlues" => name;
    "minor blues" => description;
}

class MinorPentatonic extends IntervalListScale {
    intervals.add(Intervals.unison());
    intervals.add(Intervals.minorThird());
    intervals.add(Intervals.perfectFourth());
    intervals.add(Intervals.perfectFifth());
    intervals.add(Intervals.minorSeventh());
    intervals.add(Intervals.octave());
    "MinorPentatonic" => name;
    "minor pentatonic" => description;
}

class Chromatic extends IntervalListScale {
    intervals.add(Intervals.unison());
    intervals.add(Intervals.minorSecond());
    intervals.add(Intervals.majorSecond());
    intervals.add(Intervals.minorThird());
    intervals.add(Intervals.majorThird());
    intervals.add(Intervals.perfectFourth());
    intervals.add(Intervals.tritone());
    intervals.add(Intervals.perfectFifth());
    intervals.add(Intervals.minorSixth());
    intervals.add(Intervals.majorSixth());
    intervals.add(Intervals.minorSeventh());
    intervals.add(Intervals.majorSeventh());
    intervals.add(Intervals.octave());
    "Chromatic" => name;
    "chromatic" => description;
}

class LydianMode extends IntervalListScale {
    intervals.add(Intervals.unison());
    intervals.add(Intervals.majorSecond());
    intervals.add(Intervals.majorThird());
    intervals.add(Intervals.augmentedFourth());
    intervals.add(Intervals.perfectFifth());
    intervals.add(Intervals.majorSixth());
    intervals.add(Intervals.majorSeventh());
    intervals.add(Intervals.octave());
    "LydianMode" => name;
    "lydian mode" => description;
}

class IonianMode extends IntervalListScale {
    intervals.add(Intervals.unison());
    intervals.add(Intervals.majorSecond());
    intervals.add(Intervals.majorThird());
    intervals.add(Intervals.perfectFourth());
    intervals.add(Intervals.perfectFifth());
    intervals.add(Intervals.majorSixth());
    intervals.add(Intervals.majorSeventh());
    intervals.add(Intervals.octave());
    "IonianMode" => name;
    "ionian mode" => description;
}

class MixolydianMode extends IntervalListScale {
    intervals.add(Intervals.unison());
    intervals.add(Intervals.majorSecond());
    intervals.add(Intervals.majorThird());
    intervals.add(Intervals.perfectFourth());
    intervals.add(Intervals.perfectFifth());
    intervals.add(Intervals.majorSixth());
    intervals.add(Intervals.minorSeventh());
    intervals.add(Intervals.octave());
    "MixolydianMode" => name;
    "mixolydian mode" => description;
}

class DorianMode extends IntervalListScale {
    intervals.add(Intervals.unison());
    intervals.add(Intervals.majorSecond());
    intervals.add(Intervals.minorThird());
    intervals.add(Intervals.perfectFourth());
    intervals.add(Intervals.perfectFifth());
    intervals.add(Intervals.majorSixth());
    intervals.add(Intervals.minorSeventh());
    intervals.add(Intervals.octave());
    "DorianMode" => name;
    "dorian mode" => description;
}

class AeolianMode extends IntervalListScale {
    intervals.add(Intervals.unison());
    intervals.add(Intervals.majorSecond());
    intervals.add(Intervals.minorThird());
    intervals.add(Intervals.perfectFourth());
    intervals.add(Intervals.perfectFifth());
    intervals.add(Intervals.minorSixth());
    intervals.add(Intervals.minorSeventh());
    intervals.add(Intervals.octave());
    "AeolianMode" => name;
    "aeolian mode" => description;
}

class PhrygianMode extends IntervalListScale {
    intervals.add(Intervals.unison());
    intervals.add(Intervals.minorSecond());
    intervals.add(Intervals.minorThird());
    intervals.add(Intervals.perfectFourth());
    intervals.add(Intervals.perfectFifth());
    intervals.add(Intervals.minorSixth());
    intervals.add(Intervals.minorSeventh());
    intervals.add(Intervals.octave());
    "PhrygianMode" => name;
    "phrygian mode" => description;
}

class LocrianMode extends IntervalListScale {
    intervals.add(Intervals.unison());
    intervals.add(Intervals.minorSecond());
    intervals.add(Intervals.minorThird());
    intervals.add(Intervals.perfectFourth());
    intervals.add(Intervals.tritone());
    intervals.add(Intervals.minorSixth());
    intervals.add(Intervals.minorSeventh());
    intervals.add(Intervals.octave());
    "LocrianMode" => name;
    "locrian mode" => description;
}

public class Scales
{

    fun static Major major(float root)
    {
        Major major;
        root => major.root;
        return major;
    }

    fun static Major major(float root, string name)
    {
        Major major;
        root => major.root;
        name + " " + major.name => major.name;
        name + " " + major.description => major.description;
        return major;
    }

    fun static MajorBlues majorBlues(float root)
    {
        MajorBlues majorBlues;
        root => majorBlues.root;
        return majorBlues;
    }

    fun static MajorBlues majorBlues(float root, string name)
    {
        MajorBlues majorBlues;
        root => majorBlues.root;
        name + " " + majorBlues.name => majorBlues.name;
        name + " " + majorBlues.description => majorBlues.description;
        return majorBlues;
    }

    fun static MajorPentatonic majorPentatonic(float root)
    {
        MajorPentatonic majorPentatonic;
        root => majorPentatonic.root;
        return majorPentatonic;
    }

    fun static MajorPentatonic majorPentatonic(float root, string name)
    {
        MajorPentatonic majorPentatonic;
        root => majorPentatonic.root;
        name + " " + majorPentatonic.name => majorPentatonic.name;
        name + " " + majorPentatonic.description => majorPentatonic.description;
        return majorPentatonic;
    }

    fun static Minor minor(float root)
    {
        Minor minor;
        root => minor.root;
        return minor;
    }

    fun static Minor minor(float root, string name)
    {
        Minor minor;
        root => minor.root;
        name + " " + minor.name => minor.name;
        name + " " + minor.description => minor.description;
        return minor;
    }

    fun static MinorBlues minorBlues(float root)
    {
        MinorBlues minorBlues;
        root => minorBlues.root;
        return minorBlues;
    }

    fun static MinorBlues minorBlues(float root, string name)
    {
        MinorBlues minorBlues;
        root => minorBlues.root;
        name + " " + minorBlues.name => minorBlues.name;
        name + " " + minorBlues.description => minorBlues.description;
        return minorBlues;
    }

    fun static MinorPentatonic minorPentatonic(float root)
    {
        MinorPentatonic minorPentatonic;
        root => minorPentatonic.root;
        return minorPentatonic;
    }

    fun static MinorPentatonic minorPentatonic(float root, string name)
    {
        MinorPentatonic minorPentatonic;
        root => minorPentatonic.root;
        name + " " + minorPentatonic.name => minorPentatonic.name;
        name + " " + minorPentatonic.description => minorPentatonic.description;
        return minorPentatonic;
    }

    fun static Chromatic chromatic(float root)
    {
        Chromatic chromatic;
        root => chromatic.root;
        return chromatic;
    }

    fun static Chromatic chromatic(float root, string name)
    {
        Chromatic chromatic;
        root => chromatic.root;
        name + " " + chromatic.name => chromatic.name;
        name + " " + chromatic.description => chromatic.description;
        return chromatic;
    }

    fun static LydianMode lydianMode(float root)
    {
        LydianMode lydianMode;
        root => lydianMode.root;
        return lydianMode;
    }

    fun static LydianMode lydianMode(float root, string name)
    {
        LydianMode lydianMode;
        root => lydianMode.root;
        name + " " + lydianMode.name => lydianMode.name;
        name + " " + lydianMode.description => lydianMode.description;
        return lydianMode;
    }

    fun static IonianMode ionianMode(float root)
    {
        IonianMode ionianMode;
        root => ionianMode.root;
        return ionianMode;
    }

    fun static IonianMode ionianMode(float root, string name)
    {
        IonianMode ionianMode;
        root => ionianMode.root;
        name + " " + ionianMode.name => ionianMode.name;
        name + " " + ionianMode.description => ionianMode.description;
        return ionianMode;
    }

    fun static MixolydianMode mixolydianMode(float root)
    {
        MixolydianMode mixolydianMode;
        root => mixolydianMode.root;
        return mixolydianMode;
    }

    fun static MixolydianMode mixolydianMode(float root, string name)
    {
        MixolydianMode mixolydianMode;
        root => mixolydianMode.root;
        name + " " + mixolydianMode.name => mixolydianMode.name;
        name + " " + mixolydianMode.description => mixolydianMode.description;
        return mixolydianMode;
    }

    fun static DorianMode dorianMode(float root)
    {
        DorianMode dorianMode;
        root => dorianMode.root;
        return dorianMode;
    }

    fun static DorianMode dorianMode(float root, string name)
    {
        DorianMode dorianMode;
        root => dorianMode.root;
        name + " " + dorianMode.name => dorianMode.name;
        name + " " + dorianMode.description => dorianMode.description;
        return dorianMode;
    }

    fun static AeolianMode aeolianMode(float root)
    {
        AeolianMode aeolianMode;
        root => aeolianMode.root;
        return aeolianMode;
    }

    fun static AeolianMode aeolianMode(float root, string name)
    {
        AeolianMode aeolianMode;
        root => aeolianMode.root;
        name + " " + aeolianMode.name => aeolianMode.name;
        name + " " + aeolianMode.description => aeolianMode.description;
        return aeolianMode;
    }

    fun static PhrygianMode phrygianMode(float root)
    {
        PhrygianMode phrygianMode;
        root => phrygianMode.root;
        return phrygianMode;
    }

    fun static PhrygianMode phrygianMode(float root, string name)
    {
        PhrygianMode phrygianMode;
        root => phrygianMode.root;
        name + " " + phrygianMode.name => phrygianMode.name;
        name + " " + phrygianMode.description => phrygianMode.description;
        return phrygianMode;
    }

    fun static LocrianMode locrianMode(float root)
    {
        LocrianMode locrianMode;
        root => locrianMode.root;
        return locrianMode;
    }

    fun static LocrianMode locrianMode(float root, string name)
    {
        LocrianMode locrianMode;
        root => locrianMode.root;
        name + " " + locrianMode.name => locrianMode.name;
        name + " " + locrianMode.description => locrianMode.description;
        return locrianMode;
    }

    fun static IntervalListScale scale(float root, Interval interval0, Interval interval1, Interval interval2, Interval interval3)
    {
        IntervalListScale intervalListScale;
        root => intervalListScale.root;
        ArrayList intervals;
        intervals.add(interval0);
        intervals.add(interval1);
        intervals.add(interval2);
        intervals.add(interval3);
        intervals @=> intervalListScale.intervals;
        return intervalListScale;
    }

    fun static IntervalListScale scale(float root, Interval interval0, Interval interval1, Interval interval2, Interval interval3, Interval interval4)
    {
        IntervalListScale intervalListScale;
        root => intervalListScale.root;
        ArrayList intervals;
        intervals.add(interval0);
        intervals.add(interval1);
        intervals.add(interval2);
        intervals.add(interval3);
        intervals.add(interval4);
        intervals @=> intervalListScale.intervals;
        return intervalListScale;
    }

    fun static IntervalListScale scale(float root, Interval interval0, Interval interval1, Interval interval2, Interval interval3, Interval interval4, Interval interval5)
    {
        IntervalListScale intervalListScale;
        root => intervalListScale.root;
        ArrayList intervals;
        intervals.add(interval0);
        intervals.add(interval1);
        intervals.add(interval2);
        intervals.add(interval3);
        intervals.add(interval4);
        intervals.add(interval5);
        intervals @=> intervalListScale.intervals;
        return intervalListScale;
    }

    fun static IntervalListScale scale(float root, Interval interval0, Interval interval1, Interval interval2, Interval interval3, Interval interval4, Interval interval5, Interval interval6)
    {
        IntervalListScale intervalListScale;
        root => intervalListScale.root;
        ArrayList intervals;
        intervals.add(interval0);
        intervals.add(interval1);
        intervals.add(interval2);
        intervals.add(interval3);
        intervals.add(interval4);
        intervals.add(interval5);
        intervals.add(interval6);
        intervals @=> intervalListScale.intervals;
        return intervalListScale;
    }

    fun static IntervalListScale scale(float root, ArrayList intervals)
    {
        IntervalListScale intervalListScale;
        root => intervalListScale.root;
        intervals @=> intervalListScale.intervals;
        return intervalListScale;
    }
}
