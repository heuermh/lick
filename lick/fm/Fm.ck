/*

    LiCK  Library for ChucK.
    Copyright (c) 2007-2026 held jointly by the individual authors.

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

public class Fm extends Chugraph
{
    float _carrier;
    float _modulator;
    float _depth;
    float _ratio;

    Gain a;
    SinOsc c;
    SinOsc m;
    m => a => c => outlet;

    {
        2 => c.sync;

        30.0 => depth;
        440.0 => modulator;
        0.25 => ratio;
    }

    fun float carrier()
    {
        return _carrier;
    }

    fun float carrier(float f)
    {
        f => _carrier;
        f => c.freq;
        f / _modulator => _ratio;
        return f;
    }

    fun float modulator()
    {
        return _modulator;
    }

    fun float modulator(float f)
    {
        f => _modulator;
        f => m.freq;
        _carrier / f => _ratio;
        return f;
    }

    fun float depth()
    {
        return _depth;
    }

    fun float depth(float f)
    {
        f => _depth;
        f => a.gain;
        return f;
    }

    fun float ratio()
    {
        return _ratio;
    }

    fun float ratio(float f)
    {
        f => _ratio;
        _modulator * f => _carrier;
        _modulator * f => c.freq;
        return f;
    }

    fun static Fm create()
    {
        Fm fm;
        return fm;
    }

    fun static Fm create(float carrier, float depth, float ratio)
    {
        Fm fm;
        carrier => fm.carrier;
        depth => fm.depth;
        ratio => fm.ratio;
        return fm;
    }
}
