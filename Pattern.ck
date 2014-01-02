/*

    LiCK  Library for ChucK.
    Copyright (c) 2007-2013 held jointly by the individual authors.

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

public class Pattern extends Predicate
{
    0 => int index;
    IntArrayList pattern;

    fun void size(int capacity)
    {
        pattern.size(capacity);
    }

    fun int test()
    {
        return pattern.get(index);
    }

    fun int reset()
    {
        return 0;
    }

    fun int next(int index)
    {
        return index + 1;
    }

    fun int hasNext(int index)
    {
        return (index < intervals.size());
    }
}
