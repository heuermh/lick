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

class NeverTrue extends FloatPredicate
{
    // empty
}

class AlwaysTrue extends FloatPredicate
{
    fun int test(int arg)
    {
        return true;
    }
}

class Inverse extends FloatFunction
{
    fun float evaluate(float arg)
    {
        return (-1.0 * arg);
    }
}

class FloatArrayListTest extends Assert
{
    {
        true => exitOnFailure;
        testConstructor();
        testSize();
        testGetAddSet();
        testIterator();
        testForEach();
        testAssign();
        testTransform();
        testAddAll();

        <<<"FloatArrayListTest ok">>>;
    }

    fun void testConstructor()
    {
        FloatArrayList list;
        assertNotNull(list);
    }

    fun void testSize()
    {
        FloatArrayList list;
        assertNotNull(list);
        assertEquals(0, list.size());
        assertTrue(list.isEmpty());

        assertEquals(16, list.size(16));
        assertFalse(list.isEmpty());

        assertEquals(0, list.size(0));
        assertTrue(list.isEmpty());
    }

    fun void testGetAddSet()
    {
        FloatArrayList list;

        list.add(42.0);
        assertEquals(1, list.size());
        assertFalse(list.isEmpty());
        assertEquals(42.0, list.get(0), 0.1);

        list.set(0, -42.0);
        assertEquals(-42.0, list.get(0), 0.1);

        // throws ArrayOutofBounds
        //list.get(99);
        //list.set(1.0, 99);
    }

    fun void testIterator()
    {
        FloatArrayList list;
        list.add(1.0);
        list.add(2.0);
        list.add(3.0);

        list.iterator() @=> FloatIterator iterator;
        assertNotNull(iterator);
        while (iterator.hasNext())
        {
            iterator.next() => float value;
            assertTrue(value > 0.0);
        }
    }

    fun void testForEach()
    {
        FloatArrayList list;
        list.add(1.0);
        list.add(2.0);
        list.add(3.0);

        FloatProcedure procedure;
        list.forEach(procedure);

        NeverTrue neverTrue;
        list.forEach(neverTrue, procedure);

        AlwaysTrue alwaysTrue;
        list.forEach(alwaysTrue, procedure);

        // throws NullPointerException
        //list.forEach(null);
        //list.forEach(null, procedure);
        //list.forEach(alwaysTrue, null);
    }

    fun void testAssign()
    {
        FloatArrayList list;
        FloatIterator @ iterator;
        list.size(16);

        list.iterator() @=> iterator;
        while (iterator.hasNext())
        {
            iterator.next() => float value;
            assertEquals(0.0, value, 0.1);
        }

        list.assign(42.0);
        list.iterator() @=> iterator;
        while (iterator.hasNext())
        {
            iterator.next() => float value;
            assertEquals(42.0, value, 0.1);
        }

        list.assign(0.0);
        list.iterator() @=> iterator;
        while (iterator.hasNext())
        {
            iterator.next() => float value;
            assertEquals(0.0, value, 0.1);
        }
    }

    fun void testTransform()
    {
        FloatArrayList list;
        FloatIterator @ iterator;
        Inverse inverse;
        list.size(16);

        list.assign(42.0);
        list.iterator() @=> iterator;
        while (iterator.hasNext())
        {
            iterator.next() => float value;
            assertEquals(42.0, value, 0.1);
        }

        list.transform(inverse);
        list.iterator() @=> iterator;
        while (iterator.hasNext())
        {
            iterator.next() => float value;
            assertEquals(-42.0, value, 0.1);
        }

        list.transform(inverse);
        list.iterator() @=> iterator;
        while (iterator.hasNext())
        {
            iterator.next() => float value;
            assertEquals(42.0, value, 0.1);
        }

        // throws NullPointerException
        //list.transform(null);
    }

    fun void testAddAll()
    {
        FloatArrayList list0;
        list0.size(16);
        list0.assign(42.0);

        FloatArrayList list1;
        list1.size(16);
        list1.assign(-42.0);

        FloatArrayList list2;
        list2.addAll(list0);
        list2.addAll(list1);
        assertEquals(32, list2.size());

        list2.iterator() @=> FloatIterator iterator;
        while (iterator.hasNext())
        {
            iterator.next() => float value;
            assertTrue((value == 42.0) || (value == -42.0));
        }
    }
}

FloatArrayListTest floatArrayListTest;
1::second => now;