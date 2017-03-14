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

//
// similar to Portal Mod CrossOver3 (also GPL)
// https://github.com/portalmod/mod-utilities/tree/master/CrossOver3
//

public class CrossOver3
{
    Gain in;
    LPF _lpf;
    BPF _bpf;
    HPF _hpf;
    Gain _gain1;
    Gain _gain2;
    Gain _gain3;
    Gain out1;
    Gain out2;
    Gain out3;

    1.0 => float _q;
    8800.0 => float _freq1;
    2200.0 => float _freq2;
    880.0 => float _spread1;
    220.0 => float _spread2;

    in => _hpf => _gain1 => out1;
    in => _bpf => _gain2 => out2;
    in => _lpf => _gain3 => out3;

    _updateQ();
    _updateFreqs();

    fun void _updateQ()
    {
        _q => _hpf.Q;
        _q => _bpf.Q;
        _q => _lpf.Q;
    }

    fun void _updateFreqs()
    {
        _freq1 - _spread1 => _hpf.freq;
        ((_freq1 + _spread1) - (_freq2 - _spread2)) / 2.0 => _bpf.freq;
        _freq2 + _spread2 => _lpf.freq;
    }

    fun float freq1()
    {
        return _freq1;
    }

    fun float freq1(float f)
    {
        f => _freq1;
        _updateFreqs();
        return f;
    }

    fun float freq2()
    {
        return _freq2;
    }

    fun float freq2(float f)
    {
        f => _freq2;
        _updateFreqs();
        return f;
    }

    fun float spread1()
    {
        return _spread1;
    }

    fun float spread1(float f)
    {
        f => _spread1;
        _updateFreqs();
        return f;
    }

    fun float spread2()
    {
        return _spread2;
    }

    fun float spread2(float f)
    {
        f => _spread2;
        _updateFreqs();
        return f;
    }

    fun float Q()
    {
        return _q;
    }

    fun float Q(float f)
    {
        f => _q;
        _updateQ();
        return f;
    }

    fun float gain1()
    {
        return _gain1.gain();
    }

    fun float gain1(float f)
    {
        f => _gain1.gain;
        return f;
    }

    fun float gain2()
    {
        return _gain2.gain();
    }

    fun float gain2(float f)
    {
        f => _gain2.gain;
        return f;
    }

    fun float gain3()
    {
        return _gain3.gain();
    }

    fun float gain3(float f)
    {
        f => _gain3.gain;
        return f;
    }

    fun static CrossOver3 create(float freq1, float freq2)
    {
        CrossOver3 crossOver;
        freq1 => crossOver.freq1;
        freq1 * 0.1 => crossOver.spread1;
        freq2 => crossOver.freq2;
        freq2 * 0.1 => crossOver.spread2;
        return crossOver;
    }

    fun static CrossOver3 create(float freq1, float freq2, float Q)
    {
        CrossOver3 crossOver;
        freq1 => crossOver.freq1;
        freq1 * 0.1 => crossOver.spread1;
        freq2 => crossOver.freq2;
        freq2 * 0.1 => crossOver.spread2;
        Q => crossOver.Q;
        return crossOver;
    }

    fun static CrossOver3 create(UGen in, float freq1, float freq2, float Q, UGen out1, UGen out2, UGen out3)
    {
        CrossOver3 crossOver;
        in => crossOver.in;
        freq1 => crossOver.freq1;
        freq1 * 0.1 => crossOver.spread1;
        freq2 => crossOver.freq2;
        freq2 * 0.1 => crossOver.spread2;
        Q => crossOver.Q;
        crossOver.out1 => out1;
        crossOver.out2 => out2;
        crossOver.out3 => out3;
        return crossOver;
    }
}
