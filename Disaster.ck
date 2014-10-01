/*

    LiCK  Library for ChucK.
    Copyright (c) 2007-2014 held jointly by the individual authors.

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
// similar to Disaster Transport SR,
//   buy one here http://earthquakerdevices.com/shop/disastertransportsr/
//
public class Disaster extends Effect
{
    Gain _pre;
    AnalogDelay.create() @=> AnalogDelay _a;
    AnalogDelay.create() @=> AnalogDelay _b;
    GVerb _gverb;
    Gain _feedback;
    Gain _bleed;
    Lfo _lfo;

    {
        inlet => _pre => _a => _feedback => wet;
        _pre => _gverb => _b => _feedback;
        _feedback => _pre;
        _a => _bleed => _gverb;
        _lfo => blackhole;

        /*

          Switching is not quite correct yet

          "The switches for both delays switch the inputs only. The outputs are always connected.
          This allows you to have trails by always leaving the bypass switch engaged or to use the
          bypass switch as the master on/off for true bypass. Additionally, you can feed delay A
          in to delay B with the bleed control without having delay B switched on for a cleaner
          rhythmic delay."

        */

        2::second => _a.max;
        2::second => _b.max;
        1.0 => _a.mix;
        0.0 => _a.feedback;
        400::ms => _a.delay;
        111::ms => _b.delay;
        1.0 => _b.mix;
        0.0 => _b.feedback;
        0.1 => _bleed.gain;
        0.6 => _feedback.gain;
        0.9 => _gverb.dry;
        0.02 => _gverb.early;
        0.07 => _gverb.tail;
        30.0 => _gverb.roomsize;
        0.1 => _lfo.rate;
        0.01 => _lfo.depth;
        _lfo.sin();

        spork ~ _tickAtSampleRate();
    }


    fun AnalogDelay a()
    {
        return _a;
    }

    fun dur aMax()
    {
        return _a.max();
    }

    fun dur aMax(dur d)
    {
        d => _a.max;
        return d;
    }

    fun dur aDelay()
    {
        return _a.delay();
    }

    fun dur aDelay(dur d)
    {
        d => _a.delay;
        return d;
    }

    fun float aMix()
    {
        return _a.mix();
    }

    fun float aMix(float f)
    {
        f => _a.mix;
        return f;
    }

    fun float aCutoff()
    {
        return _a.cutoff();
    }

    fun float aCutoff(float f)
    {
        f => _a.cutoff;
        return f;
    }

    fun float aResonance()
    {
        return _a.resonance();
    }

    fun float aResonance(float f)
    {
        f => _a.resonance;
        return f;
    }


    fun AnalogDelay b()
    {
        return _b;
    }

    fun dur bMax()
    {
        return _b.max();
    }

    fun dur bMax(dur d)
    {
        d => _b.max;
        return d;
    }

    fun dur bDelay()
    {
        return _b.delay();
    }

    fun dur bDelay(dur d)
    {
        d => _b.delay;
        return d;
    }

    fun float bMix()
    {
        return _b.mix();
    }

    fun float bMix(float f)
    {
        f => _b.mix;
        return f;
    }

    fun float bCutoff()
    {
        return _b.cutoff();
    }

    fun float bCutoff(float f)
    {
        f => _b.cutoff;
        return f;
    }

    fun float bResonance()
    {
        return _b.resonance();
    }

    fun float bResonance(float f)
    {
        f => _b.resonance;
        return f;
    }


    fun float feedback()
    {
        return _feedback.gain();
    }

    fun float feedback(float f)
    {
        f => _feedback.gain;
        return f;
    }

    fun float bleed()
    {
        return _bleed.gain();
    }

    fun float bleed(float f)
    {
        f => _bleed.gain;
        return f;
    }

    fun float reverb()
    {
        return (1.0 - _gverb.dry());
    }

    fun float reverb(float f)
    {
        (1.0 - f) => _gverb.dry;
        return f;
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

    fun void lfo(float saw, float sin, float sqr, float tri)
    {
        _lfo.mix(saw, sin, sqr, tri);
    }

    fun void _tickAtSampleRate()
    {
        while (true)
        {
            1::samp => now;
            _lfo.last() * _a.delay() => _a.delay;
        }
    }


    fun static Disaster create()
    {
        Disaster disaster;
        return disaster;
    }
}