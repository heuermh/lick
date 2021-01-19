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
// inspired by Erica Synths Pico DRUM2 Fold Drum 1, buy one here
// https://www.ericasynths.lv/shop/eurorack-modules/by-series/pico-series/pico-drum2/
//

public class Fwak2 extends Chubgraph
{
    inlet => blackhole;
    ADSR _env => Gain _vca => outlet;
    Fold2 _foldOsc => _env;
    Step _pitchStep => ADSR _pitchEnv => blackhole;
    Step _foldStep => ADSR _foldEnv => blackhole;

    float _freq;
    float _bend;
    float _fold;
    dur _attack;
    dur _decay;
    dur _pitchDecay;
    dur _foldDecay;

    1::ms => static dur _pulse;

    {
        1.0 => _vca.gain;

        _pulse => _env.decayTime;
        1.0 => _env.sustainLevel;

        _pulse => _pitchEnv.attackTime;
        _pulse => _pitchEnv.decayTime;
        1.0 => _pitchEnv.sustainLevel;

        _pulse => _foldEnv.attackTime;
        _pulse => _foldEnv.decayTime;
        1.0 => _foldEnv.sustainLevel;

        40.0 => freq;
        200.0 => bend;
        4.0 => fold;
        1.0::ms => attack;
        400.0::ms => decay;
        100.0::ms => pitchDecay;
        100.0::ms => foldDecay;

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
        i => _foldEnv.keyOn;
    }

    fun void keyOff(int i)
    {
        i => _env.keyOff;
        i => _pitchEnv.keyOff;
        i => _foldEnv.keyOff;
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

    fun float fold()
    {
        return _fold;
    }

    fun float fold(float f)
    {
        f => _fold;
        f => _foldStep.next;
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

    fun dur foldDecay()
    {
        return _foldDecay;
    }

    fun dur foldDecay(dur d)
    {
        d => _foldDecay;
        d => _foldEnv.releaseTime;
        return d;
    }

    fun void _updateAtSampleRate()
    {
        while (true)
        {
            1::samp => now;
            _freq + _pitchEnv.last() => _foldOsc.freq;
            _foldEnv.last() => _foldOsc.a;
        }
    }
}
