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

public class ArrayList extends List
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

    fun void clear()
    {
        values.size(0);
    }

    fun Object get(int index)
    {
        return values[index];
    }

    fun Object sample()
    {
        Math.random2(0, size() - 1) => int index;
        return get(index);
    }

    fun void add(Object value)
    {
        values << value;
    }

    fun void addAll(List list)
    {
        list.iterator() @=> Iterator it;
        while (it.hasNext())
        {
            add(it.next());
        }
    }

    fun void remove(int index)
    {
        for (index => int i; i < size() - 1; i++)
        {
            set(i, get(i + 1));
        }
        values.size(size() - 1);
    }

    fun int contains(Object value)
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

    fun int containsAll(List list)
    {
        list.iterator() @=> Iterator it;
        while (it.hasNext())
        {
            if (!contains(it.next()))
            {
                return false;
            }
        }
        return true;
    }

    fun int indexOf(Object value)
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

    fun int lastIndexOf(Object value)
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

    fun void set(int index, Object value)
    {
        value @=> values[index];
    }

    fun Iterator iterator()
    {
        ListIterator i;
        this @=> i.list;
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

    fun void assign(Object value)
    {
        for (0 => int i; i < size(); i++)
        {
            value @=> values[i];
        }        
    }

    fun void transform(UnaryFunction fn)
    {
        for (0 => int i; i < size(); i++)
        {
            fn.evaluate(values[i]) @=> values[i];
        }
    }

    fun List collect(UnaryPredicate predicate)
    {
        ArrayList result;
        for (0 => int i; i < size(); i++)
        {
            if (predicate.test(get(i)))
            {
                result.add(get(i));
            }
        }
        return result;
    }

    fun List copy()
    {
        ArrayList result;
        for (0 => int i; i < size(); i++)
        {
            result.add(get(i));
        }
        return result;
    }

    fun List subList(int fromIndex, int toIndex)
    {
        ArrayList result;
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

    fun void sort(Comparator c)
    {
        _quickSort(0, size() - 1, c);
    }

    fun void _quickSort(int low, int high, Comparator c)
    {
        if (low < high)
        {
            _partition(low, high, c) => int p;
            _quickSort(low, p, c);
            _quickSort(p + 1, high, c);
        }
    }

    fun int _partition(int low, int high, Comparator c)
    {
        get(low) @=> Object pivot;
        low - 1 => int i;
        high + 1 => int j;
        while (true)
        {
            do
            {
                1 +=> i;
            }
            while (c.compare(get(i), pivot) < 0);

            do
            {
                j - 1 => j;
            }
            while (c.compare(get(j), pivot) > 0);

            if (i >= j)
            {
                return j;
            }
            swap(i, j);
        }
    }

    fun void swap(int a, int b)
    {
        get(a) @=> Object temp;
        set(a, get(b));
        set(b, temp);
    }
}
