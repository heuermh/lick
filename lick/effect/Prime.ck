/*

    LiCK  Library for ChucK.
    Copyright (c) 2007-2023 held jointly by the individual authors.

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
// prime number (in ms) delay effect
//

public class Prime extends Effect
{
    NearestPrime _p;
    inlet => Delay _delay => wet;

    {
        4000::ms => _delay.max;
        nearest(200);
    }

    fun dur delay()
    {
        return _delay.delay();
    }

    fun dur max()
    {
        return _delay.max();
    }

    fun int lower(int i)
    {
        _p.lower(i) => int lower;
        lower * 1.0::ms => _delay.delay;
        return lower;
    }

    fun int higher(int i)
    {
        _p.higher(i) => int higher;
        higher * 1.0::ms => _delay.delay;
        return higher;
    }

    fun int nearest(int i)
    {
        _p.nearest(i) => int nearest;
        nearest * 1.0::ms => _delay.delay;
        return nearest;
    }

    fun static Prime create()
    {
        Prime prime;
        return prime;
    }

    fun static Prime create(int i)
    {
        Prime prime;
        prime.nearest(i);
        return prime;
    }
}
