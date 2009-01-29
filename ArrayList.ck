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

    fun Object get(int index)
    {
        return values[index];
    }

    fun Object sample()
    {
        Math.rand2(0, size() - 1) => int index;
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

    fun void set(int index, Object value)
    {
        value @=> values[index];
    }

    // todo:  move to List etc.
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
}
