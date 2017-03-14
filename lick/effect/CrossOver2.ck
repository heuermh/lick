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
//  similar to Portal Mod CrossOver2 (also GPL)
//  https://github.com/portalmod/mod-utilities/tree/master/CrossOver2
//

public class CrossOver2
{
    Gain in;
    LPF _lpf;
    HPF _hpf;
    Gain _gain1;
    Gain _gain2;
    Gain out1;
    Gain out2;

    1.0 => float _q;
    8800.0 => float _freq;
    880.0 => float _spread;

    in => _hpf => _gain1 => out1;
    in => _lpf => _gain2 => out2;

    _freq - _spread => _hpf.freq;
    _freq + _spread => _lpf.freq;

    fun float freq()
    {
        return _freq;
    }

    fun float freq(float f)
    {
        f => _freq;
        _freq - _spread => _hpf.freq;
        _freq + _spread => _lpf.freq;
        return f;
    }

    fun float spread()
    {
        return _spread;
    }

    fun float spread(float f)
    {
        f => _spread;
        _freq - _spread => _hpf.freq;
        _freq + _spread => _lpf.freq;
        return f;
    }

    fun float Q()
    {
        return _q;
    }

    fun float Q(float f)
    {
        f => _q;
        _q => _hpf.Q;
        _q => _lpf.Q;
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

    fun static CrossOver2 create(float freq)
    {
        CrossOver2 crossOver;
        freq => crossOver.freq;
        freq * 0.1 => crossOver.spread;
        return crossOver;
    }

    fun static CrossOver2 create(float freq, float Q)
    {
        CrossOver2 crossOver;
        freq => crossOver.freq;
        freq * 0.1 => crossOver.spread;
        Q => crossOver.Q;
        return crossOver;
    }

    fun static CrossOver2 create(UGen in, float freq, float Q, UGen out1, UGen out2)
    {
        CrossOver2 crossOver;
        in => crossOver.in;
        freq => crossOver.freq;
        freq * 0.1 => crossOver.spread;
        Q => crossOver.Q;
        crossOver.out1 => out1;
        crossOver.out2 => out2;
        return crossOver;
    }
}
