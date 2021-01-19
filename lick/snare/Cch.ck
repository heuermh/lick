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
// Figure 11. The simplest (and least authentic) way to create a snare drum sound
//

public class Cch extends Chubgraph
{
    Noise _noise => LPF _lpf => ADSR _env => Gain _vca => outlet;

    float _accent;
    float _tone;
    dur _decay;

    1::ms => static dur _pulse;

    {
        _pulse => _env.attackTime;
        1.0 => _env.sustainLevel;
        _pulse => _env.decayTime;

        0.8 => accent;
        0.5 => tone;
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
