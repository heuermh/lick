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
// eq. 2 from https://www.desmos.com/calculator/kcdu7jnzsn
public class Folder2 extends Chugen
{
    0 => int _i;
    0.0 => float _a;
    1.0 => float _freq;

    fun float tick(float f)
    {
        1::samp * _i => dur partial;
        1::second / _freq => dur wavelength;
        partial / wavelength => float _x;

        _i++;
        if (partial >= wavelength)
        {
            0 => _i;
        }

        // sin(2^(3.2 * a) * sin(pi * x))
        return Math.sin(Math.pow(2, (3.2 * _a)) * Math.sin(Math.PI * _x));
    }


    fun float freq()
    {
        return _freq;
    }

    fun float freq(float f)
    {
        f => _freq;
        return _freq;
    }

    fun float a()
    {
        return _a;
    }

    fun float a(float f)
    {
        f => _a;
        return _a;
    }
}
