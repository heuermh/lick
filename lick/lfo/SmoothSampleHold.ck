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

class SlewStep extends Chugen
{
    0.0 => float _last;
    0.0 => float _next;
    0 => int _samples;
    10::samp => dur _slew;
    Interpolations.linear() @=> Interpolation _interpolation;

    fun float tick(float in)
    {
        // have to count samples rather than calculate difference from now
        //   since now doesn't work in the tick method in a Chugen
        //   see https://github.com/spencersalazar/chuck/issues/28

        Constrain.constrainf((_samples * 1::samp) / _slew, 0.0, 1.0) => float f;
        _interpolation.evaluate(f) => float v;
        _samples++;
        return Constrain.constrainf(_last + v * (_next - _last), -1.0, 1.0);
    }

    fun dur slew()
    {
        return _slew;
    }

    fun dur slew(dur d)
    {
        d => _slew;
        return d;
    }

    fun Interpolation interpolation()
    {
        return _interpolation;
    }

    fun Interpolation interpolation(Interpolation i)
    {
        i @=> _interpolation;
        return i;
    }

    fun float next(float f)
    {
        _next => _last;
        0 => _samples;
        f => _next;
        return f;
    }
}

public class SmoothSampleHold extends Chubgraph
{
    inlet => blackhole;
    SlewStep _step => outlet;
    100::samp => dur _hold;

    sample();
    spork ~ _tickAtRate();

    fun float freq()
    {
        return 1::second / _hold;
    }

    fun float freq(float f)
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
