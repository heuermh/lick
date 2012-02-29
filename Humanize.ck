/*

    LiCK  Library for ChucK.
    Copyright (c) 2007-2012 held jointly by the individual authors.

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

public class Humanize
{
    fun static dur humanize(dur value)
    {
        return humanize(value, 0.05, 0.05);
    }

    fun static dur humanize(dur value, float anticipation, float delay)
    {
        return value - Std.rand2f(0.0, anticipation) * value + Std.rand2f(0.0, delay) * value;
    }

    fun static dur anticipate(dur value)
    {
        return anticipate(value, 0.1);
    }

    fun static dur anticipate(dur value, float anticipation)
    {
        return value - Std.rand2f(0.0, anticipation) * value;
    }

    fun static dur delay(dur value)
    {
        return delay(value, 0.1);
    }

    fun static dur delay(dur value, float delay)
    {
        return value + Std.rand2f(0.0, delay) * value;
    }

    // gaussian, etc.
}