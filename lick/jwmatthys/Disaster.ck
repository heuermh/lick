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
// similar to Disaster Transport SR,
//   buy one here http://earthquakerdevices.com/shop/disastertransportsr/
//

public class Disaster extends Chubgraph
{
    Gain _inputA;
    Gain _inputB;
    AnalogDelay.create() @=> AnalogDelay _a;
    AnalogDelay.create() @=> AnalogDelay _b;
    GVerb _gverb;
    Gain _feedbackA;
    Gain _feedbackB;
    Gain _bleed;
    Gain _bypass;
    Lfo _lfo;
    dur _lastDelay;

    0 => static int OFF;
    1 => static int ON;

    ON => int _aState;
    ON => int _bState;
    OFF => int _bypassState;
    0.5 => float _lastA;
    0.5 => float _lastB;

    /*

                    +------------------+
                    |                  |
                   \./                 |
        in --+-->  inputA ---> A ---> feedbackA -------------+---> out
             |                 |                             |
             |                bleed                          |
             |                 |                             |
             |                \./                            |
             +-->  inputB ---> gverb ---> B ---> feedbackB --+
             |                            ^       |          |
             |                            |       |          |
             |                            +-------+          |
             |                                               |
             +-->  bypass -----------------------------------+

    */

    {
        inlet => _inputA => _a => _feedbackA => outlet;
        inlet => _inputB => _gverb => _b => _feedbackB => outlet;
        _feedbackA => _inputA;
        _feedbackB => _b;
        _a => _bleed => _gverb;
        inlet => _bypass => outlet;
        _lfo => blackhole;

        0.5 => _inputA.gain;
        0.5 => _inputB.gain;
        2::second => _a.max;
        2::second => _b.max;
        1.0 => _a.mix;
        1.0 => _a.gain;
        0.0 => _a.feedback;
        400::ms => _a.delay;
        400::ms => _lastDelay;
        133::ms => _b.delay;
        1.0 => _b.mix;
        1.0 => _b.gain;
        0.0 => _b.feedback;
        0.9 => _gverb.dry;
        0.02 => _gverb.early;
        0.07 => _gverb.tail;
        30.0 => _gverb.roomsize;
        0.8 => _feedbackA.gain;
        0.8 => _feedbackB.gain;
        0.0 => _bleed.gain;
        0.0 => _bypass.gain;
        0.1 => _lfo.rate;
        0.001 => _lfo.depth;
        _lfo.sin();

        spork ~ _tickAtSampleRate();
    }

    /*

      "The switches for both delays switch the inputs only. The outputs are always connected.
       This allows you to have trails by always leaving the bypass switch engaged or to use the
       bypass switch as the master on/off for true bypass. Additionally, you can feed delay A
       in to delay B with the bleed control without having delay B switched on for a cleaner
       rhythmic delay."

    */

    fun void bypassOn()
    {
        if (!_bypassState)
        {
            1.0 => _bypass.gain;
            _inputA.gain() => _lastA;
            _inputB.gain() => _lastB;       
            0.0 => _inputA.gain;
            0.0 => _inputB.gain;

            ON => _bypassState;
        }
    }

    fun void bypassOff()
    {
        if (_bypassState)
        {
            0.0 => _bypass.gain;
            _lastA => _inputA.gain;
            _lastB => _inputB.gain;

            OFF => _bypassState;
        }
    }

    fun void toggleBypass()
    {
        if (_bypassState)
        {
            bypassOff();
        }
        else
        {
            bypassOn();
        }
    }


    fun void aOn()
    {
        if (_bypassState)
        {
            if (_bState)
            {
                0.5 => _lastA;
                0.5 => _lastB;
            }
            else
            {
                1.0 => _lastA;
                0.0 => _lastB;
            }
        }
        else
        {
            if (_bState)
            {
                0.5 => _inputA.gain;
                0.5 => _inputB.gain;
            }
            else
            {
                1.0 => _inputA.gain;
                0.0 => _inputB.gain;
            }
        }
        ON => _aState;
    }

