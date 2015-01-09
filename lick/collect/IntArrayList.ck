/*

    LiCK  Library for ChucK.
    Copyright (c) 2007-2015 held jointly by the individual authors.

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

public class IntArrayList extends IntList
{
    int values[0];

    fun int size()
    {
        return values.size();
    }
    
    fun int size(int capacity)
    {
        return values.size(capacity);
    }

    fun void clear()
    {
        values.size(0);
    }

    fun int get(int index)
    {
        return values[index];
    }

    fun int sample()
    {
        return values[Math.random2(0, size() - 1)];
    }

    fun void add(int value)
    {
        values << value;
    }

    fun void addAll(IntList list)
    {
        list.iterator() @=> IntIterator it;
        while (it.hasNext())
        {
            add(it.next());
        }
    }

    fun int contains(int value)
    {
        for (0 => int i; i < size(); i++)
        {
            if (value == get(i))
            {
                return true;
            }
        }
        return false;
    }

    fun int containsAll(IntList list)
    {
        list.iterator() @=> IntIterator it;
        while (it.hasNext())
        {
            if (!contains(it.next()))
            {
                return false;
            }
        }
        return true;
    }

    fun int indexOf(int value)
    {
        for (0 => int i; i < size(); i++)
        {
            if (value == get(i))
            {
                return i;
            }
        }
        return -1;
    }

    fun int lastIndexOf(int value)
    {
        -1 => int lastIndex;
        for (0 => int i; i < size(); i++)
        {
            if (value == get(i))
            {
                i => lastIndex;
            }
        }
        return lastIndex;
    }

    fun void set(int index, int value)
    {
        value => values[index];
    }

    fun IntIterator iterator()
    {
        IntListIterator i;
        this @=> i.list;
        return i;
    }

    fun void forEach(IntProcedure procedure)
    {
        for (0 => int i; i < size(); i++)
        {
            procedure.run(values[i]);
        }
    }

    fun void forEach(IntPredicate predicate, IntProcedure procedure)
    {
        for (0 => int i; i < size(); i++)
        {
            if (predicate.test(values[i]))
            {
                procedure.run(values[i]);
            }
        }
    }

    fun void assign(int value)
    {
        for (0 => int i; i < size(); i++)
        {
            value => values[i];
        }        
    }

    fun void transform(IntFunction fn)
    {
        for (0 => int i; i < size(); i++)
        {
            fn.evaluate(values[i]) => values[i];
        }
    }

    fun IntList collect(IntPredicate predicate)
    {
        IntArrayList result;
        for (0 => int i; i < size(); i++)
        {
            if (predicate.test(get(i)))
            {
                result.add(get(i));
            }
        }
        return result;
    }

    fun IntList copy()
    {
        IntArrayList result;
        for (0 => int i; i < size(); i++)
        {
            result.add(get(i));
        }
        return result;
    }

    fun IntList subList(int fromIndex, int toIndex)
    {
        IntArrayList result;
        if (fromIndex > size())
        {
            return result;
        }
        for (fromIndex => int i; i < Math.min(size(), toIndex); i++)
        {
            result.add(get(i));
        }
        return result;
    }
}
