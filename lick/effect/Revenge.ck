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

//
// ring modulator, similar to Randy's Revenge
// http://fairfieldcircuitry.com/collections/effect-pedals/products/randys-revenge
//

public class Revenge extends Effect
{
    Lfo _lfo;
    LPF _lpf;
    Gain _mult;

    /*

      inlet --> mult --> wet
                 ^
                 |
        lfo --> lpf

    */
    inlet => _mult => wet;
    _lfo => _lpf => _mult;

    {
        // multiply inputs
        3 => _mult.op;

        1.0 => rate;
        0.1 => depth;
        20000.0 => cutoff;
        0.01 => resonance;
        sin();
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

    fun void saw()
    {
        _lfo.saw();
    }

    fun void sin()
    {
        _lfo.sin();
    }

    fun void sqr()
    {
        _lfo.sqr();
    }

    fun void tri()
    {
        _lfo.tri();
    }

    fun void hyper()
    {
        _lfo.hyper();
    }

    fun void sampleHold()
    {
        _lfo.sampleHold();
    }

    fun void smoothSampleHold()
    {
        _lfo.smoothSampleHold();
    }

    fun void osc(float saw, float sin, float sqr, float tri, float hyper, float sh, float ssh)
    {
        _lfo.mix(saw, sin, sqr, tri, hyper, sh, ssh);
    }

    fun float cutoff()
    {
        return _lpf.freq();
    }

    fun float cutoff(float f)
    {
        return _lpf.freq(f);
    }

    fun float resonance()
    {
        return _lpf.Q();
    }

    fun float resonance(float f)
    {
        return _lpf.Q(f);
    }

    fun static Revenge create(float rate, float depth, float cutoff, float resonance)
    {
        Revenge revenge;
        rate => revenge.rate;
        depth => revenge.depth;
        cutoff => revenge.cutoff;
        resonance => revenge.resonance;
        return revenge;
    }
}
