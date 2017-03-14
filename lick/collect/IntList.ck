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

public class IntList
{
    fun int size()
    {
        return -1;
    }

    fun int isEmpty()
    {
        return (size() == 0);
    }

    fun int size(int capacity)
    {
        return -1;
    }

    fun int get(int index)
    {
        return -1;
    }

    fun int sample()
    {
        return -1;
    }

    fun void add(int value)
    {
        // empty
    }

    fun void addAll(IntList list)
    {
        // empty
    }

    fun void remove(int value)
    {
        // empty
    }

    fun void removeAll(IntList list)
    {
        // empty
    }

    fun void retainAll(IntList list)
    {
        // empty
    }

    fun int contains(int value)
    {
        return false;
    }

    fun int containsAll(IntList list)
    {
        return false;
    }

    fun int indexOf(int value)
    {
        return -1;
    }

    fun int lastIndexOf(int value)
    {
        return -1;
    }

    fun void set(int index, int value)
    {
        // empty
    }

    fun IntIterator iterator()
    {
        return null;
    }

    fun void forEach(IntProcedure procedure)
    {
        // empty
    }

    fun void forEach(IntPredicate predicate, IntProcedure procedure)
    {
        // empty
    }

    fun void clear()
    {
        // empty
    }

    fun void assign(int value)
    {
        // empty
    }

    fun void transform(IntFunction fn)
    {
        // empty
    }

    fun IntList collect(IntPredicate predicate)
    {
        // empty
    }

    fun void sort(IntComparator comparator)
    {
        // empty
    }

    fun IntList copy()
    {
        return null;
    }

    fun IntList subList(int fromIndex, int toIndex)
    {
        return null;
    }
}
