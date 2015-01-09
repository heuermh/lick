/*

    LiCK  Library for ChucK.
    Copyright (c) 2007-2015 held jointly by the individual authors.

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

class UpArpeggiator extends Arpeggiator
{
    // empty
}

class DownArpeggiator extends Arpeggiator
{
    fun int reset()
    {
        return (intervals.size() - 1);
    }

    fun int next(int index)
    {
        return (index - 1);
    }

    fun int hasNext(int index)
    {
        return (index >= 0);
    }
}

class UpDownArpeggiator extends Arpeggiator
{
    true => int ascending;

    fun int reset()
    {
        true => ascending;
        return 0;
    }

    fun int next(int index)
    {
        if (ascending)
        {
            return (index + 1);
        }
        else
        {
            return (index - 1);
        }
    }

    fun int hasNext(int index)
    {
        if (index == (intervals.size() - 1))
        {
            0 => ascending;
            return true;
        }
        else
        {
            if (ascending)
            {
                return true;
            }
            else
            {
                return (index >= 0);
            }
        }
    }
}

class DownUpArpeggiator extends Arpeggiator
{
    false => int ascending;

    fun int reset()
    {
        false => ascending;
        return (intervals.size() - 1);
    }

    fun int next(int index)
    {
        if (ascending)
        {
            return (index + 1);
        }
        else
        {
            return (index - 1);
        }
    }

    fun int hasNext(int index)
    {
        if (index)
        {
            if (ascending)
            {
                return (index < intervals.size());
            }
            else
            {
                return true;
            }
        }
        else
        {
            true => ascending;
            return true;
        }
    }
}

class RandomArpeggiator extends Arpeggiator
{
    0 => int count;

    fun int reset()
    {
        intervals.size() => count;
        return Std.rand2(0, count);
    }

    fun int next(int index)
    {
        count--;
        return Std.rand2(0, intervals.size());
    }

    fun int hasNext(int index)
    {
        return (count >= 0);
    }
}

public class Arpeggiators
{
    fun static UpArpeggiator up(Chord chord, FloatProcedure procedure)
    {
        UpArpeggiator arpeggiator;
        chord.root @=> arpeggiator.root;
        chord.intervals @=> arpeggiator.intervals;
        procedure @=> arpeggiator.procedure;
        return arpeggiator;
    }

    fun static DownArpeggiator down(Chord chord, FloatProcedure procedure)
    {
        DownArpeggiator arpeggiator;
        chord.root @=> arpeggiator.root;
        chord.intervals @=> arpeggiator.intervals;
        procedure @=> arpeggiator.procedure;
        return arpeggiator;
    }

    fun static UpDownArpeggiator upDown(Chord chord, FloatProcedure procedure)
    {
        UpDownArpeggiator arpeggiator;
        chord.root @=> arpeggiator.root;
        chord.intervals @=> arpeggiator.intervals;
        procedure @=> arpeggiator.procedure;
        return arpeggiator;
    }

    fun static DownUpArpeggiator downUp(Chord chord, FloatProcedure procedure)
    {
        DownUpArpeggiator arpeggiator;
        chord.root @=> arpeggiator.root;
        chord.intervals @=> arpeggiator.intervals;
        procedure @=> arpeggiator.procedure;
        return arpeggiator;
    }

    fun static RandomArpeggiator random(Chord chord, FloatProcedure procedure)
    {
        RandomArpeggiator arpeggiator;
        chord.root @=> arpeggiator.root;
        chord.intervals @=> arpeggiator.intervals;
        procedure @=> arpeggiator.procedure;
        return arpeggiator;
    }

    fun static UpArpeggiator up(Scale scale, FloatProcedure procedure)
    {
        UpArpeggiator arpeggiator;
        scale.root @=> arpeggiator.root;
        scale.intervals @=> arpeggiator.intervals;
        procedure @=> arpeggiator.procedure;
        return arpeggiator;
    }

    fun static DownArpeggiator down(Scale scale, FloatProcedure procedure)
    {
        DownArpeggiator arpeggiator;
        scale.root @=> arpeggiator.root;
        scale.intervals @=> arpeggiator.intervals;
        procedure @=> arpeggiator.procedure;
        return arpeggiator;
    }

    fun static UpDownArpeggiator upDown(Scale scale, FloatProcedure procedure)
    {
        UpDownArpeggiator arpeggiator;
        scale.root @=> arpeggiator.root;
        scale.intervals @=> arpeggiator.intervals;
        procedure @=> arpeggiator.procedure;
        return arpeggiator;
    }

    fun static DownUpArpeggiator downUp(Scale scale, FloatProcedure procedure)
    {
        DownUpArpeggiator arpeggiator;
        scale.root @=> arpeggiator.root;
        scale.intervals @=> arpeggiator.intervals;
        procedure @=> arpeggiator.procedure;
        return arpeggiator;
    }

    fun static RandomArpeggiator random(Scale scale, FloatProcedure procedure)
    {
        RandomArpeggiator arpeggiator;
        scale.root @=> arpeggiator.root;
        scale.intervals @=> arpeggiator.intervals;
        procedure @=> arpeggiator.procedure;
        return arpeggiator;
    }


    fun static UpArpeggiator up(Chord chord, FloatProcedure procedure, dur rate)
    {
        UpArpeggiator arpeggiator;
        chord.root @=> arpeggiator.root;
        chord.intervals @=> arpeggiator.intervals;
        procedure @=> arpeggiator.procedure;
        rate => arpeggiator.rate;
        return arpeggiator;
    }

    fun static DownArpeggiator down(Chord chord, FloatProcedure procedure, dur rate)
    {
        DownArpeggiator arpeggiator;
        chord.root @=> arpeggiator.root;
        chord.intervals @=> arpeggiator.intervals;
        procedure @=> arpeggiator.procedure;
        rate => arpeggiator.rate;
        return arpeggiator;
    }

    fun static UpDownArpeggiator upDown(Chord chord, FloatProcedure procedure, dur rate)
    {
        UpDownArpeggiator arpeggiator;
        chord.root @=> arpeggiator.root;
        chord.intervals @=> arpeggiator.intervals;
        procedure @=> arpeggiator.procedure;
        rate => arpeggiator.rate;
        return arpeggiator;
    }

    fun static DownUpArpeggiator downUp(Chord chord, FloatProcedure procedure, dur rate)
    {
        DownUpArpeggiator arpeggiator;
        chord.root @=> arpeggiator.root;
        chord.intervals @=> arpeggiator.intervals;
        procedure @=> arpeggiator.procedure;
        rate => arpeggiator.rate;
        return arpeggiator;
    }

    fun static RandomArpeggiator random(Chord chord, FloatProcedure procedure, dur rate)
    {
        RandomArpeggiator arpeggiator;
        chord.root @=> arpeggiator.root;
        chord.intervals @=> arpeggiator.intervals;
        procedure @=> arpeggiator.procedure;
        rate => arpeggiator.rate;
        return arpeggiator;
    }

    fun static UpArpeggiator up(Scale scale, FloatProcedure procedure, dur rate)
    {
        UpArpeggiator arpeggiator;
        scale.root @=> arpeggiator.root;
        scale.intervals @=> arpeggiator.intervals;
        procedure @=> arpeggiator.procedure;
        rate => arpeggiator.rate;
        return arpeggiator;
    }

    fun static DownArpeggiator down(Scale scale, FloatProcedure procedure, dur rate)
    {
        DownArpeggiator arpeggiator;
        scale.root @=> arpeggiator.root;
        scale.intervals @=> arpeggiator.intervals;
        procedure @=> arpeggiator.procedure;
        rate => arpeggiator.rate;
        return arpeggiator;
    }

    fun static UpDownArpeggiator upDown(Scale scale, FloatProcedure procedure, dur rate)
    {
        UpDownArpeggiator arpeggiator;
        scale.root @=> arpeggiator.root;
        scale.intervals @=> arpeggiator.intervals;
        procedure @=> arpeggiator.procedure;
        rate => arpeggiator.rate;
        return arpeggiator;
    }

    fun static DownUpArpeggiator downUp(Scale scale, FloatProcedure procedure, dur rate)
    {
        DownUpArpeggiator arpeggiator;
        scale.root @=> arpeggiator.root;
        scale.intervals @=> arpeggiator.intervals;
        procedure @=> arpeggiator.procedure;
        rate => arpeggiator.rate;
        return arpeggiator;
    }

    fun static RandomArpeggiator random(Scale scale, FloatProcedure procedure, dur rate)
    {
        RandomArpeggiator arpeggiator;
        scale.root @=> arpeggiator.root;
        scale.intervals @=> arpeggiator.intervals;
        procedure @=> arpeggiator.procedure;
        rate => arpeggiator.rate;
        return arpeggiator;
    }
}
