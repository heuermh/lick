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

    fun void remove(int index)
    {
        for (index => int i; i < size() - 1; i++)
        {
            set(i, get(i + 1));
        }
        values.size(size() - 1);
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

    fun void sort(IntComparator c)
    {
        _quickSort(0, size() - 1, c);
    }

    fun void _quickSort(int low, int high, IntComparator c)
    {
        if (low < high)
        {
            _partition(low, high, c) => int p;
            _quickSort(low, p, c);
            _quickSort(p + 1, high, c);
        }
    }

    fun int _partition(int low, int high, IntComparator c)
    {
        get(low) => int pivot;
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
        get(a) => int temp;
        set(a, get(b));
        set(b, temp);
    }
}
