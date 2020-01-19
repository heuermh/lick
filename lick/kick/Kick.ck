/*

    LiCK  Library for ChucK.
    Copyright (c) 2007-2019 held jointly by the individual authors.

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
// Kick, with wave shaper, noise, sample, and drift
//

class F extends FloatFunction
{
    float _shape;
    
    fun float evaluate(float value)
    {
        // f(x) = x / (1.0 + abs(x))
        return value / ((1.1 - _shape) + Math.fabs(value));
    }
}

public class Kick extends Chubgraph
{
    inlet => blackhole;
    ADSR _env => Gain _vca => outlet;
    SinOsc _sin => WaveShaper _waveShaper => _env;
    Step _step => ADSR _pitchEnv => blackhole;
    Noise _white1 => LPF _whiteNoiseLpf => ADSR _whiteNoiseEnv => _vca;
    Noise _white2 => Pke _pink => LPF _pinkNoiseLpf => ADSR _pinkNoiseEnv => _vca;
    LPF _sampleLpf => ADSR _sampleEnv => _vca;

    Sample @ _sample;

    float _freq;
    float _shape;
    float _bend;
    float _drift;
    float _whiteNoise;
    float _pinkNoise;
    float _sampleGain;
    dur _attack;
    dur _decay;
    dur _whiteNoiseDecay;
    dur _pinkNoiseDecay;
    dur _pitchDecay;
    dur _sampleDecay;

    F _fn;
    1::ms => static dur _pulse;

    {
        _fn @=> _waveShaper.shape;
        1.0 => _vca.gain;

        _pulse => _env.decayTime;
        1.0 => _env.sustainLevel;

        _pulse => _pitchEnv.attackTime;
        _pulse => _pitchEnv.decayTime;
        1.0 => _pitchEnv.sustainLevel;

        _pulse => _whiteNoiseEnv.decayTime;
        1.0 => _whiteNoiseEnv.sustainLevel;

        _pulse => _pinkNoiseEnv.decayTime;
        1.0 => _pinkNoiseEnv.sustainLevel;

        10000.0 => _whiteNoiseLpf.freq;
        10000.0 => _pinkNoiseLpf.freq;
        10000.0 => _sampleLpf.freq;

        40.0 => freq;
        0.0 => shape;
        200.0 => bend;
        1.0 => whiteNoise;
        1.0 => pinkNoise;
        1.0 => sample;
        1.0::ms => attack;
        400.0::ms => decay;
        100.0::ms => pitchDecay;
        20.0::ms => whiteNoiseDecay;
        20.0::ms => pinkNoiseDecay;
        20.0::ms => sampleDecay;

        spork ~ _updateAtSampleRate();
    }

    fun void init()
    {
        _sample.buf =< dac;
        _sample.buf => _sampleLpf;
        _sampleGain => _sample.gain;
    }

    fun void play()
    {
        1 => keyOn;
        _pulse => now;
        1 => keyOff;
    }

    fun void keyOn(int i)
    {
        i => _env.keyOn;
        i => _pitchEnv.keyOn;
        i => _whiteNoiseEnv.keyOn;
        i => _pinkNoiseEnv.keyOn;
        i => _sampleEnv.keyOn;
        if (_sample != null)
        {
            _sample.play();
        }
    }

    fun void keyOff(int i)
    {
        i => _env.keyOff;
        i => _pitchEnv.keyOff;
        i => _whiteNoiseEnv.keyOff;
        i => _pinkNoiseEnv.keyOff;
        i => _sampleEnv.keyOff;
    }

    fun float freq()
    {
        return _freq;
    }

    fun float freq(float f)
    {
        f => _freq;
        return f;
    }

    fun float shape()
    {
        return _shape;
    }

    fun float shape(float f)
    {
        f => _shape;
        f => _fn._shape;
        return f;
    }

    fun float bend()
    {
        return _bend;
    }

    fun float bend(float f)
    {
        f => _bend;
        f => _step.next;
        return f;
    }

    fun float whiteNoise()
    {
        return _whiteNoise;
    }

    fun float whiteNoise(float f)
    {
        f => _whiteNoise;
        f => _white1.gain;
        return f;
    }

    fun float pinkNoise()
    {
        return _pinkNoise;
    }

    fun float pinkNoise(float f)
    {
        f => _pinkNoise;
        f => _pink.gain;
        return f;
    }

    fun float sample()
    {
        return _sampleGain;
    }

    fun float sample(float f)
    {
        f => _sampleGain;
        if (_sample != null)
        {
            f => _sample.gain;
        }
        return f;
    }

    fun dur attack()
    {
        return _attack;
    }

    fun dur attack(dur d)
    {
        d => _attack;
        _attack => _env.attackTime;
        _attack => _whiteNoiseEnv.attackTime;
        _attack => _pinkNoiseEnv.attackTime;
        _attack => _sampleEnv.attackTime;
        return d;
    }

    fun dur decay()
    {
        return _decay;
    }

    fun dur decay(dur d)
    {
        d => _decay;
        d => _env.releaseTime;
        return d;
    }

    fun dur whiteNoiseDecay()
    {
        return _whiteNoiseDecay;
    }

    fun dur whiteNoiseDecay(dur d)
    {
        d => _whiteNoiseDecay;
        d => _whiteNoiseEnv.releaseTime;
        return d;
    }

    fun dur pinkNoiseDecay()
    {
        return _pinkNoiseDecay;
    }

    fun dur pinkNoiseDecay(dur d)
    {
        d => _pinkNoiseDecay;
        d => _pinkNoiseEnv.releaseTime;
        return d;
    }

    fun dur pitchDecay()
    {
        return _pitchDecay;
    }

    fun dur pitchDecay(dur d)
    {
        d => _pitchDecay;
        d => _pitchEnv.releaseTime;
        return d;
    }

    fun dur sampleDecay()
    {
        return _sampleDecay;
    }

    fun dur sampleDecay(dur d)
    {
        d => _sampleDecay;
        d => _sampleEnv.releaseTime;
        return d;
    }

    fun void _updateAtSampleRate()
    {
        while (true)
        {
            1::samp => now;
            _freq + _pitchEnv.last() => _sin.freq;
        }
    }

    fun static Kick create(Sample sample)
    {
        Kick kick;
        sample @=> kick._sample;
        kick.init();
        return kick;
    }
}
