/*

    LiCK  Library for ChucK.
    Copyright (c) 2007-2026 held jointly by the individual authors.

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
// Designing a TR-808 style snare drum from scratch
// https://www.youtube.com/watch?v=hULEn2_4Unw
//

public class Dmch extends Chugraph
{
    SinOsc _osc => Envelope _oscEnv => Gain _drum => Gain _mix => outlet;
    Noise _noise => Envelope _noiseEnv => LPF _noiseLpf => HPF _noiseHpf => Gain _snare => _mix;
    Envelope _freqEnv => blackhole;

    float _drumMix;
    float _noiseMix;
    float _freq;
    float _freqDepth;
    dur _drumDecay;
    dur _noiseDecay;
    dur _freqDecay;
    float _noiseCutoff;
    float _noiseResonance;
    float _accent;

    {
        // defaults
        0.67f => drumMix;
        0.33f => noiseMix;

        120.0f => freq;
        80.0f => freqDepth;

        160::ms => drumDecay;
        80::ms => noiseDecay;
        40::ms => freqDecay;

        3400.0f => noiseCutoff;
        4.0 => noiseResonance;

        1.0 => accent;

        12000.0 => _noiseLpf.freq;
        1.0 => _noiseLpf.Q;
        spork ~ _updateAtSampleRate();
    }

    fun void play()
    {
        _accent => _oscEnv.value;
        _accent => _noiseEnv.value;
        _freqDepth => _freqEnv.value;

        _oscEnv.keyOff();
        _noiseEnv.keyOff();
        _freqEnv.keyOff();
    }

    fun float drumMix()
    {
        return _drumMix;
    }

    fun float drumMix(float f)
    {
        f => _drumMix;
        f => _drum.gain;
        return f;
    }

    fun float noiseMix()
    {
        return _noiseMix;
    }

    fun float noiseMix(float f)
    {
        f => _noiseMix;
        f => _snare.gain;
        return f;
    }

    fun dur drumDecay()
    {
        return _drumDecay;
    }

    fun dur drumDecay(dur d)
    {
        d => _drumDecay;
        d => _oscEnv.duration;
        return d;
    }

    fun dur noiseDecay()
    {
        return _noiseDecay;
    }

    fun dur noiseDecay(dur d)
    {
        d => _noiseDecay;
        d => _noiseEnv.duration;
        return d;
    }

    fun dur freqDecay()
    {
        return _freqDecay;
    }

    fun dur freqDecay(dur d)
    {
        d => _freqDecay;
        d => _freqEnv.duration;
        return d;
    }

    fun float freq()
    {
        return _freq;
    }

    fun float freq(float f)
    {
        f => _freq;
        f => _osc.freq;
        return f;
    }

    fun float freqDepth()
    {
        return _freqDepth;
    }

    fun float freqDepth(float f)
    {
        f => _freqDepth;
        return f;
    }

    fun float noiseCutoff()
    {
        return _noiseCutoff;
    }

    fun float noiseCutoff(float f)
    {
        f => _noiseCutoff;
        f => _noiseHpf.freq;
        return f;
    }

    fun float noiseResonance()
    {
        return _noiseResonance;
    }

    fun float noiseResonance(float f)
    {
        f => _noiseResonance;
        f => _noiseHpf.Q;
        return f;
    }

    fun float accent()
    {
        return _accent;
    }

    fun float accent(float f)
    {
        f => _accent;
        return f;
    }

    fun void _updateAtSampleRate()
    {
        while (true)
        {
            _freq + _freqEnv.value() => _osc.freq;
            1::samp => now;
        }
    }

    fun static Dmch create()
    {
        Dmch dmch;
        return dmch;
    }
}
