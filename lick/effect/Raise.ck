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

public class Raise extends Effect
{
    20::ms => dur _rate;
    400::ms => dur _length;

    0 => static int WAITING;
    1 => static int RAISING;
    WAITING => int _state;

    now => time _last;

    PitShift _pitchShift;
    1.0 => _pitchShift.mix;
    1.0 => _pitchShift.shift;

    // note: interval should be descending
    Intervals.octave().desc() @=> Interval _interval;
    Interpolations.linear() @=> Interpolation _interpolation;

    inlet => _pitchShift => wet;

    spork ~ _sporkAtRate();

    fun dur length()
    {
        return _length;
    }

    fun dur length(dur d)
    {
        d => _length;
        reset();
        return _length;
    }

    fun dur rate()
    {
        return _rate;
    }

    fun dur rate(dur d)
    {
        d => _rate;
    }

    fun Interval interval()
    {
        return _interval;
    }

    fun Interval interval(Interval i)
    {
        i @=> _interval;
        reset();
        return _interval;
    }

    fun Interpolation interpolation()
    {
        return _interpolation;
    }

    fun Interpolation interpolation(Interpolation i)
    {
        i @=> _interpolation;
        reset();
        return _interpolation;
    }

    fun void raise()
    {
        RAISING => _state;
        now => _last;
    }

    fun void reset()
    {
        WAITING => _state;
        _interval.evaluate(1.0) => _pitchShift.shift;
    }

    fun void _sporkAtRate()
    {
        while (true)
        {
            now => time current;
            if (WAITING == _state)
            {
                // nothing
            }
            else if (RAISING == _state)
            {
                if (current < (_last + _length))
                {
                    _interpolation.evaluate((_length - (current - _last))/_length) => float value;
                    1.0 - ((1.0 - value) * _interval.evaluate(1.0)) => _pitchShift.shift;
                }
                else
                {
                    WAITING => _state;
                    _interval.evaluate(1.0) => _pitchShift.shift;

                }
            }
            _rate => now;
        }
    }

    fun static Raise create(dur length)
    {
        Raise raise;
        length => raise.length;
        return raise;
    }

    fun static Raise create(dur length, Interval interval, Interpolation interpolation)
    {
        Raise raise;
        length => raise.length;
        interval => raise.interval;
        interpolation => raise.interpolation;
        return raise;
    }

    fun static Raise create(dur length, dur rate, Interval interval, Interpolation interpolation)
    {
        Raise raise;
        length => raise.length;
        rate => raise.rate;
        interval => raise.interval;
        interpolation => raise.interpolation;
        return raise;
    }
}
