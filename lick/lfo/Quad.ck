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
// four out-of-phase LFOs, inspired by
// Thomas Henry's Voltage Controlled Quadrature Function Generator
//

public class Quad
{
    Lfo lfo1;
    Lfo lfo2;
    Lfo lfo3;
    Lfo lfo4;
    1.0 => float _rate;
    0.8 => float _depth;
    0.0 => float _sawMix;
    0.0 => float _sinMix;
    0.0 => float _sqrMix;
    1.0 => float _triMix;
    0.0 => float _hyperMix;
    0.0 => float _shMix;
    0.0 => float _sshMix;

    {
        _rate => rate;
        _depth => depth;
        0.0 => lfo1.phase;
        0.25 => lfo2.phase;
        0.5 => lfo3.phase;
        0.75 => lfo4.phase;
        tri();
    }

    fun float rate()
    {
        return _rate;
    }

    fun float rate(float f)
    {
        f => _rate;
        f => lfo1.rate;
        f => lfo2.rate;
        f => lfo3.rate;
        f => lfo4.rate;
        return f;
    }

    fun float depth()
    {
        return _depth;
    }

    fun float depth(float f)
    {
        f => _depth;
        f => lfo1.gain;
        f => lfo2.gain;
        f => lfo3.gain;
        f => lfo4.gain;
        return f;
    }

    fun void saw()
    {
        mix(1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);
    }

    fun float sawMix()
    {
        return _sawMix;
    }

    fun void sin()
    {
        mix(0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0);
    }

    fun float sinMix()
    {
        return _sinMix;
    }

    fun void sqr()
    {
        mix(0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0);
    }

    fun float sqrMix()
    {
        return _sqrMix;
    }

    fun void tri()
    {
        mix(0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0);
    }

    fun float triMix()
    {
        return _triMix;
    }

    fun void sampleHold()
    {
        mix(0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0);
    }

    fun float sampleHoldMix()
    {
        return _shMix;
    }

    fun void smoothSampleHold()
    {
        mix(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0);
    }

    fun float smoothSampleHoldMix()
    {
        return _sshMix;
    }

    fun void mix(float saw, float sin, float sqr, float tri, float hyper, float sh, float ssh)
    {
        if (saw + sin + sqr + tri + hyper + sh + ssh > 1.0)
        {
            <<<"mix must not exceed 1.0">>>;
        }
        else
        {
            saw => _sawMix;
            sin => _sinMix;
            sqr => _sqrMix;
            tri => _triMix;
            hyper => _hyperMix;
            sh => _shMix;
            ssh => _sshMix;

            lfo1.mix(saw, sin, sqr, tri, hyper, sh, ssh);
            lfo2.mix(saw, sin, sqr, tri, hyper, sh, ssh);
            lfo3.mix(saw, sin, sqr, tri, hyper, sh, ssh);
            lfo4.mix(saw, sin, sqr, tri, hyper, sh, ssh);
        }
    }

    fun static Quad create()
    {
        Quad quad;
        return quad;
    }

    fun static Quad create(float rate, float depth)
    {
        Quad quad;
        rate => quad.rate;
        depth => quad.depth;
        return quad;
    }
}
