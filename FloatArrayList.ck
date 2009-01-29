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

public class FloatArrayList extends FloatList
{
    float values[0];

    fun int size()
    {
        return values.size();
    }
    
    fun int size(int capacity)
    {
        return values.size(capacity);
    }

    fun float get(int index)
    {
        return values[index];
    }

    fun float sample()
    {
        return values[Math.rand2(0, size() - 1)];
    }

    fun void add(float value)
    {
        values << value;
    }

    fun void addAll(FloatList list)
    {
        list.iterator() @=> FloatIterator it;
        while (it.hasNext())
        {
            add(it.next());
        }
    }

    fun void set(int index, float value)
    {
        value => values[index];
    }

    fun FloatIterator iterator()
    {
        FloatListIterator i;
        this @=> i.list;
        return i;
    }

    fun void forEach(FloatProcedure procedure)
    {
        for (0 => int i; i < size(); i++)
        {
            procedure.run(values[i]);
        }
    }

    fun void forEach(FloatPredicate predicate, FloatProcedure procedure)
    {
        for (0 => int i; i < size(); i++)
        {
            if (predicate.test(values[i]))
            {
                procedure.run(values[i]);
            }
        }
    }

    fun void assign(float value)
    {
        for (0 => int i; i < size(); i++)
        {
            value => values[i];
        }        
    }

    fun void transform(FloatFunction fn)
    {
        for (0 => int i; i < size(); i++)
        {
            fn.evaluate(values[i]) => values[i];
        }
    }
}
