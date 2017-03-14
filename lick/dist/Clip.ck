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

// see http://electro-music.com/forum/topic-19287.html&postorder=asc
public class Clip extends Chugen
{
    1.0 => static float DEFAULT_MAX;
    -1.0 => static float DEFAULT_MIN;

    DEFAULT_MAX => float max;
    DEFAULT_MIN => float min;

    fun float tick(float in)
    {
        if (in > max)
        {
            return max;
        }
        else if (in < min)
        {
            return min;
        }
        return in;
    }

    fun float range(float range)
    {
        0.0 - (Math.fabs(range) / 2.0) => min;
        (Math.fabs(range) / 2.0) => max;
        return range;
    }
}
