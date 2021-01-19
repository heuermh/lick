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
// Figure 7: The additive approach to generating drum partials
//

public class Snare extends Chubgraph
{
    Gain _mix => LPF _lpf => ADSR _env => Gain _vca => outlet;

    // 0,1 mode, 180 Hz and 330 Hz
    SinOsc _partial1 => _mix;
    SinOsc _partial2 => _mix;

    // freq shift 1, 111 Hz + 175 Hz
    SinOsc _partial3 => _mix;
    SinOsc _partial4 => _mix;
    SinOsc _partial5 => _mix;
    SinOsc _partial6 => _mix;

    // freq shift 2, 111 Hz + 224 Hz
    SinOsc _partial7 => _mix;
    SinOsc _partial8 => _mix;
    SinOsc _partial9 => _mix;

    Noise _noise => _mix;

    float _accent;
    float _freq;
    float _shift1;
    float _shift2;
    float _tone;
    float _noiseGain;
    dur _decay;

    1::ms => static dur _pulse;

    {
        _pulse => _env.attackTime;
        1.0 => _env.sustainLevel;
        _pulse => _env.decayTime;

        0.8 => accent;
        180.0 => freq;
        175.0 => shift1;
        224.0 => shift2;
        0.5 => tone;
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

        f => _partial1.freq;
        1.833 * f => _partial2.freq;

        0.617 * f => float shifted;
        shifted + (_shift1 * 1.0) => _partial3.freq;
        shifted + (_shift1 * 2.0) => _partial4.freq;
        shifted + (_shift1 * 3.0) => _partial5.freq;
        shifted + (_shift1 * 4.0) => _partial6.freq;
        shifted + (_shift2 * 1.0) => _partial7.freq;
        shifted + (_shift2 * 2.0) => _partial8.freq;
        shifted + (_shift2 * 3.0) => _partial9.freq;

        return f;
    }

    fun float shift1()
    {
        return _shift1;
    }

    fun float shift1(float f)
    {
        f => _shift1;

        // shifted
        0.617 * _freq => float shifted;
        shifted + (_shift1 * 1.0) => _partial3.freq;
        shifted + (_shift1 * 2.0) => _partial4.freq;
        shifted + (_shift1 * 3.0) => _partial5.freq;
        shifted + (_shift1 * 4.0) => _partial6.freq;

        return f;
    }

    fun float shift2()
    {
        return _shift2;
    }

    fun float shift2(float f)
    {
        f => _shift2;

        // shifted
        0.617 * _freq => float shifted;
        shifted + (_shift2 * 1.0) => _partial7.freq;
        shifted + (_shift2 * 2.0) => _partial8.freq;
        shifted + (_shift2 * 3.0) => _partial9.freq;

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

    fun float noise()
    {
        return _noiseGain;
    }

    fun float noise(float f)
    {
        f => _noiseGain;
        f => _noise.gain;

        1.0 - f => float r;
        r * 0.3 => _partial1.gain;
        r * 0.3 => _partial2.gain;
        r * 0.1 => _partial3.gain;
        r * 0.07 => _partial4.gain;
        r * 0.03 => _partial5.gain;
        r * 0.1 => _partial6.gain;
        r * 0.07 => _partial7.gain;
        r * 0.02 => _partial8.gain;
        r * 0.01 => _partial9.gain;

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
