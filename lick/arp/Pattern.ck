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

public class Pattern extends Predicate
{
    0 => int index;
    IntArrayList pattern;

    fun int size()
    {
        return pattern.size();
    }

    fun int size(int capacity)
    {
        pattern.size(capacity);
    }

    // internal iterator

    fun int test()
    {
        return get(index);
    }

    fun int next()
    {
        next(index) => index;
        return index;
    }

    fun int hasNext()
    {
        return hasNext(index);
    }

    fun int reset()
    {
        0 => index;
        return index;
    }

    // external iterator

    fun int get(int _index)
    {
        return pattern.get(_index);
    }

    fun int next(int _index)
    {
        return _index + 1;
    }

    fun int hasNext(int _index)
    {
        return ((_index + 1) < pattern.size());
    }
}
