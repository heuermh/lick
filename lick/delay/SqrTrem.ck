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

public class SqrTrem extends Chugen
{
    SqrOsc lfo;

    1.0 => float _rate;
    1.0 => float _depth;

    {
        lfo => blackhole;

        rate(_rate);
        depth(_depth);
    }

    fun float rate()
    {
        return _rate;
    }

    fun float rate(float rate)
    {
        rate => _rate;
        _rate => lfo.freq;
        return _rate;
    }

    fun float depth()
    {
        return _depth;
    }

    fun float depth(float depth)
    {
        depth => _depth;
        _depth => lfo.gain;
        return _depth;
    }

    fun float tick(float in)
    {
        Interpolate.linear(lfo.last(), -1.0, 1.0, 0.0, 1.0) => gain;
        return in;
    }
}
