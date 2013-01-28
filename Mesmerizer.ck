/*

    LiCK  Library for ChucK.
    Copyright (c) 2007-2013 held jointly by the individual authors.

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
// inspired by the description accompanying the guitar effect pedal
//
// Catalinbread Pareidolia Harmonic Mesmerizer
// Buy one here:  http://www.catalinbread.com/PARE
//

class PhasorModule extends Module
{
    Phasor phasor => blackhole;

    fun float tick(float in, float cv)
    {
        phasor.phase() + cv => phasor.phase;
        return phasor.last();
    }
}

class TremoloModule extends Module
{
    fun float tick(float in, float cv)
    {
        Interpolate.linear(cv, -1.0, 1.0, 0.0, 1.0) => gain;
        return in;
    }
}

public class Mesmerizer extends Chubgraph
{
    0.5 => float _stage0Gain;
    0.5 => float _stage1Gain;
    4400.0 => float _filterFreq;
    2200.0 => float _filterSpread;

    8.0 => float _lfoFreq;
    1.0 => float _lfoDepth;
    1.0 => float _phasorLfoFreq;
    0.00001 => float _phasorLfoDepth;

    0.0 => _dryGain;
    1.0 => _wetGain;

    inlet => Gain stage0 => HPF hpf;
    inlet => Gain stage1 => LPF lpf;

    _stage0Gain => stage0.gain;
    _stage1Gain => stage1.gain;
    _filterFreq - _filterSpread => hpf.freq;
    _filterFreq + _filterSpread => lpf.freq;

    SinOsc lfo0 => blackhole;
    SinOsc lfo1 => blackhole;
    1 => lfo0.sync;
    1 => lfo1.sync;
    _lfoFreq => lfo0.freq;
    _lfoFreq => lfo1.freq;
    _lfoDepth => lfo0.gain;
    _lfoDepth => lfo1.gain;

    SinOsc phasorLfo0 => blackhole;
    SinOsc phasorLfo1 => blackhole;
    _phasorLfoFreq => phasorLfo0.freq;
    _phasorLfoFreq => phasorLfo1.freq;
    _phasorLfoDepth => phasorLfo0.gain;
    _phasorLfoDepth => phasorLfo1.gain;

    PhasorModule phasor0;
    PhasorModule phasor1;
    0.0 => phasor0.phasor.phase;
    _lfoFreq => phasor0.phasor.freq;
    phasorLfo0 => phasor0._cv;
    0.5 => phasor1.phasor.phase;
    _lfoFreq => phasor1.phasor.freq;
    phasorLfo1 => phasor1._cv;

    TremoloModule trem0;
    TremoloModule trem1;

    inlet => Gain dry => outlet;
    Gain wet => outlet;

    _dryGain => dry.gain;
    _wetGain => wet.gain;

    phasor0 => lfo0 => trem0._cv => wet;
    phasor1 => lfo1 => trem1._cv => wet;

    // running by default
    true => int running;

    fun float stage0Gain(float f)
    {
        f => _stage0Gain;
        _stage0Gain => stage0.gain;
        return f;
    }

    fun float stage1Gain(float f)
    {
        f => _stage1Gain;
        _stage1Gain => stage1.gain;
        return f;
    }

    fun float filterFreq(float f)
    {
        f => _filterFreq;
        _filterFreq - _filterSpread => hpf.freq;
        _filterFreq + _filterSpread => lpf.freq;
        return f;
    }

    fun float filterSpread(float f)
    {
        f => _filterSpread;
        _filterFreq - _filterSpread => hpf.freq;
        _filterFreq + _filterSpread => lpf.freq;
        return f;
    }

    fun float lfoFreq(float f)
    {
        f => _lfoFreq;
        _lfoFreq => lfo0.freq;
        _lfoFreq => lfo1.freq;
        _lfoFreq => phasor0.phasor.freq;
        _lfoFreq => phasor1.phasor.freq;
        return f;
    }

    fun float lfoDepth(float f)
    {
        f => _lfoDepth;
        _lfoDepth => lfo0.gain;
        _lfoDepth => lfo1.gain;
        return f;
    }

    fun float phasorLfoFreq(float f)
    {
        f => _phasorLfoFreq;
        _phasorLfoFreq => phasorLfo0.freq;
        _phasorLfoFreq => phasorLfo1.freq;
        return f;
    }

    fun float phasorLfoDepth(float f)
    {
        f => _phasorLfoDepth;
        _phasorLfoDepth => phasorLfo0.gain;
        _phasorLfoDepth => phasorLfo1.gain;
        return f;
    }

    fun void mix(float f)
    {
        f => _wetGain;
        1.0 - f => _dryGain;

        _wetGain => wet.gain;
        _dryGain => dry.gain;
    }

    fun void start()
    {
        if (!running)
        {
            _dryGain => dry.gain;
            _wetGain => wet.gain;
            true => running;
        }
    }

    fun void stop()
    {
        if (running)
        {
            1.0 => dry.gain;
            0.0 => wet.gain;
            false => running;
        }
    }

    fun void toggle()
    {
        if (running)
        {
            stop();
        }
        else
        {
            start();
        }
    }
}
