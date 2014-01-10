/*

    LiCK  Library for ChucK.
    Copyright (c) 2007-2014 held jointly by the individual authors.

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

// does this already exist as a UGen?
public class HalfRectifier extends Chugen
{
    1 => int up;
    0 => int down;

    fun float tick(float in)
    {
        if (up)
        {
            if (in > 0.0)
            {
                return in;
            }
            else
            {
                return 0.0;
            }
        }
        else if (down)
        {
            if (in < 0.0)
            {
                return in;
            }
            else
            {
                return 0.0;
            }
        }
        else
        {
            return in;
        }
    }
}