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

public class BackInOut extends Interpolation
{
    fun float evaluate(float value)
    {
        2.0 * value => float v;
        1.70158 * 1.525 => float s;
        if (v < 1.0)
        {
            return 0.5 * (v * v * ((s + 1.0) * v - s));
        }
        v - 2.0 => v;
        return 0.5 * (v * v * ((s + 1.0) * v + s) + 2.0);
    }
}
