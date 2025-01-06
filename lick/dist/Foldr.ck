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

public class Foldr extends Chugen
{
    0 => int index;
    0.0f => float value;
    0.0f => float acc;
    1000.0f => float incr;

    fun float tick(float in)
    {
        float out;

        if (acc < index)
        {
            acc + incr => acc;
            in => value => out;
        }
        else
        {
            value => out;
        }

        index + 1 => index;
        return out;
    }
}
