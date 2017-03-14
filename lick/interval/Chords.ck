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

class Fifth extends Chord
{
    Interval @ fifth;

    fun void updateIntervals()
    {
        intervals.add(unison);
        intervals.add(fifth);
    }

    fun void forEach(FloatProcedure procedure)
    {
        procedure.run(root);
        procedure.run(fifth.evaluate(root));
    }

    fun Interval sampleInterval()
    {
        if (Std.rand2(0, 1))
        {
            return unison;
        }
        else
        {
            return fifth;
        }
    }
}

class PerfectFifth extends Fifth
{
    Intervals.perfectFifth() @=> fifth;
    "PerfectFifth" => name;
    "perfect fifth" => description;
    "5" => symbol;
}

class AugmentedFifth extends Fifth
{
    Intervals.minorSixth() @=> fifth;
    "AugmentedFifth" => name;
    "augmented fifth" => description;
    "aug5" => symbol;
}

class DiminishedFifth extends Fifth
{
    Intervals.augmentedFourth() @=> fifth;
    "DiminishedFifth" => name;
    "diminished fifth" => description;
    "dim5" => symbol;
}

class Triad extends Fifth
{
    Interval @ third;

    fun void updateIntervals()
    {
        intervals.add(unison);
        intervals.add(third);
        intervals.add(fifth);
    }

    fun void forEach(FloatProcedure procedure)
    {
        procedure.run(root);
        procedure.run(third.evaluate(root));
        procedure.run(fifth.evaluate(root));
    }

    fun Interval sampleInterval()
    {
        Std.rand2(0, 2) => int s;
        if (s == 0)
        {
            return unison;
        }
        else if (s == 1)
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
    Intervals.minorSixth() @=> fifth;
    "AugmentedTriad" => name;
    "augmented triad" => description;
    "aug" => symbol;
}

class DiminishedTriad extends Triad
{
    Intervals.minorThird() @=> third;
    Intervals.augmentedFourth() @=> fifth;
    "DiminishedTriad" => name;
    "diminished triad" => description;
    "dim" => symbol;
}

class Seventh extends Triad
{
    Interval @ seventh;

    fun void updateIntervals()
    {
        intervals.add(unison);
        intervals.add(third);
        intervals.add(fifth);
        intervals.add(seventh);
    }

    fun void forEach(FloatProcedure procedure)
    {
        procedure.run(root);
        procedure.run(third.evaluate(root));
        procedure.run(fifth.evaluate(root));
        procedure.run(seventh.evaluate(root));
    }

