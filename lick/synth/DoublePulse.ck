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

public class DoublePulse extends Chubgraph
{
    220.0 => float _freq;
    0.2 => float _gain1;
    0.3 => float _gain2;
    0.2 => float _width1;
    0.3 => float _width2;

    SqrOsc _osc1 => Offset _offset => outlet;
    SqrOsc _osc2 => Invert _invert => outlet;

    {
        _freq => freq;
        _gain1 => gain1;
        _gain2 => gain2;
        _width1 => width1;
        _width2 => width2;

        0.5 => _offset.offset;
        0.0 => _osc1.phase;
        0.5 => _osc2.phase;
    }

    fun float freq()
    {
        return _freq;
    }

    fun float freq(float f)
    {
        f => _freq;
        f/2.0 => _osc1.freq;
        f/2.0 => _osc2.freq;
        return f;
    }

    fun float gain1()
    {
        return _gain1;
    }

    fun float gain1(float f)
    {
        f => _gain1;
        f/2.0 => _osc1.gain;
        return f;
    }

    fun float width1()
    {
        return _width1;
    }

    fun float width1(float f)
    {
        f => _width1;
        f => _osc1.width;
        return f;
    }

    fun float gain2()
    {
        return _gain2;
    }

    fun float gain2(float f)
    {
        f => _gain2;
        f/2.0 => _osc2.gain;
        return f;
    }

    fun float width2()
    {
        return _width2;
    }

    fun float width2(float f)
    {
        f => _width2;
        f => _osc2.width;
        return f;
    }
}
