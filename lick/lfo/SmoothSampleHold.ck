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

public class SmoothSampleHold extends Chubgraph
{
    inlet => blackhole;
    SlewStep _step => outlet;
    100::samp => dur _hold;

    sample();
    spork ~ _tickAtRate();

    fun float freq()
    {
        return rate();
    }

    fun float freq(float f)
    {
        return rate(f);
    }

    fun float rate()
    {
        return 1::second / _hold;
    }

    fun float rate(float f)
    {
        1::second / f => _hold;
        return f;
    }

    fun dur hold()
    {
        return _hold;
    }

    fun dur hold(dur d)
    {
        d => _hold;
        return d;
    }

    fun dur slew()
    {
        return _step.slew();
    }

    fun dur slew(dur d)
    {
        d => _step.slew;
        return d;
    }

    fun Interpolation interpolation()
    {
        return _step.interpolation();
    }

    fun Interpolation interpolation(Interpolation i)
    {
        i => _step.interpolation;
        return i;
    }

    fun void sample()
    {
        inlet.last() => _step.next;
    }

    fun void _tickAtRate()
    {
        while (true)
        {
            _hold => now;
            sample();
        }
    }

    fun static SmoothSampleHold create()
    {
        SmoothSampleHold smoothSampleHold;
        return smoothSampleHold;
    }

    fun static SmoothSampleHold create(float freq)
    {
        SmoothSampleHold smoothSampleHold;
        freq => smoothSampleHold.freq;
        smoothSampleHold.hold()/10.0 => smoothSampleHold.slew;
        return smoothSampleHold;
    }

    fun static SmoothSampleHold create(dur hold)
    {
        SmoothSampleHold smoothSampleHold;
        hold => smoothSampleHold.hold;
        hold/10.0 => smoothSampleHold.slew;
        return smoothSampleHold;
    }

    fun static SmoothSampleHold create(float freq, dur slew)
    {
        SmoothSampleHold smoothSampleHold;
        freq => smoothSampleHold.freq;
        slew => smoothSampleHold.slew;
        return smoothSampleHold;
    }

    fun static SmoothSampleHold create(dur hold, dur slew)
    {
        SmoothSampleHold smoothSampleHold;
        hold => smoothSampleHold.hold;
        slew => smoothSampleHold.slew;
        return smoothSampleHold;
    }

    fun static SmoothSampleHold create(float freq, dur slew, Interpolation interpolation)
    {
        SmoothSampleHold smoothSampleHold;
        freq => smoothSampleHold.freq;
        slew => smoothSampleHold.slew;
        interpolation => smoothSampleHold.interpolation;
        return smoothSampleHold;
    }

    fun static SmoothSampleHold create(dur hold, dur slew, Interpolation interpolation)
    {
        SmoothSampleHold smoothSampleHold;
        hold => smoothSampleHold.hold;
        slew => smoothSampleHold.slew;
        interpolation => smoothSampleHold.interpolation;
        return smoothSampleHold;
    }
}
