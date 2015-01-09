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

public class Flange extends Effect
{
    Lfo _lfo;
    Delay _delay;

    {
        inlet => _delay => wet;
        _lfo => blackhole;

        10::ms => _delay.max;
        1::ms => _delay.delay;

        spork ~ _tickAtSampleRate();
    }

    fun float rate()
    {
        return _lfo.rate();
    }

    fun float rate(float f)
    {
        f => _lfo.rate;
        return f;
    }

    fun float depth()
    {
        return _lfo.depth();
    }

    fun float depth(float f)
    {
        f => _lfo.depth;
        return f;
    }

    fun float phase()
    {
        return _lfo.phase();
    }

    fun float phase(float f)
    {
        f => _lfo.phase;
        return f;
    }

    fun void sawLfo()
    {
        _lfo.saw();
    }

    fun void sinLfo()
    {
        _lfo.sin();
    }

    fun void sqrLfo()
    {
        _lfo.sqr();
    }

    fun void triLfo()
    {
        _lfo.tri();
    }

    fun void sampleHoldLfo()
    {
        _lfo.sampleHold();
    }

    fun void smoothSampleHoldLfo()
    {
        _lfo.smoothSampleHold();
    }

    fun void lfo(float saw, float sin, float sqr, float tri, float sh, float ssh)
    {
        _lfo.mix(saw, sin, sqr, tri, sh, ssh);
    }

    fun void _tickAtSampleRate()
    {
        while (true)
        {
            1::samp => now;
            Interpolate.linear(1.0 - _lfo.depth() + _lfo.last(), -1.0, 1.0, 1.0, 10.0) => float v;
            1::ms * v => _delay.delay;
        }
    }

    fun static Flange create()
    {
        Flange flange;
        return flange;
    }
}