    fun Interval sampleInterval()
    {
        Std.rand2(0, 3) => int s;
        if (s == 0)
        {
            return unison;
        }
        else if (s == 1)
        {
            return third;
        }
        else if (s == 1)
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
    Intervals.augmentedFourth() @=> fifth;
    Intervals.majorSixth() @=> seventh;
    "DiminishedSeventh" => name;
    "diminished seventh" => description;
    "dim7" => symbol;
}

class HalfDiminishedSeventh extends Seventh
{
    Intervals.minorThird() @=> third;
    Intervals.augmentedFourth() @=> fifth;
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
    Intervals.minorSixth() @=> fifth;
    Intervals.minorSeventh() @=> seventh;
    "AugmentedSeventh" => name;
    "augmented seventh" => description;
    "aug7" => symbol;
}

class AugmentedMajorSeventh extends Seventh
{
    Intervals.majorThird() @=> third;
    Intervals.minorSixth() @=> fifth;
    Intervals.majorSeventh() @=> seventh;
    "AugmentedMajorSeventh" => name;
    "augmented major seventh" => description;
    "maj7(#5)" => symbol;
}

class IntervalListChord extends Chord
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

class DominantNinth extends IntervalListChord
{
    intervals.add(Intervals.unison());
    intervals.add(Intervals.majorThird());
    intervals.add(Intervals.perfectFifth());
    intervals.add(Intervals.minorSeventh());
    intervals.add(Intervals.majorNinth());
    "DominantNinth" => name;
    "dominant ninth" => description;
    "9" => symbol;
}

class DominantEleventh extends IntervalListChord
{
    intervals.add(Intervals.unison());
    intervals.add(Intervals.majorThird());
    intervals.add(Intervals.perfectFifth());
    intervals.add(Intervals.minorSeventh());
    intervals.add(Intervals.majorNinth());
    intervals.add(Intervals.perfectEleventh());
    "DominantEleventh" => name;
    "dominant eleventh" => description;
    "11" => symbol;
}

class DominantThirteenth extends IntervalListChord
{
    intervals.add(Intervals.unison());
    intervals.add(Intervals.majorThird());
    intervals.add(Intervals.perfectFifth());
    intervals.add(Intervals.minorSeventh());
    intervals.add(Intervals.majorNinth());
    intervals.add(Intervals.perfectEleventh());
    intervals.add(Intervals.majorThirteenth());
    "DominantThirteenth" => name;
    "dominant thirteenth" => description;
    "13" => symbol;
}

class MajorNinth extends IntervalListChord
{
    intervals.add(Intervals.unison());
    intervals.add(Intervals.majorThird());
    intervals.add(Intervals.perfectFifth());
    intervals.add(Intervals.majorSeventh());
    intervals.add(Intervals.majorNinth());
    "MajorNinth" => name;
    "major ninth" => description;
    "maj9" => symbol;
}

class MajorEleventh extends IntervalListChord
{
    intervals.add(Intervals.unison());
    intervals.add(Intervals.majorThird());
    intervals.add(Intervals.perfectFifth());
    intervals.add(Intervals.majorSeventh());
    intervals.add(Intervals.majorNinth());
    intervals.add(Intervals.perfectEleventh());
    "MajorEleventh" => name;
    "major eleventh" => description;
    "maj11" => symbol;
}

class MajorThirteenth extends IntervalListChord
{
    intervals.add(Intervals.unison());
    intervals.add(Intervals.majorThird());
    intervals.add(Intervals.perfectFifth());
    intervals.add(Intervals.majorSeventh());
    intervals.add(Intervals.majorNinth());
    intervals.add(Intervals.perfectEleventh());
    intervals.add(Intervals.majorThirteenth());
    "MajorThirteenth" => name;
    "major thirteenth" => description;
    "maj13" => symbol;
}

class MinorNinth extends IntervalListChord
{
    intervals.add(Intervals.unison());
    intervals.add(Intervals.minorThird());
    intervals.add(Intervals.perfectFifth());
    intervals.add(Intervals.minorSeventh());
    intervals.add(Intervals.majorNinth());
    "MinorNinth" => name;
    "minor ninth" => description;
    "min9" => symbol;
}

class MinorEleventh extends IntervalListChord
{
    intervals.add(Intervals.unison());
    intervals.add(Intervals.minorThird());
    intervals.add(Intervals.perfectFifth());
    intervals.add(Intervals.minorSeventh());
    intervals.add(Intervals.majorNinth());
    intervals.add(Intervals.perfectEleventh());
    "MinorEleventh" => name;
    "minor eleventh" => description;
    "min11" => symbol;
}

class MinorThirteenth extends IntervalListChord
{
    intervals.add(Intervals.unison());
    intervals.add(Intervals.minorThird());
    intervals.add(Intervals.perfectFifth());
    intervals.add(Intervals.minorSeventh());
    intervals.add(Intervals.majorNinth());
    intervals.add(Intervals.perfectEleventh());
    intervals.add(Intervals.majorThirteenth());
    "MinorThirteenth" => name;
    "minor thirteenth" => description;
    "min13" => symbol;
}

class AddNine extends IntervalListChord
{
    intervals.add(Intervals.unison());
    intervals.add(Intervals.majorThird());
    intervals.add(Intervals.perfectFifth());
    intervals.add(Intervals.majorNinth());
    "AddNine" => name;
    "add nine" => description;
    "add9" => symbol;
}

class MajorFourth extends IntervalListChord
{
    intervals.add(Intervals.unison());
    intervals.add(Intervals.majorThird());
    intervals.add(Intervals.perfectFifth());
    intervals.add(Intervals.perfectEleventh());
    "MajorFourth" => name;
    "major fourth" => description;
    "add11" => symbol;
}

class MajorSixth extends IntervalListChord
{
    intervals.add(Intervals.unison());
    intervals.add(Intervals.majorThird());
    intervals.add(Intervals.perfectFifth());
    intervals.add(Intervals.majorSixth());
    "MajorSixth" => name;
    "major sixth" => description;
    "6" => symbol;
}

class SixNine extends IntervalListChord
{
    intervals.add(Intervals.unison());
    intervals.add(Intervals.majorThird());
    intervals.add(Intervals.perfectFifth());
    intervals.add(Intervals.majorSixth());
    intervals.add(Intervals.majorNinth());
    "SixNine" => name;
    "six-nine" => description;
    "6/9" => symbol;
}

class SuspendedSecond extends IntervalListChord
{
    intervals.add(Intervals.unison());
    intervals.add(Intervals.majorSecond());
    intervals.add(Intervals.perfectFifth());
    "SuspendedSecond" => name;
    "suspended second" => description;
    "sus2" => symbol;
}

class SuspendedFourth extends IntervalListChord
{
    intervals.add(Intervals.unison());
    intervals.add(Intervals.perfectFourth());
    intervals.add(Intervals.perfectFifth());
    "SuspendedFourth" => name;
    "suspended fourth" => description;
    "sus4" => symbol;
}

public class Chords
{
    fun static PerfectFifth perfectFifth(float root)
    {
        PerfectFifth perfectFifth;
        root => perfectFifth.root;
        perfectFifth.updateIntervals();
        return perfectFifth;
    }

