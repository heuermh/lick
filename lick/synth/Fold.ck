/*

    LiCK  Library for ChucK.
    Copyright (c) 2007-2025 held jointly by the individual authors.

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
// eq. 1 from https://www.desmos.com/calculator/kcdu7jnzsn
//

public class Fold extends Chugen
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

        // sin(sin(pi*x) * 8 * (a + 0.125))
        return Math.sin(Math.sin(Math.PI * _x) * 8 * (_a + 0.125));
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

    fun static Fold create()
    {
        Fold fold;
        return fold;
    }

    fun static Fold create(float freq)
    {
        Fold fold;
        freq => fold.freq;
        return fold;
    }

    fun static Fold create(float freq, float a)
    {
        Fold fold;
        freq => fold.freq;
        a => fold.a;
        return fold;
    }
}
