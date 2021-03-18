/*

    LiCK  Library for ChucK.
    Copyright (c) 2007-2021 held jointly by the individual authors.

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

class KF extends FloatFunction
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
    Noise _noise => LPF _noiseLpf => ADSR _noiseEnv => _vca;
    LPF _sampleLpf => ADSR _sampleEnv => _vca;
    Step _driftStep => ADSR _driftEnv => blackhole;

    Sample @ _sample;

    float _freq;
    float _shape;
    float _bend;
    float _drift;
    float _sampleGain;
    dur _attack;
    dur _decay;
    dur _noiseDecay;
    dur _pitchDecay;
    dur _sampleDecay;

    KF _fn;
    1::ms => static dur _pulse;

    {
        _fn @=> _waveShaper.shape;
        1.0 => _vca.gain;

        _pulse => _env.decayTime;
        1.0 => _env.sustainLevel;

        _pulse => _pitchEnv.attackTime;
        _pulse => _pitchEnv.decayTime;
        1.0 => _pitchEnv.sustainLevel;

        _pulse => _noiseEnv.decayTime;
        1.0 => _noiseEnv.sustainLevel;

        _pulse => _driftEnv.decayTime;
        1.0 => _driftEnv.sustainLevel;

        1000.0 => _noiseLpf.freq;
        1000.0 => _sampleLpf.freq;

        40.0 => freq;
        0.0 => shape;
        200.0 => bend;
        0.01 => noise;
        0.01 => sample;
        4.0 => drift;
        1.0::ms => attack;
        400.0::ms => decay;
        100.0::ms => pitchDecay;
        2.0::ms => noiseDecay;
        2.0::ms => sampleDecay;

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
        _attack => now;
        1 => keyOff;
    }

    fun void keyOn(int i)
    {
        i => _env.keyOn;
        i => _pitchEnv.keyOn;
        i => _noiseEnv.keyOn;
        0.0 => _driftEnv.value;
        i => _driftEnv.keyOn;
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
        i => _noiseEnv.keyOff;
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

    fun float noise()
    {
        return _noise.gain();
    }

    fun float noise(float f)
    {
        f => _noise.gain;
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

    fun float drift()
    {
        return _drift;
    }

    fun float drift(float f)
    {
        f => _drift;
        f => _driftStep.next;
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
        _attack => _noiseEnv.attackTime;
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
        d => _driftEnv.attackTime;
        return d;
    }

    fun dur noiseDecay()
    {
        return _noiseDecay;
    }

    fun dur noiseDecay(dur d)
    {
        d => _noiseDecay;
        d => _noiseEnv.releaseTime;
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
            _freq + _pitchEnv.last() - _driftEnv.last() => _sin.freq;
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
