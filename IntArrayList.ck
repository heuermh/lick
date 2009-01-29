/*

    LiCK  Library for ChucK.
    Copyright (c) 2007-2009 held jointly by the individual authors.

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

    fun int get(int index)
    {
        return values[index];
    }

    fun int sample()
    {
        return values[Math.rand2(0, size() - 1)];
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
}
