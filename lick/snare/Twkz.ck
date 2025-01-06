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
// inspired by Erica Synths Pico DRUM2 Noise Crush, buy one here
// https://www.ericasynths.lv/shop/eurorack-modules/by-series/pico-series/pico-drum2/
//
// Similar to Czh, but with Bitr bitcrusher instead of Bitcrush
//

public class Twkz extends Chugraph
{
    Noise _noise => LPF _lpf => Bitr _bitr => ADSR _env => Gain _vca => outlet;
    Step _step => ADSR _pitchEnv => blackhole;

    float _accent;
    float _tone;
    int _bitDepth;
    float _crushRate;
    dur _decay;

    1::ms => static dur _pulse;

    {
        _pulse => _env.attackTime;
        1.0f => _env.sustainLevel;
        _pulse => _env.decayTime;

        _pulse => _pitchEnv.attackTime;
        1.0f => _pitchEnv.sustainLevel;
        _pulse => _pitchEnv.decayTime;

        0.8f => accent;
        0.5f => tone;
        8 => bitDepth;
        10000.0f => crushRate;
        100::ms => decay;

        spork ~ _updateAtSampleRate();
    }

    fun void play()
    {
        keyOn(1);
        _pulse => now;
        keyOff(1);
    }

    fun void keyOn(int i)
    {
        i => _env.keyOn;
        0.0 => _pitchEnv.value;
        i => _pitchEnv.keyOn;
    }

    fun void keyOff(int i)
    {
        i => _env.keyOff;
        i => _pitchEnv.keyOff;
    }

    fun float accent()
    {
        return _accent;
    }

    fun float accent(float f)
    {
        f => _accent;
        f => _vca.gain;
        return f;
    }

    fun float tone()
    {
        return _tone;
    }

    fun float tone(float f)
    {
        f => _tone;
        // should be exponential?
        Interpolate.linear(f, 0.0, 1.0, 400.0, 20000.0) => _step.next;
        return f;
    }

    fun int bitDepth()
    {
        return _bitDepth;
    }

    fun int bitDepth(int i)
    {
        i => _bitDepth;
        i => _bitr.bitDepth;
        return i;
    }

    fun float crushRate()
    {
        return _crushRate;
    }

    fun float crushRate(float f)
    {
        f => _crushRate;
        f => _bitr.crushRate;
        return f;
    }

    fun dur decay()
    {
        return _decay;
    }

    fun dur decay(dur d)
    {
        d => _decay;
        d => _env.releaseTime;
        d => _pitchEnv.releaseTime;
        return d;
    }

    fun void _updateAtSampleRate()
    {
        while (true)
        {
            1::samp => now;
            _pitchEnv.last() + 100.0 => _lpf.freq;
        }
    }
}
