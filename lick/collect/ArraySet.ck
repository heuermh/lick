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

class ArraySetIterator extends Iterator
{
    0 => int index;
    ArraySet @ set;

    fun int hasNext()
    {
        return (index < set.size());
    }

    fun Object next()
    {       
        set.values[index] @=> Object rv;
        index++;
        return rv;
    }
}

public class ArraySet extends Set
{
    Object values[0];

    fun int size()
    {
        return values.size();
    }
    
    fun int size(int capacity)
    {
        return values.size(capacity);
    }

    fun void add(Object value)
    {
        if (!contains(value))
        {
            values << value;
        }
    }

    fun void addAll(Set set)
    {
        set.iterator() @=> Iterator it;
        while (it.hasNext())
        {
            add(it.next());
        }
    }

    fun int contains(Object value)
    {
        for (0 => int i; i < size(); i++)
        {
            if (value == values[i])
            {
                return true;
            }
        }
        return false;
    }

    fun int containsAll(Set set)
    {
        set.iterator() @=> Iterator it;
        while (it.hasNext())
        {
            if (!contains(it.next()))
            {
                return false;
            }
        }
        return true;
    }

    fun Iterator iterator()
    {
        ArraySetIterator i;
        this @=> i.set;
        return i;
    }

    fun void forEach(UnaryProcedure procedure)
    {
        for (0 => int i; i < size(); i++)
        {
            procedure.run(values[i]);
        }
    }

    fun void forEach(UnaryPredicate predicate, UnaryProcedure procedure)
    {
        for (0 => int i; i < size(); i++)
        {
            if (predicate.test(values[i]))
            {
                procedure.run(values[i]);
            }
        }
    }

    fun void transform(UnaryFunction fn)
    {
        for (0 => int i; i < size(); i++)
        {
            // todo:  need to check that result isn't contained in values already
            fn.evaluate(values[i]) @=> values[i];
        }
    }

    fun Set collect(UnaryPredicate predicate)
    {
        ArraySet result;
        for (0 => int i; i < size(); i++)
        {
            if (predicate.test(values[i]))
            {
                result.add(values[i]);
            }
        }
        return result;
    }

    fun Set copy()
    {
        ArraySet result;
        for (0 => int i; i < size(); i++)
        {
            result.add(values[i]);
        }
        return result;
    }
}
