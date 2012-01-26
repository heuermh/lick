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

    fun dur doubleWhole()
    {
        return d;
    }

    fun dur semibreve()
    {
        return w;
    }

    fun dur whole()
    {
        return w;
    }

    fun dur minim()
    {
        return h;
    }

    fun dur half()
    {
        return h;
    }

    fun dur crotchet()
    {
        return q;
    }

    fun dur quarter()
    {
        return q;
    }

    fun dur quaver()
    {
        return e;
    }

    fun dur eighth()
    {
        return e;
    }

    fun dur semiQuaver()
    {
        return s;
    }

    fun dur sixteenth()
    {
        return s;
    }

    fun dur demiSemiQuaver()
    {
        return t;
    }

    fun dur thirtySecond()
    {
        return t;
    }

    fun dur hemiDemiSemiQuaver()
    {
        return f;
    }

    fun dur sixtyFourth()
    {
        return f;
    }

    fun dur semiHemiDemiSemiQuaver()
    {
        return u;
    }

    fun dur hundredTwentyEighth()
    {
        return u;
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