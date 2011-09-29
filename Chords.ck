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

public class Chords
{
    fun static MajorFifth majorFifth(float root)
    {
        MajorFifth majorFifth;
        root => majorFifth.root;
        return majorFifth;
    }

    fun static MajorTriad majorTriad(float root, string name)
    {
        MajorFifth majorFifth;
        root => majorFifth.root;
        name + " " + majorFifth.name => majorFifth.name;
        name + " " + majorFifth.description => majorFifth.description;
        name + majorFifth.symbol => majorFifth.symbol;
        return majorFifth;
    }

    fun static MajorTriad majorTriad(float root)
    {
        MajorTriad majorTriad;
        root => majorTriad.root;
        return majorTriad;
    }

    fun static MajorTriad majorTriad(float root, string name)
    {
        MajorTriad majorTriad;
        root => majorTriad.root;
        name + " " + majorTriad.name => majorTriad.name;
        name + " " + majorTriad.description => majorTriad.description;
        name + majorTriad.symbol => majorTriad.symbol;
        return majorTriad;
    }

    fun static MinorTriad minorTriad(float root)
    {
        MinorTriad minorTriad;
        root => minorTriad.root;
        return minorTriad;
    }

    fun static MinorTriad minorTriad(float root, string name)
    {
        MinorTriad minorTriad;
        root => minorTriad.root;
        name + " " + minorTriad.name => minorTriad.name;
        name + " " + minorTriad.description => minorTriad.description;
        name + minorTriad.symbol => minorTriad.symbol;
        return minorTriad;
    }

    fun static AugmentedTriad augmentedTriad(float root)
    {
        AugmentedTriad augmentedTriad;
        root => augmentedTriad.root;
        return augmentedTriad;
    }

    fun static AugmentedTriad augmentedTriad(float root, string name)
    {
        AugmentedTriad augmentedTriad;
        root => augmentedTriad.root;
        name + " " + augmentedTriad.name => augmentedTriad.name;
        name + " " + augmentedTriad.description => augmentedTriad.description;
        name + augmentedTriad.symbol => augmentedTriad.symbol;
        return augmentedTriad;
    }

    fun static DiminishedTriad diminishedTriad(float root)
    {
        DiminishedTriad diminishedTriad;
        root => diminishedTriad.root;
        return diminishedTriad;
    }

    fun static DiminishedTriad diminishedTriad(float root, string name)
    {
        DiminishedTriad diminishedTriad;
        root => diminishedTriad.root;
        name + " " + diminishedTriad.name => diminishedTriad.name;
        name + " " + diminishedTriad.description => diminishedTriad.description;
        name + diminishedTriad.symbol => diminishedTriad.symbol;
        return diminishedTriad;
    }

    fun static DiminishedSeventh diminishedSeventh(float root)
    {
        DiminishedSeventh diminishedSeventh;
        root => diminishedSeventh.root;
        return diminishedSeventh;
    }

    fun static DiminishedSeventh diminishedSeventh(float root, string name)
    {
        DiminishedSeventh diminishedSeventh;
        root => diminishedSeventh.root;
        name + " " + diminishedSeventh.name => diminishedSeventh.name;
        name + " " + diminishedSeventh.description => diminishedSeventh.description;
        name + diminishedSeventh.symbol => diminishedSeventh.symbol;
        return diminishedSeventh;
    }

    fun static HalfDiminishedSeventh halfDiminishedSeventh(float root)
    {
        HalfDiminishedSeventh halfDiminishedSeventh;
        root => halfDiminishedSeventh.root;
        return halfDiminishedSeventh;
    }

    fun static HalfDiminishedSeventh halfDiminishedSeventh(float root, string name)
    {
        HalfDiminishedSeventh halfDiminishedSeventh;
        root => halfDiminishedSeventh.root;
        name + " " + halfDiminishedSeventh.name => halfDiminishedSeventh.name;
        name + " " + halfDiminishedSeventh.description => halfDiminishedSeventh.description;
        name + halfDiminishedSeventh.symbol => halfDiminishedSeventh.symbol;
        return halfDiminishedSeventh;
    }

