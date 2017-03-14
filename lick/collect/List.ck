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

public class List
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

    fun Object get(int index)
    {
        return null;
    }

    fun Object sample()
    {
        return null;
    }

    fun void add(Object value)
    {
        // empty
    }

    fun void addAll(List list)
    {
        // empty
    }

    fun void remove(Object value)
    {
        // empty
    }

    fun void removeAll(List list)
    {
        // empty
    }

    fun void retainAll(List list)
    {
        // empty
    }

    fun int contains(Object value)
    {
        return false;
    }

    fun int containsAll(List list)
    {
        return false;
    }

    fun int indexOf(Object value)
    {
        return -1;
    }

    fun int lastIndexOf(Object value)
    {
        return -1;
    }

    fun void set(int index, Object value)
    {
        // empty
    }

    fun Iterator iterator()
    {
        return null;
    }

    fun void forEach(UnaryProcedure procedure)
    {
        // empty
    }

    fun void forEach(UnaryPredicate predicate, UnaryProcedure procedure)
    {
        // empty
    }

    fun void clear()
    {
        // empty
    }

    fun void assign(Object value)
    {
        // empty
    }

    fun void transform(UnaryFunction fn)
    {
        // empty
    }

    fun List collect(UnaryPredicate predicate)
    {
        // empty
    }

    fun void sort(Comparator comparator)
    {
        // empty
    }

    fun List copy()
    {
        return null;
    }

    fun List subList(int fromIndex, int toIndex)
    {
        return null;
    }
}
