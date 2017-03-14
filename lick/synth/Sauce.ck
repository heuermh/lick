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

public class Sauce extends Chubgraph
{
    SinOsc _sin;
    SinOsc _sub;
    SinOsc _sub2;
    SawOsc _saw;
    Gain _over;
    Clip _clip;
    ADSR _adsr;
    ADSR _env;

    Intervals.octave().desc() @=> Interval _octave;
    Intervals.octaves(2).desc() @=> Interval _twoOctaves;

    float _freq;
    float _depth;
    float _positiveClip;
    float _negativeClip;

    /*
        sin ---+
               |                          ?
               +---> over ---> clip ---> dist ---> adsr --> outlet
               |                                    ^
        saw ---+                                    |
                                                    |
        sub ----------------------------------------+
                                                    |
        sub2 ---------------------------------------+

        env ---> blackhole

     */
    _sin => _over => _clip => _adsr => outlet;
    _saw => _over;
    _sub => _adsr;
    _sub2 => _adsr;
    _env => blackhole;

    {
        110.0 => freq;
        0.8 => sin;
        0.0 => saw;
        0.20 => sub;
        0.02 => sub2;
        1.0 => over;
        0.05 => depth;
        0.70 => positiveClip;
        -0.60 => negativeClip;

        spork ~ _updateAtSampleRate();
    }

    fun float freq()
    {
        return _freq;        
    }

    fun float freq(float f)
    {
        f => _freq;
        _freq => _sin.freq;
        _freq => _saw.freq;
        _octave.evaluate(_freq) => _sub.freq;
        _twoOctaves.evaluate(_freq) => _sub2.freq;
    }

    fun float sin()
    {
        return _sin.gain();
    }

    fun float sin(float f)
    {
        f => _sin.gain;
        return f;
    }

    fun float saw()
    {
        return _saw.gain();
    }

    fun float saw(float f)
    {
        f => _saw.gain;
        return f;
    }

    fun float sub()
    {
        return _sub.gain();
    }

    fun float sub(float f)
    {
        f => _sub.gain;
        return f;
    }

    fun float sub2()
    {
        return _sub2.gain();
    }

    fun float sub2(float f)
    {
        f => _sub2.gain;
        return f;
    }

    fun float over()
    {
        return _over.gain();
    }

    fun float over(float f)
    {
        f => _over.gain;
        return f;
    }

    fun float depth()
    {
        return _depth;
    }

    fun float depth(float f)
    {
        f => _depth;
        return f;
    }

    fun float positiveClip()
    {
        return _positiveClip;
    }

    fun float positiveClip(float f)
    {
        f => _positiveClip;
        return f;
    }

    fun float negativeClip()
    {
        return _negativeClip;
    }

    fun float negativeClip(float f)
    {
        f => _negativeClip;
        return f;
    }

    fun void keyOn(int i)
    {
        i => _adsr.keyOn;
        i => _env.keyOn;
    }

    fun void keyOff(int i)
    {
        i => _adsr.keyOff;
        i => _env.keyOff;
    }

    fun void adsr(dur a, dur d, float s, dur r)
    {
        _adsr.set(a, d, s, r);
    }

    fun void env(dur a, dur d, float s, dur r)
    {
        _env.set(a, d, s, r);
    }

    fun void _updateAtSampleRate()
    {
        while (true)
        {
            _env.last() => float e;
            // or use _env.gain instead of depth?
            _positiveClip - e * _depth => _clip.max;
            _negativeClip + e * _depth => _clip.min;
            1::samp => now;
        }
    }
}