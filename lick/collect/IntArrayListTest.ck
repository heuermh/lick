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
        testClear();
        testGetAddSet();
        testContains();
        testContainsAll();
        testIndexOf();
        testLastIndexOf();
        testIterator();
        testForEach();
        testAssign();
        testTransform();
        testAddAll();
        testCollect();
        testCopy();
        testSubList();

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

    fun void testClear()
    {
        IntArrayList list;
        assertNotNull(list);
        assertEquals(0, list.size());
        assertTrue(list.isEmpty());

        assertEquals(16, list.size(16));
        assertFalse(list.isEmpty());

        list.clear();
        assertEquals(0, list.size());
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

    fun void testContains()
    {
        IntArrayList list;

        list.add(1);
        assertTrue(list.contains(1));
        assertFalse(list.contains(2));
    }

    fun void testContainsAll()
    {
        IntArrayList list0;
        IntArrayList list1;

        list0.add(1);
        assertTrue(list0.containsAll(list1));
    }

    fun void testIndexOf()
    {
        IntArrayList list;

        list.add(1);
        list.add(2);
        assertEquals(0, list.indexOf(1));
        assertEquals(1, list.indexOf(2));
        assertEquals(-1, list.indexOf(3));
    }

    fun void testLastIndexOf()
    {
        IntArrayList list;

        list.add(1);
        list.add(2);
        list.add(2);
        list.add(2);
        assertEquals(0, list.lastIndexOf(1));
        assertEquals(3, list.lastIndexOf(2));
        assertEquals(-1, list.lastIndexOf(3));
    }

    fun void testCollect()
    {
        IntArrayList list;

        list.add(1);
        list.add(2);
        list.add(3);

        NeverTrue neverTrue;
        list.collect(neverTrue) @=> IntList result0;
        assertTrue(result0.isEmpty());

        AlwaysTrue alwaysTrue;
        list.collect(alwaysTrue) @=> IntList result1;
        assertTrue(result1.contains(1));
        assertTrue(result1.contains(2));
        assertTrue(result1.contains(3));
        assertFalse(result1.contains(4));
    }

    fun void testCopy()
    {
        IntArrayList list;

        list.copy() @=> IntList copy0;
        assertTrue(copy0.isEmpty());

        list.add(1);
        list.add(2);
        list.add(3);
        list.copy() @=> IntList copy1;
        assertTrue(copy1.contains(1));
        assertTrue(copy1.contains(2));
        assertTrue(copy1.contains(3));
        assertFalse(copy1.contains(4));
    }

    fun void testSubList()
    {
        IntArrayList list;
        list.add(1);
        list.add(2);
        list.add(3);

        list.subList(99, 100) @=> IntList subList0;
        assertTrue(subList0.isEmpty());

        list.subList(0, 99) @=> IntList subList1;
        assertTrue(subList1.contains(1));
        assertTrue(subList1.contains(2));
        assertTrue(subList1.contains(3));
        assertFalse(subList1.contains(4));

        list.subList(1, 2) @=> IntList subList2;
        assertFalse(subList2.contains(1));
        assertTrue(subList2.contains(2));
        assertFalse(subList2.contains(3));
        assertFalse(subList2.contains(4));

        list.subList(1, 3) @=> IntList subList3;
        assertFalse(subList3.contains(1));
        assertTrue(subList3.contains(2));
        assertTrue(subList3.contains(3));
        assertFalse(subList3.contains(4));
    }
}

IntArrayListTest intArrayListTest;
1::second => now;