    fun static PerfectFifth perfectFifth(float root, string name)
    {
        PerfectFifth perfectFifth;
        root => perfectFifth.root;
        perfectFifth.updateIntervals();
        name + " " + perfectFifth.name => perfectFifth.name;
        name + " " + perfectFifth.description => perfectFifth.description;
        name + perfectFifth.symbol => perfectFifth.symbol;
        return perfectFifth;
    }

    fun static AugmentedFifth augmentedFifth(float root)
    {
        AugmentedFifth augmentedFifth;
        root => augmentedFifth.root;
        augmentedFifth.updateIntervals();
        return augmentedFifth;
    }

    fun static AugmentedFifth augmentedFifth(float root, string name)
    {
        AugmentedFifth augmentedFifth;
        root => augmentedFifth.root;
        augmentedFifth.updateIntervals();
        name + " " + augmentedFifth.name => augmentedFifth.name;
        name + " " + augmentedFifth.description => augmentedFifth.description;
        name + augmentedFifth.symbol => augmentedFifth.symbol;
        return augmentedFifth;
    }

    fun static DiminishedFifth diminishedFifth(float root)
    {
        DiminishedFifth diminishedFifth;
        root => diminishedFifth.root;
        diminishedFifth.updateIntervals();
        return diminishedFifth;
    }

    fun static DiminishedFifth diminishedFifth(float root, string name)
    {
        DiminishedFifth diminishedFifth;
        root => diminishedFifth.root;
        diminishedFifth.updateIntervals();
        name + " " + diminishedFifth.name => diminishedFifth.name;
        name + " " + diminishedFifth.description => diminishedFifth.description;
        name + diminishedFifth.symbol => diminishedFifth.symbol;
        return diminishedFifth;
    }

    fun static MajorTriad majorTriad(float root)
    {
        MajorTriad majorTriad;
        root => majorTriad.root;
        majorTriad.updateIntervals();
        return majorTriad;
    }

    fun static MajorTriad majorTriad(float root, string name)
    {
        MajorTriad majorTriad;
        root => majorTriad.root;
        majorTriad.updateIntervals();
        name + " " + majorTriad.name => majorTriad.name;
        name + " " + majorTriad.description => majorTriad.description;
        name + majorTriad.symbol => majorTriad.symbol;
        return majorTriad;
    }

