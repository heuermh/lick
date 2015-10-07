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

public class Redshift extends Feedback
{
    Lfo _lfo;
    APF _apf1;
    APF _apf2;
    APF _apf3;
    APF _apf4;
    113::ms => dur _d1;
    _d1 / 3 => dur _d2;
    _d1 / 9 => dur _d3;
    _d1 / 27 => dur _d4;

    {
        pre => _apf1 => _apf2 => _apf3 => _apf4 => post;
        feedbackOut => feedbackIn;
        _lfo => blackhole;

        0.05 => feedback;

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
            _d1 + (_lfo.last() * _d1) => _apf1.delay;
            _d2 + (_lfo.last() * _d2) => _apf2.delay;
            _d3 + (_lfo.last() * _d3) => _apf3.delay;
            _d4 + (_lfo.last() * _d4) => _apf4.delay;
        }
    }

    fun static Redshift create()
    {
        Redshift redshift;
        return redshift;
    }
}