    fun static MinorSeventh minorSeventh(float root)
    {
        MinorSeventh minorSeventh;
        root => minorSeventh.root;
        return minorSeventh;
    }

    fun static MinorSeventh minorSeventh(float root, string name)
    {
        MinorSeventh minorSeventh;
        root => minorSeventh.root;
        name + " " + minorSeventh.name => minorSeventh.name;
        name + " " + minorSeventh.description => minorSeventh.description;
        name + minorSeventh.symbol => minorSeventh.symbol;
        return minorSeventh;
    }

    fun static MajorMinorSeventh majorMinorSeventh(float root)
    {
        MajorMinorSeventh majorMinorSeventh;
        root => majorMinorSeventh.root;
        return majorMinorSeventh;
    }

    fun static MajorMinorSeventh majorMinorSeventh(float root, string name)
    {
        MajorMinorSeventh majorMinorSeventh;
        root => majorMinorSeventh.root;
        name + " " + majorMinorSeventh.name => majorMinorSeventh.name;
        name + " " + majorMinorSeventh.description => majorMinorSeventh.description;
        name + majorMinorSeventh.symbol => majorMinorSeventh.symbol;
        return majorMinorSeventh;
    }

    fun static DominantSeventh dominantSeventh(float root)
    {
        DominantSeventh dominantSeventh;
        root => dominantSeventh.root;
        return dominantSeventh;
    }

    fun static DominantSeventh dominantSeventh(float root, string name)
    {
        DominantSeventh dominantSeventh;
        root => dominantSeventh.root;
        name + " " + dominantSeventh.name => dominantSeventh.name;
        name + " " + dominantSeventh.description => dominantSeventh.description;
        name + dominantSeventh.symbol => dominantSeventh.symbol;
        return dominantSeventh;
    }

    fun static MajorSeventh majorSeventh(float root)
    {
        MajorSeventh majorSeventh;
        root => majorSeventh.root;
        return majorSeventh;
    }

    fun static MajorSeventh majorSeventh(float root, string name)
    {
        MajorSeventh majorSeventh;
        root => majorSeventh.root;
        name + " " + majorSeventh.name => majorSeventh.name;
        name + " " + majorSeventh.description => majorSeventh.description;
        name + majorSeventh.symbol => majorSeventh.symbol;
        return majorSeventh;
    }

    fun static AugmentedSeventh augmentedSeventh(float root)
    {
        AugmentedSeventh augmentedSeventh;
        root => augmentedSeventh.root;
        return augmentedSeventh;
    }

    fun static AugmentedSeventh augmentedSeventh(float root, string name)
    {
        AugmentedSeventh augmentedSeventh;
        root => augmentedSeventh.root;
        name + " " + augmentedSeventh.name => augmentedSeventh.name;
        name + " " + augmentedSeventh.description => augmentedSeventh.description;
        name + augmentedSeventh.symbol => augmentedSeventh.symbol;
        return augmentedSeventh;
    }

    fun static AugmentedMajorSeventh augmentedMajorSeventh(float root)
    {
        AugmentedMajorSeventh augmentedMajorSeventh;
        root => augmentedMajorSeventh.root;
        return augmentedMajorSeventh;
    }

    fun static AugmentedMajorSeventh augmentedMajorSeventh(float root, string name)
    {
        AugmentedMajorSeventh augmentedMajorSeventh;
        root => augmentedMajorSeventh.root;
        name + " " + augmentedMajorSeventh.name => augmentedMajorSeventh.name;
        name + " " + augmentedMajorSeventh.description => augmentedMajorSeventh.description;
        name + augmentedMajorSeventh.symbol => augmentedMajorSeventh.symbol;
        return augmentedMajorSeventh;
    }

    fun static Fifth fifth(float root, Interval fifth)
    {
        Fifth chord;
        root => chord.root;
        fifth @=> chord.fifth;
        return chord;
    }

    fun static Triad triad(float root, Interval third, Interval fifth)
    {
        Triad triad;
        root => triad.root;
        third @=> triad.third;
        fifth @=> triad.fifth;
        return triad;
    }

