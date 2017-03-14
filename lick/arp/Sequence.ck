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

public class Sequence extends FloatSupplier
{
    0 => int index;
    FloatArrayList sequence;

    fun int size()
    {
        return sequence.size();
    }

    fun int size(int capacity)
    {
        sequence.size(capacity);
    }

    // internal iterator

    fun float get()
    {
        return this.get(index);
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

    fun float get(int _index)
    {
        return sequence.get(_index);
    }

    fun int next(int _index)
    {
        return _index + 1;
    }

    fun int hasNext(int _index)
    {
        return ((_index + 1) < sequence.size());
    }
}
