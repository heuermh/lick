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

/*

   after a certian amount of time, drop the freq of pitshift from identity to some interval
   if note changes via pitch follower, reset timer
   if volume drops below a cutoff, reset timer

 */

class GainReset extends FloatProcedure
{
    Drop @ _drop;

    fun void run(float gain)
    {
        if (gain < 0.05)
        {
            <<<"gain reset", gain>>>;
            _drop.reset();
        }
    }
}

class PitchReset extends FloatProcedure
{
    Drop @ _drop;
    0.0 => float _freq;

    fun void run(float freq)
    {
        if (Math.fabs(freq - _freq) > 2.0) // todo:  use 5 cents?
        {
            <<<"pitch reset", _freq, freq>>>;
            _drop.reset();
        }
        freq => _freq;
    }
}

class Drop extends Effect
{
    20::ms => dur _rate;

    0.0 => float _l;
    200::ms => dur _wait;
    400::ms => dur _length;
    now => time _last;

    0 => static int WAITING;
    1 => static int DROPPING;
    2 => static int DROPPED;
    WAITING => int _state;

    PitShift _pitchShift;
    GainReset _gainReset;
    PitchReset _pitchReset;
    Intervals.octave().desc() @=> Interval _interval;
    SigmuGainFollower.create(_gainReset) @=> SigmuGainFollower _gainFollower;
    SigmuPitchFollower.create(_pitchReset) @=> SigmuPitchFollower _pitchFollower;

    1.0 => _pitchShift.mix;
    this @=> _gainReset._drop;
    this @=> _pitchReset._drop;

    inlet => _gainFollower => _pitchFollower => _pitchShift => wet;

    spork ~ _sporkAtRate();

    fun void _sporkAtRate()
    {
        while (true)
        {
            now => time current;
            if (WAITING == _state)
            {
                if (current >= (_last + _wait))
                {
                    <<<"dropping">>>;
                    DROPPING => _state;
                }
            }
            else if (DROPPING == _state)
            {
                if (current < (_last + _wait + _length))
                {
                    Math.fabs((_last + _wait - current) / _length) => _l;
                    1.0 - (_l * _interval.evaluate(1.0)) => _pitchShift.shift;
                    <<<"_l", _l, "shift", _pitchShift.shift()>>>;
                }
                else
                {
                    <<<"dropped">>>;
                    _interval.evaluate(1.0) => _pitchShift.shift;
                    DROPPED => _state;
                }
            }
            else if (DROPPED == _state)
            {
                // just wait for reset
            }
            _rate => now;
        }
    }

    fun void reset()
    {
        0.0 => _l;
        now => _last;
        <<<"reset, waiting">>>;
        WAITING => _state;
        1.0 => _pitchShift.shift;
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

    fun dur wait()
    {
        return _wait;
    }

    fun dur wait(dur d)
    {
        d => _wait;
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

    fun static Drop create()
    {
        Drop drop;
        return drop;
    }

    fun static Drop create(dur wait, dur length, Interval interval)
    {
        Drop drop;
        wait => drop.wait;
        length => drop.length;
        interval => drop.interval;
        return drop;
    }
}

adc => Drop drop => dac;

0.5 => drop.mix;

<<<"ready">>>;
1::week => now;
