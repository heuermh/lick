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

public class Set
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

    fun void add(Object value)
    {
        // empty
    }

    fun void addAll(Set set)
    {
        // empty
    }

    fun void remove(Object value)
    {
        // empty
    }

    fun void removeAll(Set set)
    {
        // empty
    }

    fun void retainAll(Set set)
    {
        // empty
    }

    fun int contains(Object value)
    {
        return false;
    }

    fun int containsAll(Set set)
    {
        return false;
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

    fun void transform(UnaryFunction fn)
    {
        // empty
    }

    fun Set collect(UnaryPredicate predicate)
    {
        // empty
    }

    fun Set copy()
    {
        return null;
    }
}