    fun void aOff()
    {
        if (_bypassState)
        {
            if (_bState)
            {
                0.0 => _lastA;
                1.0 => _lastB;
            }
            else
            {
                0.0 => _lastA;
                0.0 => _lastB;
            }
        }
        else
        {
            if (_bState)
            {
                0.0 => _inputA.gain;
                1.0 => _inputB.gain;
            }
            else
            {
                0.0 => _inputA.gain;
                0.0 => _inputB.gain;
            }
        }
        OFF => _aState;
    }

    fun void toggleA()
    {
        if (_aState)
        {
            aOff();
        }
        else
        {
            aOn();
        }
    }


    fun void bOn()
    {
        if (_bypassState)
        {
            if (_aState)
            {
                0.5 => _lastA;
                0.5 => _lastB;
            }
            else
            {
                0.0 => _lastA;
                1.0 => _lastB;
            }
        }
        else
        {
            if (_aState)
            {
                0.5 => _inputA.gain;
                0.5 => _inputB.gain;
            }
            else
            {
                0.0 => _inputA.gain;
                1.0 => _inputB.gain;
            }
        }
        ON => _bState;
    }

    fun void bOff()
    {
        if (_bypassState)
        {
            if (_aState)
            {
                1.0 => _lastA;
                0.0 => _lastB;
            }
            else
            {
                0.0 => _lastA;
                0.0 => _lastB;
            }
        }
        else
        {
            if (_aState)
            {
                1.0 => _inputA.gain;
                0.0 => _inputB.gain;
            }
            else
            {
                0.0 => _inputA.gain;
                0.0 => _inputB.gain;
            }
        }
        OFF => _bState;
    }

    fun void toggleB()
    {
        if (_bState)
        {
            bOff();
        }
        else
        {
            bOn();
        }
    }


    fun dur maxA()
    {
        return _a.max();
    }

    fun dur maxA(dur d)
    {
        d => _a.max;
        return d;
    }

    fun dur delayA()
    {
        return _a.delay();
    }

    fun dur delayA(dur d)
    {
        d => _a.delay;
        d => _lastDelay;
        return d;
    }

    fun float mixA()
    {
        return _a.mix();
    }

    fun float mixA(float f)
    {
        f => _a.mix;
        return f;
    }

    fun float cutoffA()
    {
        return _a.cutoff();
    }

    fun float cutoffA(float f)
    {
        f => _a.cutoff;
        return f;
    }

    fun float resonanceA()
    {
        return _a.resonance();
    }

    fun float resonanceA(float f)
    {
        f => _a.resonance;
        return f;
    }

    fun float feedbackA()
    {
        return _feedbackA.gain();
    }

    fun float feedbackA(float f)
    {
        f => _feedbackA.gain;
        return f;
    }


    fun dur maxB()
    {
        return _b.max();
    }

    fun dur maxB(dur d)
    {
        d => _b.max;
        return d;
    }

    fun dur delayB()
    {
        return _b.delay();
    }

    fun dur delayB(dur d)
    {
        d => _b.delay;
        return d;
    }

    fun float mixB()
    {
        return _b.mix();
    }

    fun float mixB(float f)
    {
        f => _b.mix;
        return f;
    }

    fun float cutoffB()
    {
        return _b.cutoff();
    }

    fun float cutoffB(float f)
    {
        f => _b.cutoff;
        return f;
    }

    fun float resonanceB()
    {
        return _b.resonance();
    }

    fun float resonanceB(float f)
    {
        f => _b.resonance;
        return f;
    }

    fun float feedbackB()
    {
        return _feedbackB.gain();
    }

    fun float feedbackB(float f)
    {
        f => _feedbackB.gain;
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
        0.40 * f => _gverb.early;
        0.60 * f => _gverb.tail;
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
            _lastDelay + (_lfo.last() * _a.delay()) => _a.delay;
        }
    }


    fun static Disaster create()
    {
        Disaster disaster;
        return disaster;
    }
}