    fun static Seventh seventh(float root, Interval interval0, Interval interval1, Interval interval2)
    {
        Seventh chord;
        root => chord.root;
        third @=> chord.third;
        fifth @=> chord.fifth;
        seventh @=> chord.seventh;
        return chord;
    }

    fun static IntervalListChord chord(float root, Interval interval0, Interval interval1, Interval interval2, Interval interval3)
    {
        IntervalListChord intervalListChord;
        root => intervalListChord.root;
        ArrayList intervals;
        intervals.add(interval0);
        intervals.add(interval1);
        intervals.add(interval2);
        intervals.add(interval3);
        intervals @=> intervalListChord.intervals;
        return intervalListChord;
    }

    fun static IntervalListChord chord(float root, Interval interval0, Interval interval1, Interval interval2, Interval interval3, Interval interval4)
    {
        IntervalListChord intervalListChord;
        root => intervalListChord.root;
        ArrayList intervals;
        intervals.add(interval0);
        intervals.add(interval1);
        intervals.add(interval2);
        intervals.add(interval3);
        intervals.add(interval4);
        intervals @=> intervalListChord.intervals;
        return intervalListChord;
    }

    fun static IntervalListChord chord(float root, Interval interval0, Interval interval1, Interval interval2, Interval interval3, Interval interval4, Interval interval5)
    {
        IntervalListChord intervalListChord;
        root => intervalListChord.root;
        ArrayList intervals;
        intervals.add(interval0);
        intervals.add(interval1);
        intervals.add(interval2);
        intervals.add(interval3);
        intervals.add(interval4);
        intervals.add(interval5);
        intervals @=> intervalListChord.intervals;
        return intervalListChord;
    }

    fun static IntervalListChord chord(float root, Interval interval0, Interval interval1, Interval interval2, Interval interval3, Interval interval4, Interval interval5, Interval interval6)
    {
        IntervalListChord intervalListChord;
        root => intervalListChord.root;
        ArrayList intervals;
        intervals.add(interval0);
        intervals.add(interval1);
        intervals.add(interval2);
        intervals.add(interval3);
        intervals.add(interval4);
        intervals.add(interval5);
        intervals.add(interval6);
        intervals @=> intervalListChord.intervals;
        return intervalListChord;
    }

    fun static IntervalListChord chord(float root, List intervals)
    {
        IntervalListChord intervalListChord;
        root => intervalListChord.root;
        intervals @=> intervalListChord.intervals;
        return intervalListChord;
    }
}

class Fifth extends Chord
{
    Interval @ fifth;

    fun void forEach(FloatProcedure procedure)
    {
        procedure.run(root);
        procedure.run(fifth.evaluate(root));
    }

    fun Interval sampleInterval()
    {
        if (rand(0, 1))
        {
            return unison;
        }
        else
        {
            return fifth;
        }
    }
}

class MajorFifth extends Fifth
{
    Intervals.majorFifth() @=> fifth;
    "MajorFifth" => name;
    "major fifth" => description;
    "5" => symbol;
}

class Triad extends Fifth
{
    Interval @ third;

    fun void forEach(FloatProcedure procedure)
    {
        procedure.run(root);
        procedure.run(third.evaluate(root));
        procedure.run(fifth.evaluate(root));
    }

    fun Interval sampleInterval()
    {
        rand(0, 2) => int sample;
        if (sample == 0)
        {
            return unison;
        }
        else if (sample == 1)
        {
            return third;
        }
        else
        {
            return fifth;
        }
    }
}

class MajorTriad extends Triad
{
    Intervals.majorThird() @=> third;
    Intervals.perfectFifth() @=> fifth;
    "MajorTriad" => name;
    "major triad" => description;
    "maj" => symbol;
}

class MinorTriad extends Triad
{
    Intervals.minorThird() @=> third;
    Intervals.perfectFifth() @=> fifth;
    "MinorTriad" => name;
    "minor triad" => description;
    "min" => symbol;
}

