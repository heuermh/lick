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
// inspired by the description accompanying the guitar effect pedal
//
// Catalinbread Pareidolia Harmonic Mesmerizer
// Buy one here:  http://www.catalinbread.com/PARE
//

class PhasorModule extends Module
{
    Phasor phasor => blackhole;

    fun float tick(float in, float v)
    {
        phasor.phase() + v => phasor.phase;
        return phasor.last();
    }
}

class TremoloModule extends Module
{
    fun float tick(float in, float v)
    {
        Interpolate.linear(v, -1.0, 1.0, 0.0, 1.0) => gain;
        return in;
    }
}

public class Mesmerizer extends Effect
{
    0.5 => float _stage0Gain;
    0.5 => float _stage1Gain;
    4400.0 => float _filterFreq;
    2200.0 => float _filterSpread;

    8.0 => float _lfoFreq;
    1.0 => float _lfoDepth;
    1.0 => float _phasorLfoFreq;
    0.00001 => float _phasorLfoDepth;

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
    phasorLfo0 => phasor0.cv;
    0.5 => phasor1.phasor.phase;
    _lfoFreq => phasor1.phasor.freq;
    phasorLfo1 => phasor1.cv;

    TremoloModule trem0;
    TremoloModule trem1;
    phasor0 => lfo0 => trem0.cv;
    phasor1 => lfo1 => trem1.cv;

    hpf => trem0 => wet;
    lpf => trem1 => wet;

    fun float stage0Gain(float f)
    {
        f => _stage0Gain;
        _stage0Gain => stage0.gain;
        return f;
    }

    fun float stage0Gain()
    {
        return _stage0Gain;
    }

    fun float stage1Gain(float f)
    {
        f => _stage1Gain;
        _stage1Gain => stage1.gain;
        return f;
    }

    fun float stage1Gain()
    {
        return _stage0Gain;
    }

    fun float filterFreq(float f)
    {
        f => _filterFreq;
        _filterFreq - _filterSpread => hpf.freq;
        _filterFreq + _filterSpread => lpf.freq;
        return f;
    }

    fun float filterFreq()
    {
        return _filterFreq;
    }

    fun float filterSpread(float f)
    {
        f => _filterSpread;
        _filterFreq - _filterSpread => hpf.freq;
        _filterFreq + _filterSpread => lpf.freq;
        return f;
    }

    fun float filterSpread()
    {
        return _filterSpread;
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

    fun float lfoFreq()
    {
        return _lfoFreq;
    }

    fun float lfoDepth(float f)
    {
        f => _lfoDepth;
        _lfoDepth => lfo0.gain;
        _lfoDepth => lfo1.gain;
        return f;
    }

    fun float lfoDepth()
    {
        return _lfoDepth;
    }

    fun float phasorLfoFreq(float f)
    {
        f => _phasorLfoFreq;
        _phasorLfoFreq => phasorLfo0.freq;
        _phasorLfoFreq => phasorLfo1.freq;
        return f;
    }

    fun float phasorLfoFreq()
    {
        return _phasorLfoFreq;
    }

    fun float phasorLfoDepth(float f)
    {
        f => _phasorLfoDepth;
        _phasorLfoDepth => phasorLfo0.gain;
        _phasorLfoDepth => phasorLfo1.gain;
        return f;
    }

    fun float phasorLfoDepth()
    {
        return _phasorLfoDepth;
    }

    fun static Mesmerizer create()
    {
        Mesmerizer mesmerizer;
        return mesmerizer;
    }
}
