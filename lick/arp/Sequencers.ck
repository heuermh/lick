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

class ForwardSequencer extends Sequencer
{
    // empty
}

class ReverseSequencer extends Sequencer
{
    fun int reset()
    {
        return (sequence.size() - 1);
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

class ForwardReverseSequencer extends Sequencer
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
        if (index == (sequence.size() - 1))
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
                return (index > 0);
            }
        }
    }
}

class ReverseForwardSequencer extends Sequencer
{
    false => int ascending;

    fun int reset()
    {
        false => ascending;
        return (sequence.size() - 1);
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
                return (index < (sequence.size() - 1));
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

class ForwardReverseRepeatLastSequencer extends Sequencer
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
        if (index == (sequence.size() - 1))
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

class ReverseForwardRepeatLastSequencer extends Sequencer
{
    false => int ascending;

    fun int reset()
    {
        false => ascending;
        return (sequence.size() - 1);
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
                return (index < sequence.size());
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

class RandomSequencer extends Sequencer
{
    0 => int count;

    fun int reset()
    {
        sequence.size() => count;
        return Std.rand2(0, count - 1);
    }

    fun int next(int index)
    {
        count--;
        return Std.rand2(0, sequence.size() - 1);
    }

    fun int hasNext(int index)
    {
        return (count >= 0);
    }
}

public class Sequencers
{

    fun static ForwardSequencer forward(Sequence sequence, FloatProcedure procedure)
    {
        ForwardSequencer sequencer;
        sequence @=> sequencer.sequence;
        procedure @=> sequencer.procedure;
        return sequencer;
    }

    fun static ReverseSequencer reverse(Sequence sequence, FloatProcedure procedure)
    {
        ReverseSequencer sequencer;
        sequence @=> sequencer.sequence;
        procedure @=> sequencer.procedure;
        return sequencer;
    }

    fun static ForwardReverseSequencer forwardReverse(Sequence sequence, FloatProcedure procedure)
    {
        ForwardReverseSequencer sequencer;
        sequence @=> sequencer.sequence;
        procedure @=> sequencer.procedure;
        return sequencer;
    }

    fun static ReverseForwardSequencer reverseForward(Sequence sequence, FloatProcedure procedure)
    {
        ReverseForwardSequencer sequencer;
        sequence @=> sequencer.sequence;
        procedure @=> sequencer.procedure;
        return sequencer;
    }

    fun static ForwardReverseRepeatLastSequencer forwardReverseRepeatLast(Sequence sequence, FloatProcedure procedure)
    {
        ForwardReverseRepeatLastSequencer sequencer;
        sequence @=> sequencer.sequence;
        procedure @=> sequencer.procedure;
        return sequencer;
    }

    fun static ReverseForwardRepeatLastSequencer reverseForwardRepeatLast(Sequence sequence, FloatProcedure procedure)
    {
        ReverseForwardRepeatLastSequencer sequencer;
        sequence @=> sequencer.sequence;
        procedure @=> sequencer.procedure;
        return sequencer;
    }

    fun static RandomSequencer random(Sequence sequence, FloatProcedure procedure)
    {
        RandomSequencer sequencer;
        sequence @=> sequencer.sequence;
        procedure @=> sequencer.procedure;
        return sequencer;
    }


    fun static ForwardSequencer forward(Sequence sequence, FloatProcedure procedure, dur rate)
    {
        ForwardSequencer sequencer;
        sequence @=> sequencer.sequence;
        procedure @=> sequencer.procedure;
        DurProvider.create(rate) @=> sequencer.waitProvider;
        return sequencer;
    }

    fun static ReverseSequencer reverse(Sequence sequence, FloatProcedure procedure, dur rate)
    {
        ReverseSequencer sequencer;
        sequence @=> sequencer.sequence;
        procedure @=> sequencer.procedure;
        DurProvider.create(rate) @=> sequencer.waitProvider;
        return sequencer;
    }

    fun static ForwardReverseSequencer forwardReverse(Sequence sequence, FloatProcedure procedure, dur rate)
    {
        ForwardReverseSequencer sequencer;
        sequence @=> sequencer.sequence;
        procedure @=> sequencer.procedure;
        DurProvider.create(rate) @=> sequencer.waitProvider;
        return sequencer;
    }

    fun static ReverseForwardSequencer reverseForward(Sequence sequence, FloatProcedure procedure, dur rate)
    {
        ReverseForwardSequencer sequencer;
        sequence @=> sequencer.sequence;
        procedure @=> sequencer.procedure;
        DurProvider.create(rate) @=> sequencer.waitProvider;
        return sequencer;
    }

    fun static ForwardReverseRepeatLastSequencer forwardReverseRepeatLast(Sequence sequence, FloatProcedure procedure, dur rate)
    {
        ForwardReverseRepeatLastSequencer sequencer;
        sequence @=> sequencer.sequence;
        procedure @=> sequencer.procedure;
        DurProvider.create(rate) @=> sequencer.waitProvider;
        return sequencer;
    }

    fun static ReverseForwardRepeatLastSequencer reverseForwardRepeatLast(Sequence sequence, FloatProcedure procedure, dur rate)
    {
        ReverseForwardRepeatLastSequencer sequencer;
        sequence @=> sequencer.sequence;
        procedure @=> sequencer.procedure;
        DurProvider.create(rate) @=> sequencer.waitProvider;
        return sequencer;
    }

    fun static RandomSequencer random(Sequence sequence, FloatProcedure procedure, dur rate)
    {
        RandomSequencer sequencer;
        sequence @=> sequencer.sequence;
        procedure @=> sequencer.procedure;
        DurProvider.create(rate) @=> sequencer.waitProvider;
        return sequencer;
    }


    fun static ForwardSequencer forward(Sequence sequence, Pattern pattern, FloatProcedure procedure)
    {
        ForwardSequencer sequencer;
        sequence @=> sequencer.sequence;
        Patterns.conditionf(pattern, procedure) @=> sequencer.procedure;
        return sequencer;
    }

    fun static ReverseSequencer reverse(Sequence sequence, Pattern pattern, FloatProcedure procedure)
    {
        ReverseSequencer sequencer;
        sequence @=> sequencer.sequence;
        Patterns.conditionf(pattern, procedure) @=> sequencer.procedure;
        return sequencer;
    }

    fun static ForwardReverseSequencer forwardReverse(Sequence sequence, Pattern pattern, FloatProcedure procedure)
    {
        ForwardReverseSequencer sequencer;
        sequence @=> sequencer.sequence;
        Patterns.conditionf(pattern, procedure) @=> sequencer.procedure;
        return sequencer;
    }

    fun static ReverseForwardSequencer reverseForward(Sequence sequence, Pattern pattern, FloatProcedure procedure)
    {
        ReverseForwardSequencer sequencer;
        sequence @=> sequencer.sequence;
        Patterns.conditionf(pattern, procedure) @=> sequencer.procedure;
        return sequencer;
    }

    fun static ForwardReverseRepeatLastSequencer forwardReverseRepeatLast(Sequence sequence, Pattern pattern, FloatProcedure procedure)
    {
        ForwardReverseRepeatLastSequencer sequencer;
        sequence @=> sequencer.sequence;
        Patterns.conditionf(pattern, procedure) @=> sequencer.procedure;
        return sequencer;
    }

    fun static ReverseForwardRepeatLastSequencer reverseForwardRepeatLast(Sequence sequence, Pattern pattern, FloatProcedure procedure)
    {
        ReverseForwardRepeatLastSequencer sequencer;
        sequence @=> sequencer.sequence;
        Patterns.conditionf(pattern, procedure) @=> sequencer.procedure;
        return sequencer;
    }

    fun static RandomSequencer random(Sequence sequence, Pattern pattern, FloatProcedure procedure)
    {
        RandomSequencer sequencer;
        sequence @=> sequencer.sequence;
        Patterns.conditionf(pattern, procedure) @=> sequencer.procedure;
        return sequencer;
    }


    fun static ForwardSequencer forward(Sequence sequence, Pattern pattern, FloatProcedure procedure, dur rate)
    {
        ForwardSequencer sequencer;
        sequence @=> sequencer.sequence;
        Patterns.conditionf(pattern, procedure) @=> sequencer.procedure;
        DurProvider.create(rate) @=> sequencer.waitProvider;
        return sequencer;
    }

    fun static ReverseSequencer reverse(Sequence sequence, Pattern pattern, FloatProcedure procedure, dur rate)
    {
        ReverseSequencer sequencer;
        sequence @=> sequencer.sequence;
        Patterns.conditionf(pattern, procedure) @=> sequencer.procedure;
        DurProvider.create(rate) @=> sequencer.waitProvider;
        return sequencer;
    }

    fun static ForwardReverseSequencer forwardReverse(Sequence sequence, Pattern pattern, FloatProcedure procedure, dur rate)
    {
        ForwardReverseSequencer sequencer;
        sequence @=> sequencer.sequence;
        Patterns.conditionf(pattern, procedure) @=> sequencer.procedure;
        DurProvider.create(rate) @=> sequencer.waitProvider;
        return sequencer;
    }

    fun static ReverseForwardSequencer reverseForward(Sequence sequence, Pattern pattern, FloatProcedure procedure, dur rate)
    {
        ReverseForwardSequencer sequencer;
        sequence @=> sequencer.sequence;
        Patterns.conditionf(pattern, procedure) @=> sequencer.procedure;
        DurProvider.create(rate) @=> sequencer.waitProvider;
        return sequencer;
    }

    fun static ForwardReverseRepeatLastSequencer forwardReverseRepeatLast(Sequence sequence, Pattern pattern, FloatProcedure procedure, dur rate)
    {
        ForwardReverseRepeatLastSequencer sequencer;
        sequence @=> sequencer.sequence;
        Patterns.conditionf(pattern, procedure) @=> sequencer.procedure;
        DurProvider.create(rate) @=> sequencer.waitProvider;
        return sequencer;
    }

    fun static ReverseForwardRepeatLastSequencer reverseForwardRepeatLast(Sequence sequence, Pattern pattern, FloatProcedure procedure, dur rate)
    {
        ReverseForwardRepeatLastSequencer sequencer;
        sequence @=> sequencer.sequence;
        Patterns.conditionf(pattern, procedure) @=> sequencer.procedure;
        DurProvider.create(rate) @=> sequencer.waitProvider;
        return sequencer;
    }

    fun static RandomSequencer random(Sequence sequence, Pattern pattern, FloatProcedure procedure, dur rate)
    {
        RandomSequencer sequencer;
        sequence @=> sequencer.sequence;
        Patterns.conditionf(pattern, procedure) @=> sequencer.procedure;
        DurProvider.create(rate) @=> sequencer.waitProvider;
        return sequencer;
    }
}
