/*

    LiCK  Library for ChucK.
    Copyright (c) 2007-2016 held jointly by the individual authors.

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

// needs work ;)
public class Vibrato extends Effect
{ 
    Lfo _lfo;
    DelayL _delay;

    2.0 => float _rate;

    _lfo => blackhole;
    inlet => _delay => wet;

    {
        _lfo.sin();
        4.0 => _lfo.rate;
        0.5 => _lfo.depth;

        1::second => _delay.max;
        1::second / _rate => _delay.delay;

        spork ~ _tickAtSampleRate();
    }

    fun float rate()
    {
        return _rate;
    }

    fun float rate(float f)
    {
        f => _rate;
        1::second / _rate => _delay.delay;
        return f;
    }

    fun float lfoRate()
    {
        return _lfo.rate();
    }

    fun float lfoRate(float f)
    {
        f => _lfo.rate;
        return f;
    }

    fun float lfoDepth()
    {
        return _lfo.depth();
    }

    fun float lfoDepth(float f)
    {
        f => _lfo.depth;
        return f;
    }

    fun float lfoPhase()
    {
        return _lfo.phase();
    }

    fun float lfoPhase(float f)
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

    fun void hyperLfo()
    {
        _lfo.hyper();
    }

    fun void sampleHoldLfo()
    {
        _lfo.sampleHold();
    }

    fun void smoothSampleHoldLfo()
    {
        _lfo.smoothSampleHold();
    }

    // @deprecated
    fun void lfo(float saw, float sin, float sqr, float tri, float sh, float ssh)
    {
        lfo(saw, sin, sqr, tri, 0.0, sh, ssh);
    }

    fun void lfo(float saw, float sin, float sqr, float tri, float hyper, float sh, float ssh)
    {
        _lfo.mix(saw, sin, sqr, tri, hyper, sh, ssh);
    }

    fun void _tickAtSampleRate()
    {
        while (true)
        {
            _rate + ((_lfo.last() + 0.5) * _rate) => float v;
            if (v > 0.0)
            {
                Constrain.constraind(1::second / v, 1::samp, 1::second) => _delay.delay;
            }
            else
            {
                1::samp => _delay.delay;
            }
            1::samp => now;
        }
    }

    fun static Vibrato create()
    {
        Vibrato vibrato;
        return vibrato;
    }
}
