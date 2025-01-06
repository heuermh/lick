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
// 808-ish kick, with drift
//

public class Boom extends Chugraph
{
    inlet => blackhole;
    ADSR _env => Gain _vca => outlet;
    SinOsc _sin => _env;
    Step _pitchStep => ADSR _pitchEnv => blackhole;
    Step _driftStep => ADSR _driftEnv => blackhole;

    float _freq;
    float _bend;
    float _drift;
    dur _attack;
    dur _decay;
    dur _pitchDecay;

    1::ms => static dur _pulse;

    {
        1.0 => _vca.gain;

        _pulse => _env.decayTime;
        1.0 => _env.sustainLevel;

        _pulse => _pitchEnv.attackTime;
        _pulse => _pitchEnv.decayTime;
        1.0 => _pitchEnv.sustainLevel;

        _pulse => _driftEnv.decayTime;
        1.0 => _driftEnv.sustainLevel;

        40.0 => freq;
        200.0 => bend;
        4.0 => drift;
        1.0::ms => attack;
        400.0::ms => decay;
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
        i => _pitchEnv.keyOn;
        0.0 => _driftEnv.value;
        i => _driftEnv.keyOn;
    }

    fun void keyOff(int i)
    {
        i => _env.keyOff;
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

    fun float bend()
    {
        return _bend;
    }

    fun float bend(float f)
    {
        f => _bend;
        f => _pitchStep.next;
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
            _freq + _pitchEnv.last() - _driftEnv.last() => _sin.freq;
        }
    }
}
