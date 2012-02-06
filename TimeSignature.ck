/*

    LiCK  Library for ChucK.
    Copyright (c) 2007-2012 held jointly by the individual authors.

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

class BreveProvider extends HumanizedDurProvider
{
    TimeSignature @ timeSignature;

    fun dur evaluate()
    {
        timeSignature.d => duration;
        //return super.evaluate();  not supported
        return duration - (duration * Std.rand2f(0.0, anticipation)) + (duration * Std.rand2f(0.0, delay));
    }
}

class DoubleWholeProvider extends BreveProvider
{
    // empty
}

class SemibreveProvider extends HumanizedDurProvider
{
    TimeSignature @ timeSignature;

    fun dur evaluate()
    {
        timeSignature.w => duration;
        return duration - (duration * Std.rand2f(0.0, anticipation)) + (duration * Std.rand2f(0.0, delay));
    }
}

class WholeProvider extends SemibreveProvider
{
    // empty
}

class MinimProvider extends HumanizedDurProvider
{
    TimeSignature @ timeSignature;

    fun dur evaluate()
    {
        timeSignature.h => duration;
        return duration - (duration * Std.rand2f(0.0, anticipation)) + (duration * Std.rand2f(0.0, delay));
    }
}

class HalfProvider extends MinimProvider
{
    // empty
}

class CrotchetProvider extends HumanizedDurProvider
{
    TimeSignature @ timeSignature;

    fun dur evaluate()
    {
        timeSignature.q => duration;
        return duration - (duration * Std.rand2f(0.0, anticipation)) + (duration * Std.rand2f(0.0, delay));
    }
}

class QuarterProvider extends CrotchetProvider
{
    // empty
}

class QuaverProvider extends HumanizedDurProvider
{
    TimeSignature @ timeSignature;

    fun dur evaluate()
    {
        timeSignature.e => duration;
        return duration - (duration * Std.rand2f(0.0, anticipation)) + (duration * Std.rand2f(0.0, delay));
    }
}

class EighthProvider extends QuaverProvider
{
    // empty
}

class SemiquaverProvider extends HumanizedDurProvider
{
    TimeSignature @ timeSignature;

    fun dur evaluate()
    {
        timeSignature.s => duration;
        return duration - (duration * Std.rand2f(0.0, anticipation)) + (duration * Std.rand2f(0.0, delay));
    }
}

class SixteenthProvider extends SemiquaverProvider
{
    // empty
}

class DemiSemiquaverProvider extends HumanizedDurProvider
{
    TimeSignature @ timeSignature;

    fun dur evaluate()
    {
        timeSignature.t => duration;
        return duration - (duration * Std.rand2f(0.0, anticipation)) + (duration * Std.rand2f(0.0, delay));
    }
}

class ThirtySecondProvider extends DemiSemiquaverProvider
{
    // empty
}

class HemiDemiSemiquaverProvider extends HumanizedDurProvider
{
    TimeSignature @ timeSignature;

    fun dur evaluate()
    {
        timeSignature.f => duration;
        return duration - (duration * Std.rand2f(0.0, anticipation)) + (duration * Std.rand2f(0.0, delay));
    }
}

class SixtyFourthProvider extends HemiDemiSemiquaverProvider
{
    // empty
}

class SemiHemiDemiSemiquaverProvider extends HumanizedDurProvider
{
    TimeSignature @ timeSignature;

    fun dur evaluate()
    {
        timeSignature.u => duration;
        return duration - (duration * Std.rand2f(0.0, anticipation)) + (duration * Std.rand2f(0.0, delay));
    }
}

class HundredTwentyEighthProvider extends SemiHemiDemiSemiquaverProvider
{
    // empty
}

public class TimeSignature
{
    int bar;
    int beat;
    int bpm;
    dur d;
    dur w;
    dur h;
    dur q;
    dur e;
    dur s;
    dur t;
    dur f;
    dur u;

    fun void update()
    {
        1::minute / bpm => dur b;
        b * 8 => d;
        b * 4 => w;
        b * 2 => h;
        b => q;
        b / 2 => e;
        b / 4 => s;
        b / 8 => t;
        b / 16 => f;
        b / 32 => u;
    }

    fun dur breve()
    {
        return d;
    }

    fun BreveProvider breveProvider()
    {
        BreveProvider breveProvider;
        this @=> breveProvider.timeSignature;
        return breveProvider;
    }

    fun dur doubleWhole()
    {
        return breve();
    }

    fun DoubleWholeProvider doubleWholeProvider()
    {
        DoubleWholeProvider doubleWholeProvider;
        this @=> doubleWholeProvider.timeSignature;
        return doubleWholeProvider;
    }

    fun dur semibreve()
    {
        return w;
    }

    fun SemibreveProvider semibreveProvider()
    {
        SemibreveProvider semibreveProvider;
        this @=> semibreveProvider.timeSignature;
        return semibreveProvider;
    }

    fun dur whole()
    {
        return semibreve();
    }

    fun WholeProvider wholeProvider()
    {
        WholeProvider wholeProvider;
        this @=> wholeProvider.timeSignature;
        return wholeProvider;
    }

    fun dur minim()
    {
        return h;
    }

    fun MinimProvider minimProvider()
    {
        MinimProvider minimProvider;
        this @=> minimProvider.timeSignature;
        return minimProvider;
    }

    fun dur half()
    {
        return minim();
    }

    fun HalfProvider halfProvider()
    {
        HalfProvider halfProvider;
        this @=> halfProvider.timeSignature;
        return halfProvider;
    }

    fun dur crotchet()
    {
        return q;
    }

    fun CrotchetProvider crotchetProvider()
    {
        CrotchetProvider crotchetProvider;
        this @=> crotchetProvider.timeSignature;
        return crotchetProvider;
    }

    fun dur quarter()
    {
        return crotchet();
    }

    fun QuarterProvider quarterProvider()
    {
        QuarterProvider quarterProvider;
        this @=> quarterProvider.timeSignature;
        return quarterProvider;
    }

    fun dur quaver()
    {
        return e;
    }

    fun QuaverProvider quaverProvider()
    {
        QuaverProvider quaverProvider;
        this @=> quaverProvider.timeSignature;
        return quaverProvider;
    }

    fun dur eighth()
    {
        return quaver();
    }

    fun EighthProvider eighthProvider()
    {
        EighthProvider eighthProvider;
        this @=> eighthProvider.timeSignature;
        return eighthProvider;
    }

    fun dur semiquaver()
    {
        return s;
    }

    fun SemiquaverProvider semiquaverProvider()
    {
        SemiquaverProvider semiquaverProvider;
        this @=> semiquaverProvider.timeSignature;
        return semiquaverProvider;
    }

    fun dur sixteenth()
    {
        return semiquaver();
    }

    fun SixteenthProvider sixteenthProvider()
    {
        SixteenthProvider sixteenthProvider;
        this @=> sixteenthProvider.timeSignature;
        return sixteenthProvider;
    }

    fun dur demiSemiquaver()
    {
        return t;
    }

    fun DemiSemiquaverProvider demiSemiquaverProvider()
    {
        DemiSemiquaverProvider demiSemiquaverProvider;
        this @=> demiSemiquaverProvider.timeSignature;
        return demiSemiquaverProvider;
    }

    fun dur thirtySecond()
    {
        return demiSemiquaver();
    }

    fun ThirtySecondProvider thirtySecondProvider()
    {
        ThirtySecondProvider thirtySecondProvider;
        this @=> thirtySecondProvider.timeSignature;
        return thirtySecondProvider;
    }

    fun dur hemiDemiSemiquaver()
    {
        return f;
    }

    fun HemiDemiSemiquaverProvider hemiDemiSemiquaverProvider()
    {
        HemiDemiSemiquaverProvider hemiDemiSemiquaverProvider;
        this @=> hemiDemiSemiquaverProvider.timeSignature;
        return hemiDemiSemiquaverProvider;
    }

    fun dur sixtyFourth()
    {
        return hemiDemiSemiquaver();
    }

    fun SixtyFourthProvider sixtyFourthProvider()
    {
        SixtyFourthProvider sixtyFourthProvider;
        this @=> sixtyFourthProvider.timeSignature;
        return sixtyFourthProvider;
    }

    fun dur semiHemiDemiSemiquaver()
    {
        return u;
    }

    fun SemiHemiDemiSemiquaverProvider semiHemiDemiSemiquaverProvider()
    {
        SemiHemiDemiSemiquaverProvider semiHemiDemiSemiquaverProvider;
        this @=> semiHemiDemiSemiquaverProvider.timeSignature;
        return semiHemiDemiSemiquaverProvider;
    }

    fun dur hundredTwentyEighth()
    {
        return semiHemiDemiSemiquaver();
    }

    fun HundredTwentyEighthProvider hundredTwentyEighthProvider()
    {
        HundredTwentyEighthProvider hundredTwentyEighthProvider;
        this @=> hundredTwentyEighthProvider.timeSignature;
        return hundredTwentyEighthProvider;
    }

    fun dur dotted(dur note)
    {
        return note + (note / 2);
    }

    fun static TimeSignature common()
    {
        return create(4, 4, 120);
    }

    fun static TimeSignature common(int bpm)
    {
        return create(4, 4, bpm);
    }

    fun static TimeSignature create(int bar, int beat)
    {
        return create(bar, beat, 120);
    }

    fun static TimeSignature create(int bar, int beat, int bpm)
    {
        TimeSignature timeSignature;
        bar => timeSignature.bar;
        beat => timeSignature.beat;
        bpm => timeSignature.bpm;
        timeSignature.update();
        return timeSignature;
    }
}
