/*

    LiCK  Library for ChucK.
    Copyright (c) 2007-2025 held jointly by the individual authors.

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
// 909-ish kick, with noise
//

class TF extends FloatFunction
{
    float _shape;
    
    fun float evaluate(float value)
    {
        // f(x) = x / (1.0 + abs(x))
        return value / ((1.1 - _shape) + Math.fabs(value));
    }
}

public class Thump extends Chugraph
{
    inlet => blackhole;
    ADSR _env => Gain _vca => outlet;
    SinOsc _sin => WaveShaper _waveShaper => _env;
    Step _step => ADSR _pitchEnv => blackhole;
    Noise _noise => LPF _noiseLpf => ADSR _noiseEnv => _vca;

    float _freq;
    float _shape;
    float _bend;
    dur _attack;
    dur _decay;
    dur _noiseDecay;
    dur _pitchDecay;

    TF _fn;
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

        1000.0 => _noiseLpf.freq;

        40.0 => freq;
        0.0 => shape;
        200.0 => bend;
        0.04 => noise;
        1.0::ms => attack;
        400.0::ms => decay;
        2::ms => noiseDecay;
        100.0::ms => pitchDecay;

        spork ~ _updateAtSampleRate();
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
        i => _noiseEnv.keyOn;
        i => _pitchEnv.keyOn;
    }

    fun void keyOff(int i)
    {
        i => _env.keyOff;
        i => _noiseEnv.keyOff;
        i => _pitchEnv.keyOff;
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

    fun dur attack()
    {
        return _attack;
    }

    fun dur attack(dur d)
    {
        d => _attack;
        _attack => _env.attackTime;
        _attack => _noiseEnv.attackTime;
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

    fun void _updateAtSampleRate()
    {
        while (true)
        {
            1::samp => now;
            _freq + _pitchEnv.last() => _sin.freq;
        }
    }
}
