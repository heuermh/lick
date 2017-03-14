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

// analog-style delay with modulated delay time
public class ModulatedDelay extends AnalogDelay
{
    Lfo _lfo;

    {
        1.0 => rate;
        0.1 => depth;
        sinLfo();

        spork ~ _updateAtSampleRate();
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

    fun void _updateAtSampleRate()
    {
        while (true)
        {
            1::samp => now;
            delay() + _lfo.last() * delay() => delay;
        }
    }

    fun static ModulatedDelay create(WaveShaper ws, dur delay, float feedback, float cutoff, float resonance, float rate, float depth)
    {
        ModulatedDelay modulatedDelay;
        ws @=> modulatedDelay._dist;
        modulatedDelay._init();
        delay => modulatedDelay.max;
        delay => modulatedDelay.delay;
        feedback => modulatedDelay.feedback;
        cutoff => modulatedDelay.cutoff;
        resonance => modulatedDelay.resonance;
        rate => modulatedDelay.rate;
        depth => modulatedDelay.depth;
        return modulatedDelay;
    }
}
