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

class NeverTrue extends IntPredicate
{
    // empty
}

class AlwaysTrue extends IntPredicate
{
    fun int test(int arg)
    {
        return true;
    }
}

class Inverse extends IntFunction
{
    fun int evaluate(int arg)
    {
        return (-1 * arg);
    }
}

// unit test for IntArrayList

class IntArrayListTest extends Assert
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

        <<<"IntArrayListTest ok">>>;
    }

    fun void testConstructor()
    {
        IntArrayList list;
        assertNotNull(list);
    }

    fun void testSize()
    {
        IntArrayList list;
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
        IntArrayList list;

        list.add(42);
        assertEquals(1, list.size());
        assertFalse(list.isEmpty());
        assertEquals(42, list.get(0));

        list.set(0, -42);
        assertEquals(-42, list.get(0));

        // throws ArrayOutofBounds
        //list.get(99);
        //list.set(1, 99);
    }

    fun void testIterator()
    {
        IntArrayList list;
        list.add(1);
        list.add(2);
        list.add(3);

        list.iterator() @=> IntIterator iterator;
        assertNotNull(iterator);
        while (iterator.hasNext())
        {
            iterator.next() => int value;
            assertTrue(value > 0);
        }
    }

    fun void testForEach()
    {
        IntArrayList list;
        list.add(1);
        list.add(2);
        list.add(3);

        IntProcedure procedure;
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
        IntArrayList list;
        IntIterator @ iterator;
        list.size(16);

        list.iterator() @=> iterator;
        while (iterator.hasNext())
        {
            iterator.next() => int value;
            assertEquals(0, value);
        }

        list.assign(42);
        list.iterator() @=> iterator;
        while (iterator.hasNext())
        {
            iterator.next() => int value;
            assertEquals(42, value);
        }

        list.assign(0);
        list.iterator() @=> iterator;
        while (iterator.hasNext())
        {
            iterator.next() => int value;
            assertEquals(0, value);
        }
    }

    fun void testTransform()
    {
        IntArrayList list;
        IntIterator @ iterator;
        Inverse inverse;
        list.size(16);

        list.assign(42);
        list.iterator() @=> iterator;
        while (iterator.hasNext())
        {
            iterator.next() => int value;
            assertEquals(42, value);
        }

        list.transform(inverse);
        list.iterator() @=> iterator;
        while (iterator.hasNext())
        {
            iterator.next() => int value;
            assertEquals(-42, value);
        }

        list.transform(inverse);
        list.iterator() @=> iterator;
        while (iterator.hasNext())
        {
            iterator.next() => int value;
            assertEquals(42, value);
        }

        // throws NullPointerException
        //list.transform(null);
    }

    fun void testAddAll()
    {
        IntArrayList list0;
        list0.size(16);
        list0.assign(42);

        IntArrayList list1;
        list1.size(16);
        list1.assign(-42);

        IntArrayList list2;
        list2.addAll(list0);
        list2.addAll(list1);
        assertEquals(32, list2.size());

        list2.iterator() @=> IntIterator iterator;
        while (iterator.hasNext())
        {
            iterator.next() => int value;
            assertTrue((value == 42) || (value == -42));
        }
    }
}

IntArrayListTest intArrayListTest;
1::second => now;