class AugmentedTriad extends Triad
{
    Intervals.majorThird() @=> third;
    Intervals.augmentedFifth() @=> fifth;
    "AugmentedTriad" => name;
    "augmented triad" => description;
    "aug" => symbol;
}

class DiminishedTriad extends Triad
{
    Intervals.minorThird() @=> third;
    Intervals.diminishedFifth() @=> fifth;
    "DiminishedTriad" => name;
    "diminished triad" => description;
    "dim" => symbol;
}

class Seventh extends Triad
{
    Interval @ seventh;

    fun void forEach(FloatProcedure procedure)
    {
        procedure.run(root);
        procedure.run(third.evaluate(root));
        procedure.run(fifth.evaluate(root));
        procedure.run(seventh.evaluate(root));
    }

    fun Interval sampleInterval()
    {
        rand(0, 3) => int sample;
        if (sample == 0)
        {
            return unison;
        }
        else if (sample == 1)
        {
            return third;
        }
        else if (sample == 1)
        {
            return fifth;
        }
        else
        {
            return seventh;
        }
    }
}

class DiminishedSeventh extends Seventh
{
    Intervals.minorThird() @=> third;
    Intervals.diminishedFifth() @=> fifth;
    Intervals.diminishedSeventh() @=> seventh;
    "DiminishedSeventh" => name;
    "diminished seventh" => description;
    "dim7" => symbol;
}

class HalfDiminishedSeventh extends Seventh
{
    Intervals.minorThird() @=> third;
    Intervals.diminishedFifth() @=> fifth;
    Intervals.minorSeventh() @=> seventh;
    "HalfDiminishedSeventh" => name;
    "half-diminished seventh" => description;
    "min7(b5)" => symbol;
}

class MinorSeventh extends Seventh
{
    Intervals.minorThird() @=> third;
    Intervals.perfectFifth() @=> fifth;
    Intervals.minorSeventh() @=> seventh;
    "MinorSeventh" => name;
    "minor seventh" => description;
    "min7" => symbol;
}

class MinorMajorSeventh extends Seventh
{
    Intervals.minorThird() @=> third;
    Intervals.perfectFifth() @=> fifth;
    Intervals.majorSeventh() @=> seventh;
    "MinorMajorSeventh" => name;
    "minor major seventh" => description;
    "min/maj7" => symbol;
}

class DominantSeventh extends Seventh
{
    Intervals.majorThird() @=> third;
    Intervals.perfectFifth() @=> fifth;
    Intervals.minorSeventh() @=> seventh;
    "DominantSeventh" => name;
    "dominant seventh" => description;
    "dom7" => symbol;
}

class MajorSeventh extends Seventh
{
    Intervals.majorThird() @=> third;
    Intervals.perfectFifth() @=> fifth;
    Intervals.majorSeventh() @=> seventh;
    "MajorSeventh" => name;
    "major seventh" => description;
    "maj7" => symbol;
}

class AugmentedSeventh extends Seventh
{
    Intervals.majorThird() @=> third;
    Intervals.augmentedFifth() @=> fifth;
    Intervals.minorSeventh() @=> seventh;
    "AugmentedSeventh" => name;
    "augmented seventh" => description;
    "aug7" => symbol;
}

class AugmentedMajorSeventh extends Seventh
{
    Intervals.majorThird() @=> third;
    Intervals.augmentedFifth() @=> fifth;
    Intervals.majorSeventh() @=> seventh;
    "AugmentedMajorSeventh" => name;
    "augmented major seventh" => description;
    "maj7(#5)" => symbol;
}

class IntervalListChord extends Chord
{
    List @ intervals;

    fun void forEach(FloatProcedure procedure)
    {
        procedure.run(root);
        intervals.iterator() @=> Iterator iterator;
        while (iterator.hasNext())
        {
            iterator.next() @=> Interval interval;
            procedure.run(interval.evaluate(root));
        }
    }

    fun Interval sampleInterval()
    {
        if (rand(0, intervals.size() + 1))
        {
            intervals.sample() $ Interval @=> Interval interval;
            return interval;
        }
        else
        {
            return unison;
        }
    }
}
