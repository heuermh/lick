/*

    LiCK  Library for ChucK.
    Copyright (c) 2007-2022 held jointly by the individual authors.

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
// Simple and effective hihat strategies
// https://www.youtube.com/watch?v=86Q8SjeOGg4
//

public class Hat extends Chugraph
{
    Noise _noise => HPF _hpf => BPF _bpf => ADSR _env => Gain _vca => outlet;

    float _accent;
    dur _attack;
    dur _decay;

    1::ms => static dur _pulse;

    {
        0.8 => _env.sustainLevel;
        _pulse => _env.releaseTime;

        0.8 => accent;
        _pulse => attack;
        3000.0 => freq;
        0.9 => resonance;
        1200.0 => highPass;
        100::ms => decay;
    }

    fun void play()
    {
        keyOn(1);
        _attack => now;
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

    fun dur attack()
    {
        return _attack;
    }

    fun dur attack(dur d)
    {
        d => _attack;
        d => _env.attackTime;
        return d;
    }

    fun float freq()
    {
        return _bpf.freq();
    }

    fun float freq(float f)
    {
        f => _bpf.freq;
        return f;
    }

    fun float resonance()
    {
        return _bpf.Q();
    }

    fun float resonance(float f)
    {
        f => _bpf.Q;
        return f;
    }

    fun float highPass()
    {
        return _hpf.freq();
    }

    fun float highPass(float f)
    {
        f => _hpf.freq;
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