    fun static MinorTriad minorTriad(float root)
    {
        MinorTriad minorTriad;
        root => minorTriad.root;
        minorTriad.updateIntervals();
        return minorTriad;
    }

    fun static MinorTriad minorTriad(float root, string name)
    {
        MinorTriad minorTriad;
        root => minorTriad.root;
        minorTriad.updateIntervals();
        name + " " + minorTriad.name => minorTriad.name;
        name + " " + minorTriad.description => minorTriad.description;
        name + minorTriad.symbol => minorTriad.symbol;
        return minorTriad;
    }

    fun static AugmentedTriad augmentedTriad(float root)
    {
        AugmentedTriad augmentedTriad;
        root => augmentedTriad.root;
        augmentedTriad.updateIntervals();
        return augmentedTriad;
    }

    fun static AugmentedTriad augmentedTriad(float root, string name)
    {
        AugmentedTriad augmentedTriad;
        root => augmentedTriad.root;
        augmentedTriad.updateIntervals();
        name + " " + augmentedTriad.name => augmentedTriad.name;
        name + " " + augmentedTriad.description => augmentedTriad.description;
        name + augmentedTriad.symbol => augmentedTriad.symbol;
        return augmentedTriad;
    }

    fun static DiminishedTriad diminishedTriad(float root)
    {
        DiminishedTriad diminishedTriad;
        root => diminishedTriad.root;
        diminishedTriad.updateIntervals();
        return diminishedTriad;
    }

    fun static DiminishedTriad diminishedTriad(float root, string name)
    {
        DiminishedTriad diminishedTriad;
        root => diminishedTriad.root;
        diminishedTriad.updateIntervals();
        name + " " + diminishedTriad.name => diminishedTriad.name;
        name + " " + diminishedTriad.description => diminishedTriad.description;
        name + diminishedTriad.symbol => diminishedTriad.symbol;
        return diminishedTriad;
    }

    fun static DiminishedSeventh diminishedSeventh(float root)
    {
        DiminishedSeventh diminishedSeventh;
        root => diminishedSeventh.root;
        diminishedSeventh.updateIntervals();
        return diminishedSeventh;
    }

    fun static DiminishedSeventh diminishedSeventh(float root, string name)
    {
        DiminishedSeventh diminishedSeventh;
        root => diminishedSeventh.root;
        diminishedSeventh.updateIntervals();
        name + " " + diminishedSeventh.name => diminishedSeventh.name;
        name + " " + diminishedSeventh.description => diminishedSeventh.description;
        name + diminishedSeventh.symbol => diminishedSeventh.symbol;
        return diminishedSeventh;
    }

    fun static HalfDiminishedSeventh halfDiminishedSeventh(float root)
    {
        HalfDiminishedSeventh halfDiminishedSeventh;
        root => halfDiminishedSeventh.root;
        halfDiminishedSeventh.updateIntervals();
        return halfDiminishedSeventh;
    }

    fun static HalfDiminishedSeventh halfDiminishedSeventh(float root, string name)
    {
        HalfDiminishedSeventh halfDiminishedSeventh;
        root => halfDiminishedSeventh.root;
        halfDiminishedSeventh.updateIntervals();
        name + " " + halfDiminishedSeventh.name => halfDiminishedSeventh.name;
        name + " " + halfDiminishedSeventh.description => halfDiminishedSeventh.description;
        name + halfDiminishedSeventh.symbol => halfDiminishedSeventh.symbol;
        return halfDiminishedSeventh;
    }

    fun static MinorSeventh minorSeventh(float root)
    {
        MinorSeventh minorSeventh;
        root => minorSeventh.root;
        minorSeventh.updateIntervals();
        return minorSeventh;
    }

    fun static MinorSeventh minorSeventh(float root, string name)
    {
        MinorSeventh minorSeventh;
        root => minorSeventh.root;
        minorSeventh.updateIntervals();
        name + " " + minorSeventh.name => minorSeventh.name;
        name + " " + minorSeventh.description => minorSeventh.description;
        name + minorSeventh.symbol => minorSeventh.symbol;
        return minorSeventh;
    }

