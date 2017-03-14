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

public class Buffer extends Chugen
{
    1024 => int _size;
    float _f[_size];
    0 => int _index;
    1 => int _stride;

    fun int stride()
    {
        return _stride;
    }

    fun int stride(int i)
    {
        i => _stride;
        return _stride;
    }

    fun float tick(float in)
    {
        _f[_index] => float out;
        in => _f[_index];

        _index + _stride => _index;
        if (_index >= _size)
        {
            0 => _index;
        }
        return out;
    }

    fun static Buffer create(dur d)
    {
        (d / 1::samp) $ int => int size;
        return create(size);
    }

    fun static Buffer create(int size)
    {
        Buffer buffer;
        size => buffer._size;
        float f[size];
        f @=> buffer._f;
        return buffer;
    }
}
