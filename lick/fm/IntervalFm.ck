/*

    LiCK  Library for ChucK.
    Copyright (c) 2007-2026 held jointly by the individual authors.

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

public class IntervalFm extends Chugraph
{
    float _carrier;
    float _depth;
    Intervals.unison() @=> Interval _interval;

    Gain a;
    SinOsc c;
    SinOsc m;
    m => a => c => outlet;

    {
        2 => c.sync;

        30.0 => depth;
        440.0 => carrier;
    }

    fun float carrier()
    {
        return _carrier;
    }

    fun float carrier(float f)
    {
        f => _carrier;
        f => c.freq;
        _interval.evaluate(f) => m.freq;
        return f;
    }

    fun float modulator()
    {
        return m.freq();
    }

    fun float depth()
    {
        return _depth;
    }

    fun float depth(float f)
    {
        f => _depth;
        f => a.gain;
        return f;
    }

    fun Interval interval()
    {
        return _interval;
    }

    fun Interval interval(Interval i)
    {
        i @=> _interval;
        _interval.evaluate(_carrier) => m.freq;
        return i;
    }

    fun static IntervalFm create(Interval i)
    {
        IntervalFm intervalFm;
        i => intervalFm.interval;
        return intervalFm;
    }
}