    fun static MinorMajorSeventh minorMajorSeventh(float root)
    {
        MinorMajorSeventh minorMajorSeventh;
        root => minorMajorSeventh.root;
        minorMajorSeventh.updateIntervals();
        return minorMajorSeventh;
    }

    fun static MinorMajorSeventh minorMajorSeventh(float root, string name)
    {
        MinorMajorSeventh minorMajorSeventh;
        root => minorMajorSeventh.root;
        minorMajorSeventh.updateIntervals();
        name + " " + minorMajorSeventh.name => minorMajorSeventh.name;
        name + " " + minorMajorSeventh.description => minorMajorSeventh.description;
        name + minorMajorSeventh.symbol => minorMajorSeventh.symbol;
        return minorMajorSeventh;
    }

    fun static DominantSeventh dominantSeventh(float root)
    {
        DominantSeventh dominantSeventh;
        root => dominantSeventh.root;
        dominantSeventh.updateIntervals();
        return dominantSeventh;
    }

    fun static DominantSeventh dominantSeventh(float root, string name)
    {
        DominantSeventh dominantSeventh;
        root => dominantSeventh.root;
        dominantSeventh.updateIntervals();
        name + " " + dominantSeventh.name => dominantSeventh.name;
        name + " " + dominantSeventh.description => dominantSeventh.description;
        name + dominantSeventh.symbol => dominantSeventh.symbol;
        return dominantSeventh;
    }

    fun static MajorSeventh majorSeventh(float root)
    {
        MajorSeventh majorSeventh;
        root => majorSeventh.root;
        majorSeventh.updateIntervals();
        return majorSeventh;
    }

    fun static MajorSeventh majorSeventh(float root, string name)
    {
        MajorSeventh majorSeventh;
        root => majorSeventh.root;
        majorSeventh.updateIntervals();
        name + " " + majorSeventh.name => majorSeventh.name;
        name + " " + majorSeventh.description => majorSeventh.description;
        name + majorSeventh.symbol => majorSeventh.symbol;
        return majorSeventh;
    }

    fun static AugmentedSeventh augmentedSeventh(float root)
    {
        AugmentedSeventh augmentedSeventh;
        root => augmentedSeventh.root;
        augmentedSeventh.updateIntervals();
        return augmentedSeventh;
    }

    fun static AugmentedSeventh augmentedSeventh(float root, string name)
    {
        AugmentedSeventh augmentedSeventh;
        root => augmentedSeventh.root;
        augmentedSeventh.updateIntervals();
        name + " " + augmentedSeventh.name => augmentedSeventh.name;
        name + " " + augmentedSeventh.description => augmentedSeventh.description;
        name + augmentedSeventh.symbol => augmentedSeventh.symbol;
        return augmentedSeventh;
    }

    fun static AugmentedMajorSeventh augmentedMajorSeventh(float root)
    {
        AugmentedMajorSeventh augmentedMajorSeventh;
        root => augmentedMajorSeventh.root;
        augmentedMajorSeventh.updateIntervals();
        return augmentedMajorSeventh;
    }

    fun static AugmentedMajorSeventh augmentedMajorSeventh(float root, string name)
    {
        AugmentedMajorSeventh augmentedMajorSeventh;
        root => augmentedMajorSeventh.root;
        augmentedMajorSeventh.updateIntervals();
        name + " " + augmentedMajorSeventh.name => augmentedMajorSeventh.name;
        name + " " + augmentedMajorSeventh.description => augmentedMajorSeventh.description;
        name + augmentedMajorSeventh.symbol => augmentedMajorSeventh.symbol;
        return augmentedMajorSeventh;
    }

    fun static DominantNinth dominantNinth(float root)
    {
        DominantNinth dominantNinth;
        root => dominantNinth.root;
        return dominantNinth;
    }

