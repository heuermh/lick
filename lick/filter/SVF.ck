/*

    LiCK  Library for ChucK.
    Copyright (c) 2007-2017 held jointly by the individual authors.

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

public class SVF extends Chubgraph
{
    HPF hpf;
    LPF lpf;
    BPF bpf;
    BRF brf;
    0.1 => float _q;
    1000.0 => float _freq;
    0.5 => float _shape;

    inlet => hpf => Gain _hpfMix => outlet;
    inlet => lpf => Gain _lpfMix => outlet;
    inlet => bpf => Gain _bpfMix => outlet;
    inlet => brf => Gain _brfMix => outlet;

    {
        _q => Q;
        _freq => freq;
        _shape => shape;
    }

    fun float Q()
    {
        return _q;
    }

    fun float Q(float f)
    {
        f => _q;
        f => hpf.Q;
        f => lpf.Q;
        f => bpf.Q;
        f => brf.Q;
        return f;
    }

    fun float resonance()
    {
        return Q();
    }

    fun float resonance(float f)
    {
        return Q(f);
    }

    fun float freq()
    {
        return _freq;
    }

    fun float freq(float f)
    {
        f => _freq;
        f => hpf.freq;
        f => lpf.freq;
        f => bpf.freq;
        f => brf.freq;
    }

    fun float cutoff()
    {
        return freq();
    }

    fun float cutoff(float f)
    {
        return freq(f);
    }

    fun float shape()
    {
        return _shape;
    }

    fun float shape(float f)
    {
        f => _shape;
        Constrain.constrainf(f, -1.0, 1.0) => float _s;

        if (_s > 0.50)
        {
            0.0 => _lpfMix.gain;
            Interpolate.linear(_s - 0.50, 0.0, 0.50, 0.0, 1.0) => _hpfMix.gain;
            Interpolate.linear(_s - 0.50, 0.0, 0.50, 1.0, 0.0) => _bpfMix.gain;
            0.0 => _brfMix.gain;
        }
        else if (_s > 0.0)
        {
            Interpolate.linear(_s, 0.0, 0.50, 1.0, 0.0) => _lpfMix.gain;
            0.0 => _hpfMix.gain;
            Interpolate.linear(_s, 0.0, 0.50, 0.0, 1.0) => _bpfMix.gain;
            0.0 => _brfMix.gain;
        }
        // perhaps lpf and hpf should be swapped here?
        else if (_s > -0.50)
        {
            Interpolate.linear(Math.fabs(_s), 0.0, 0.50, 1.0, 0.0) => _lpfMix.gain;
            0.0 => _hpfMix.gain;
            0.0 => _bpfMix.gain;
            Interpolate.linear(Math.fabs(_s), 0.0, 0.50, 0.0, 1.0) => _brfMix.gain;
        }
        else
        {
            0.0 => _lpfMix.gain;
            Interpolate.linear(Math.fabs(_s) - 0.50, 0.0, 0.50, 0.0, 1.0) => _hpfMix.gain;
            0.0 => _bpfMix.gain;
            Interpolate.linear(Math.fabs(_s) - 0.50, 0.0, 0.50, 1.0, 0.0) => _brfMix.gain;
        }
        <<<"shape", _shape, "gains", _lpfMix.gain(), _hpfMix.gain(), _bpfMix.gain(), _brfMix.gain()>>>;
        return f;
    }
}
