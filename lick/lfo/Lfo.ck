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

public class Lfo extends Chugen
{
    SawOsc _sawLfo;
    SinOsc _sinLfo;
    SqrOsc _sqrLfo;
    TriOsc _triLfo;
    Hyper _hyperLfo;
    SampleHold _shLfo;
    SmoothSampleHold _sshLfo;
    0.0 => float _sawMix;
    1.0 => float _sinMix;
    0.0 => float _sqrMix;
    0.0 => float _triMix;
    0.0 => float _hyperMix;
    0.0 => float _shMix;
    0.0 => float _sshMix;
    1.0 => float _rate;
    1.0 => float _depth;
    1.0 => float _phase;

    {
        _sawLfo => blackhole;
        _sinLfo => blackhole;
        _sqrLfo => blackhole;
        _triLfo => blackhole;
        _hyperLfo => blackhole;
        Noise _n0 => _shLfo => blackhole;
        Noise _n1 => _sshLfo => blackhole;

        rate(_rate);
        depth(_depth);
        phase(_phase);
    }


    fun float rate()
    {
        return _rate;
    }

    fun float rate(float f)
    {
        f => _rate;
        _rate => _sawLfo.freq;
        _rate => _sinLfo.freq;
        _rate => _sqrLfo.freq;
        _rate => _triLfo.freq;
        _rate => _hyperLfo.rate;
        _rate => _shLfo.rate;
        _rate => _sshLfo.rate;
        _sshLfo.hold()/10.0 => _sshLfo.slew;
        return _rate;
    }

    fun float depth()
    {
        return _depth;
    }

    fun float depth(float f)
    {
        f => _depth;
        _depth => _sawLfo.gain;
        _depth => _sinLfo.gain;
        _depth => _sqrLfo.gain;
        _depth => _triLfo.gain;
        _depth => _hyperLfo.gain;
        _depth => _shLfo.gain;
        _depth => _sshLfo.gain;
        return _depth;
    }

    fun float phase()
    {
        return _phase;
    }

    fun float phase(float f)
    {
        f => _phase;
        _phase => _sawLfo.phase;
        _phase => _sinLfo.phase;
        _phase => _sqrLfo.phase;
        _phase => _triLfo.phase;
        _phase => _hyperLfo.phase;
        return f;
    }

    fun void retrigger()
    {
        0.0 => phase;
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

    fun void hyper()
    {
        mix(0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0);
    }

    fun float hyperMix()
    {
        return _hyperMix;
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

    // @deprecated
    fun void mix(float saw, float sin, float sqr, float tri, float sh, float ssh)
    {
        mix(saw, sin, sqr, tri, 0.0, sh, ssh);
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
        }
    }

    fun float tick(float in)
    {
        return _sawLfo.last() * _sawMix
             + _sinLfo.last() * _sinMix
             + _sqrLfo.last() * _sqrMix
             + _triLfo.last() * _triMix
             + _hyperLfo.last() * _hyperMix
             + _shLfo.last() * _shMix
             + _sshLfo.last() * _sshMix;
    }
}