    fun static DominantNinth dominantNinth(float root, string name)
    {
        DominantNinth dominantNinth;
        root => dominantNinth.root;
        name + " " + dominantNinth.name => dominantNinth.name;
        name + " " + dominantNinth.description => dominantNinth.description;
        name + dominantNinth.symbol => dominantNinth.symbol;
        return dominantNinth;
    }

    fun static MinorNinth minorNinth(float root)
    {
        MinorNinth minorNinth;
        root => minorNinth.root;
        return minorNinth;
    }

    fun static MinorNinth minorNinth(float root, string name)
    {
        MinorNinth minorNinth;
        root => minorNinth.root;
        name + " " + minorNinth.name => minorNinth.name;
        name + " " + minorNinth.description => minorNinth.description;
        name + minorNinth.symbol => minorNinth.symbol;
        return minorNinth;
    }

    fun static MajorNinth majorNinth(float root)
    {
        MajorNinth majorNinth;
        root => majorNinth.root;
        return majorNinth;
    }

    fun static MajorNinth majorNinth(float root, string name)
    {
        MajorNinth majorNinth;
        root => majorNinth.root;
        name + " " + majorNinth.name => majorNinth.name;
        name + " " + majorNinth.description => majorNinth.description;
        name + majorNinth.symbol => majorNinth.symbol;
        return majorNinth;
    }

    fun static DominantEleventh dominantEleventh(float root)
    {
        DominantEleventh dominantEleventh;
        root => dominantEleventh.root;
        return dominantEleventh;
    }

    fun static DominantEleventh dominantEleventh(float root, string name)
    {
        DominantEleventh dominantEleventh;
        root => dominantEleventh.root;
        name + " " + dominantEleventh.name => dominantEleventh.name;
        name + " " + dominantEleventh.description => dominantEleventh.description;
        name + dominantEleventh.symbol => dominantEleventh.symbol;
        return dominantEleventh;
    }

    fun static MinorEleventh minorEleventh(float root)
    {
        MinorEleventh minorEleventh;
        root => minorEleventh.root;
        return minorEleventh;
    }

    fun static MinorEleventh minorEleventh(float root, string name)
    {
        MinorEleventh minorEleventh;
        root => minorEleventh.root;
        name + " " + minorEleventh.name => minorEleventh.name;
        name + " " + minorEleventh.description => minorEleventh.description;
        name + minorEleventh.symbol => minorEleventh.symbol;
        return minorEleventh;
    }

    fun static MajorEleventh majorEleventh(float root)
    {
        MajorEleventh majorEleventh;
        root => majorEleventh.root;
        return majorEleventh;
    }

    fun static MajorEleventh majorEleventh(float root, string name)
    {
        MajorEleventh majorEleventh;
        root => majorEleventh.root;
        name + " " + majorEleventh.name => majorEleventh.name;
        name + " " + majorEleventh.description => majorEleventh.description;
        name + majorEleventh.symbol => majorEleventh.symbol;
        return majorEleventh;
    }

    fun static DominantThirteenth dominantThirteenth(float root)
    {
        DominantThirteenth dominantThirteenth;
        root => dominantThirteenth.root;
        return dominantThirteenth;
    }

    fun static DominantThirteenth dominantThirteenth(float root, string name)
    {
        DominantThirteenth dominantThirteenth;
        root => dominantThirteenth.root;
        name + " " + dominantThirteenth.name => dominantThirteenth.name;
        name + " " + dominantThirteenth.description => dominantThirteenth.description;
        name + dominantThirteenth.symbol => dominantThirteenth.symbol;
        return dominantThirteenth;
    }

    fun static MinorThirteenth minorThirteenth(float root)
    {
        MinorThirteenth minorThirteenth;
        root => minorThirteenth.root;
        return minorThirteenth;
    }

    fun static MinorThirteenth minorThirteenth(float root, string name)
    {
        MinorThirteenth minorThirteenth;
        root => minorThirteenth.root;
        name + " " + minorThirteenth.name => minorThirteenth.name;
        name + " " + minorThirteenth.description => minorThirteenth.description;
        name + minorThirteenth.symbol => minorThirteenth.symbol;
        return minorThirteenth;
    }

