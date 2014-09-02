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

/*

   when volume drops below a cutoff, set pitshift from follower to some interval
   if volume is above cutoff, raise pitshift from follower up to identity

 */

class GainReset extends FloatProcedure
{
    Raise @ _raise;

    fun void run(float gain)
    {
        if (gain < 0.05)
        {
            <<<"gain reset", gain>>>;
            _raise.reset();
        }
    }
}

class Raise extends Effect
{
    20::ms => dur _rate;

    0.0 => float _l;
    400::ms => dur _length;
    now => time _last;

    0 => static int RAISING;
    1 => static int RAISED;
    RAISING => int _state;

    PitShift _pitchShift;
    GainReset _gainReset;
    Intervals.octave().desc() @=> Interval _interval;
    SigmuGainFollower.create(_gainReset) @=> SigmuGainFollower _gainFollower;

    1.0 => _pitchShift.mix;
    this @=> _gainReset._raise;

    inlet => _gainFollower => _pitchShift => wet;

    spork ~ _sporkAtRate();

    fun void _sporkAtRate()
    {
        now => time current;
        if (RAISING == _state)
        {
            if (current < (_last + _length))
            {
                1.0 - (_last - current) / _length => _l; // 1.0 - 0.0 for start, 1.0 - 1.0 for end
                1.0 - (_l * _interval.evaluate(1.0)) => _pitchShift.shift; //1.0 - (1.0 * 0.5) = 0.5 for start, 1.0 - (0.0 * 0.5) = 0.0 for end
            }
            else
            {
                <<<"raised">>>;
                RAISED => _state;
            }
        }
        else if (RAISED == _state)
        {
            // just wait for reset
        }
        _rate => now;
    }

    fun void reset()
    {
        0.0 => _l;
        now => _last;
        <<<"raising">>>;
        RAISING => _state;
        _interval.evaluate(1.0) => _pitchShift.shift; // e.g. 0.5 => shift
    }

    fun dur rate()
    {
        return _rate;
    }

    fun dur rate(dur d)
    {
        d => _rate;
        reset();
        return d;
    }

    fun dur length()
    {
        return _length;
    }

    fun dur length(dur d)
    {
        d => _length;
        reset();
        return d;
    }

    fun Interval interval()
    {
        return _interval;
    }

    fun Interval interval(Interval i)
    {
        i @=> _interval;
        reset();
        return i;
    }

    fun static Raise create()
    {
        Raise raise;
        return raise;
    }

    fun static Raise create(dur length, Interval interval)
    {
        Raise raise;
        length => raise.length;
        interval => raise.interval;
        return raise;
    }
}