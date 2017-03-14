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

// abstract class, do not use directly
//   use concrete subclasses BounceIn, BounceOut, or BounceInOut
public class AbstractBounce extends Interpolation
{
    fun float easeIn(float value)
    {
        return 1.0 - easeOut(1.0 - value);
    }

    fun float easeOut(float value)
    {
        if (value < (1.0 / 2.75))
        {
            return value * value * 7.5625;
        }
        else if (value < (2.0 / 2.75))
        {
            value - (1.5 / 2.75) => float v;
            return v * v * 7.5625 + 0.75;
        }
        else if (value < (2.5 / 2.75))
        {
            value - (2.25 / 2.75) => float v;
            return v * v * 7.5625 + 0.9375;
        }
        value - (2.625 / 2.75) => float v;
        return v * v * 7.5625 + 0.984375;
    }
}