    fun static MajorThirteenth majorThirteenth(float root)
    {
        MajorThirteenth majorThirteenth;
        root => majorThirteenth.root;
        return majorThirteenth;
    }

    fun static MajorThirteenth majorThirteenth(float root, string name)
    {
        MajorThirteenth majorThirteenth;
        root => majorThirteenth.root;
        name + " " + majorThirteenth.name => majorThirteenth.name;
        name + " " + majorThirteenth.description => majorThirteenth.description;
        name + majorThirteenth.symbol => majorThirteenth.symbol;
        return majorThirteenth;
    }

    fun static AddNine addNine(float root)
    {
        AddNine addNine;
        root => addNine.root;
        return addNine;
    }

    fun static AddNine addNine(float root, string name)
    {
        AddNine addNine;
        root => addNine.root;
        name + " " + addNine.name => addNine.name;
        name + " " + addNine.description => addNine.description;
        name + addNine.symbol => addNine.symbol;
        return addNine;
    }

    fun static MajorFourth majorFourth(float root)
    {
        MajorFourth majorFourth;
        root => majorFourth.root;
        return majorFourth;
    }

    fun static MajorFourth majorFourth(float root, string name)
    {
        MajorFourth majorFourth;
        root => majorFourth.root;
        name + " " + majorFourth.name => majorFourth.name;
        name + " " + majorFourth.description => majorFourth.description;
        name + majorFourth.symbol => majorFourth.symbol;
        return majorFourth;
    }

    fun static MajorSixth majorSixth(float root)
    {
        MajorSixth majorSixth;
        root => majorSixth.root;
        return majorSixth;
    }

    fun static MajorSixth majorSixth(float root, string name)
    {
        MajorSixth majorSixth;
        root => majorSixth.root;
        name + " " + majorSixth.name => majorSixth.name;
        name + " " + majorSixth.description => majorSixth.description;
        name + majorSixth.symbol => majorSixth.symbol;
        return majorSixth;
    }

    fun static SixNine sixNine(float root)
    {
        SixNine sixNine;
        root => sixNine.root;
        return sixNine;
    }

    fun static SixNine sixNine(float root, string name)
    {
        SixNine sixNine;
        root => sixNine.root;
        name + " " + sixNine.name => sixNine.name;
        name + " " + sixNine.description => sixNine.description;
        name + sixNine.symbol => sixNine.symbol;
        return sixNine;
    }

    fun static SuspendedSecond suspendedSecond(float root)
    {
        SuspendedSecond suspendedSecond;
        root => suspendedSecond.root;
        return suspendedSecond;
    }

    fun static SuspendedSecond suspendedSecond(float root, string name)
    {
        SuspendedSecond suspendedSecond;
        root => suspendedSecond.root;
        name + " " + suspendedSecond.name => suspendedSecond.name;
        name + " " + suspendedSecond.description => suspendedSecond.description;
        name + suspendedSecond.symbol => suspendedSecond.symbol;
        return suspendedSecond;
    }

    fun static SuspendedFourth suspendedFourth(float root)
    {
        SuspendedFourth suspendedFourth;
        root => suspendedFourth.root;
        return suspendedFourth;
    }

    fun static SuspendedFourth suspendedFourth(float root, string name)
    {
        SuspendedFourth suspendedFourth;
        root => suspendedFourth.root;
        name + " " + suspendedFourth.name => suspendedFourth.name;
        name + " " + suspendedFourth.description => suspendedFourth.description;
        name + suspendedFourth.symbol => suspendedFourth.symbol;
        return suspendedFourth;
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

    fun static Seventh seventh(float root, Interval third, Interval fifth, Interval seventh)
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

    fun static IntervalListChord chord(float root, ArrayList intervals)
    {
        IntervalListChord intervalListChord;
        root => intervalListChord.root;
        intervals @=> intervalListChord.intervals;
        return intervalListChord;
    }
}
