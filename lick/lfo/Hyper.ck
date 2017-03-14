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

class Recover extends Chugen
{
    fun float tick(float in)
    {
        return Interpolate.linear(in, -1.0, 0.0, -1.0, 1.0);
    }
}

//
// see e.g.
// http://hammer.ampage.org/files/hypertriangleclock.gif
//

public class Hyper extends Chubgraph
{
    SinOsc _sin => FullRectifier _rect => Invert _invert => Recover _recover => outlet;

    1.0 => float _rate;
    0.8 => float _depth;

    {
        _rate => rate;
        _depth => depth;
    }

    fun float freq()
    {
        return rate();
    }

    fun float freq(float f)
    {
        return rate(f);
    }

    fun float rate()
    {
        return _rate;
    }

    fun float rate(float f)
    {
        f => _rate;
        f/2.0 => _sin.freq;
        return f;
    }

    fun float depth()
    {
        return _depth;
    }

    fun float depth(float f)
    {
        f => _depth;
        f => gain;
        return f;
    }

    fun float phase()
    {
        return _sin.phase();
    }

    fun float phase(float f)
    {
        f => _sin.phase;
        return f;
    }
}
