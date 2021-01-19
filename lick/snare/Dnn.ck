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
// https://www.soundonsound.com/techniques/practical-snare-drum-synthesis
// Figure 17. How little of the snare drum model from Figure 1 survives in Figure 16
//

public class Dnn extends Chubgraph
{
    Gain _mix => LPF _lpf => ADSR _env => Gain _vca => outlet;
    PulseOsc _carrier => _mix;
    TriOsc _mod => _carrier;
    Noise _noise => _mix;

    float _accent;
    float _freq;
    float _tone;
    float _pulseWidth;
    float _modulation;
    float _modulationRate;
    float _noiseGain;
    dur _decay;

    1::ms => static dur _pulse;

    {
        2 => _carrier.sync; // fm

        _pulse => _env.attackTime;
        1.0 => _env.sustainLevel;
        _pulse => _env.decayTime;

        0.8 => accent;
        80.0 => freq;
        0.5 => tone;
        0.25 => pulseWidth;
        0.5 => modulation;
        30.0 => modulationRate;
        0.65 => noise;
        100::ms => decay;
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
        0.0 => _mod.phase;
    }

    fun void keyOff(int i)
    {
        i => _env.keyOff;
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

    fun float freq()
    {
        return _freq;
    }

    fun float freq(float f)
    {
        f => _freq;
        f => _carrier.freq;
        return f;
    }

    fun float tone()
    {
        return _tone;
    }

    fun float tone(float f)
    {
        f => _tone;
        Interpolate.linear(f, 0.0, 1.0, 400.0, 20000.0) + 100.0 => _lpf.freq;
        return f;
    }

    fun float pulseWidth()
    {
        return _pulseWidth;
    }

    fun float pulseWidth(float f)
    {
        f => _pulseWidth;
        f => _carrier.width;
        return f;
    }

    fun float modulation()
    {
        return _modulation;
    }

    fun float modulation(float f)
    {
        f => _modulation;
        f => _mod.gain;
        return f;
    }

    fun float modulationRate()
    {
        return _modulationRate;
    }

    fun float modulationRate(float f)
    {
        f => _modulationRate;
        f => _mod.freq;
        return f;
    }

    fun float noise()
    {
        return _noiseGain;
    }

    fun float noise(float f)
    {
        f => _noiseGain;
        f => _noise.gain;
        1.0 - f => _carrier.gain;
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
        return d;
    }
}
