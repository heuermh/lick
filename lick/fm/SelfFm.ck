/*

    LiCK  Library for ChucK.
    Copyright (c) 2007-2024 held jointly by the individual authors.

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

public class SelfFm extends Chugraph
{
    float _freq;
    float _depth;

    Gain _pre;
    Gain _post;
    Gain _feedback;
    SinOsc c;

    _pre => c => _post => outlet;
    _post => _feedback => _pre;

    1.0 => _pre.gain;
    1.0 => _post.gain;

    {
        2 => c.sync;

        220.0 => freq;
        30.0 => depth;
    }

    fun float freq()
    {
        return _freq;
    }

    fun float freq(float f)
    {
        f => _freq;
        f => c.freq;
        return f;
    }

    fun float depth()
    {
        return _depth;
    }

    fun float depth(float f)
    {
        f => _depth;
        f => _feedback.gain;
        return f;
    }
}
