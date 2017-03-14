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

public class FloatList
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
        // empty
    }

    fun float get(int index)
    {
        return -1.0;
    }

    fun float sample()
    {
        return -1.0;
    }

    fun void add(float value)
    {
        // empty
    }

    fun void addAll(FloatList list)
    {
        // empty
    }

    fun void remove(float value)
    {
        // empty
    }

    fun void removeAll(FloatList list)
    {
        // empty
    }

    fun void retainAll(FloatList list)
    {
        // empty
    }

    fun int contains(float value)
    {
        return false;
    }

    fun int containsAll(FloatList list)
    {
        return false;
    }

    fun int indexOf(float value)
    {
        return -1;
    }

    fun int lastIndexOf(float value)
    {
        return -1;
    }

    fun void set(int index, float value)
    {
        // empty
    }

    fun FloatIterator iterator()
    {
        return null;
    }

    fun void forEach(FloatProcedure procedure)
    {
        // empty
    }

    fun void forEach(FloatPredicate predicate, FloatProcedure procedure)
    {
        // empty
    }

    fun void clear()
    {
        // empty
    }

    fun void assign(float value)
    {
        // empty
    }

    fun void transform(FloatFunction fn)
    {
        // empty
    }

    fun FloatList collect(FloatPredicate predicate)
    {
        // empty
    }

    fun void sort(FloatComparator comparator)
    {
        // empty
    }

    fun FloatList copy()
    {
        return null;
    }

    fun FloatList subList(int fromIndex, int toIndex)
    {
        return null;
    }
}
