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

class NeverTrue extends UnaryPredicate
{
    // empty
}

class AlwaysTrue extends UnaryPredicate
{
    fun int test(Object arg)
    {
        return true;
    }
}

class Nullify extends UnaryFunction
{
    fun Object evaluate(Object arg)
    {
        return null;
    }
}

class Foo
{
    fun int foo()
    {
        return 1;
    }
}

// unit test for ArrayList

class ArrayListTest extends Assert
{
    Object foo;
    Object bar;
    Object baz;
    Object qux;
    Object garply;

    {
        true => exitOnFailure;
        testConstructor();
        testSize();
        testClear();
        testGetAddSet();
        testAddAll();
        testContains();
        testContainsAll();
        testIndexOf();
        testLastIndexOf();
        testIterator();
        testForEach();
        testAssign();
        testTransform();
        testCollect();
        testCopy();
        testSubList();
        testFoo();

        <<<"ArrayListTest ok">>>;
    }

    fun void testConstructor()
    {
        ArrayList list;
        assertNotNull(list);
    }

    fun void testSize()
    {
        ArrayList list;
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
        ArrayList list;
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
        ArrayList list;

        list.add(foo);
        assertEquals(1, list.size());
        assertFalse(list.isEmpty());
        assertEquals(foo, list.get(0));

        list.set(0, bar);
        assertEquals(bar, list.get(0));

        // throws ArrayOutofBounds
        //list.get(99);
        //list.set(baz, 99);
    }

    fun void testContains()
    {
        ArrayList list;

        list.add(foo);
        assertTrue(list.contains(foo));
        assertFalse(list.contains(bar));
    }

    fun void testContainsAll()
    {
        ArrayList list0;
        ArrayList list1;

        list0.add(foo);
        assertTrue(list0.containsAll(list1));
    }

    fun void testIndexOf()
    {
        ArrayList list;

        list.add(foo);
        list.add(bar);
        assertEquals(0, list.indexOf(foo));
        assertEquals(1, list.indexOf(bar));
        assertEquals(-1, list.indexOf(baz));
    }

    fun void testLastIndexOf()
    {
        ArrayList list;

        list.add(foo);
        list.add(bar);
        list.add(bar);
        list.add(bar);
        assertEquals(0, list.lastIndexOf(foo));
        assertEquals(3, list.lastIndexOf(bar));
        assertEquals(-1, list.lastIndexOf(baz));
    }

    fun void testIterator()
    {
        ArrayList list;
        list.add(foo);
        list.add(bar);
        list.add(baz);

        list.iterator() @=> Iterator iterator;
        assertNotNull(iterator);
        while (iterator.hasNext())
        {
            iterator.next() @=> Object value;
            assertNotNull(value);
        }
    }

    fun void testForEach()
    {
        ArrayList list;
        list.add(foo);
        list.add(bar);
        list.add(baz);

        UnaryProcedure procedure;
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
        ArrayList list;
        Iterator @ iterator;
        list.size(16);

        list.iterator() @=> iterator;
        while (iterator.hasNext())
        {
            iterator.next() @=> Object value;
            assertNull(value);
        }

        list.assign(foo);
        list.iterator() @=> iterator;
        while (iterator.hasNext())
        {
            iterator.next() @=> Object value;
            assertEquals(foo, value);
        }

        list.assign(bar);
        list.iterator() @=> iterator;
        while (iterator.hasNext())
        {
            iterator.next() @=> Object value;
            assertEquals(bar, value);
        }
    }

    fun void testTransform()
    {
        ArrayList list;
        Iterator @ iterator;
        Nullify nullify;
        list.size(16);

        list.assign(foo);
        list.iterator() @=> iterator;
        while (iterator.hasNext())
        {
            iterator.next() @=> Object value;
            assertEquals(foo, value);
        }

        list.transform(nullify);
        list.iterator() @=> iterator;
        while (iterator.hasNext())
        {
            iterator.next() @=> Object value;
            assertNull(value);
        }

        // throws NullPointerException
        //list.transform(null);
    }

    fun void testCollect()
    {
        ArrayList list;

        list.add(foo);
        list.add(bar);
        list.add(baz);

        NeverTrue neverTrue;
        list.collect(neverTrue) @=> List result0;
        assertTrue(result0.isEmpty());

        AlwaysTrue alwaysTrue;
        list.collect(alwaysTrue) @=> List result1;
        assertTrue(result1.contains(foo));
        assertTrue(result1.contains(bar));
        assertTrue(result1.contains(baz));
        assertFalse(result1.contains(garply));
    }

    fun void testAddAll()
    {
        ArrayList list0;
        list0.size(16);
        list0.assign(foo);

        ArrayList list1;
        list1.size(16);
        list1.assign(bar);

        ArrayList list2;
        list2.addAll(list0);
        list2.addAll(list1);
        assertEquals(32, list2.size());

        list2.iterator() @=> Iterator iterator;
        while (iterator.hasNext())
        {
            iterator.next() @=> Object value;
            assertTrue((value == foo) || (value == bar));
        }
    }

    fun void testCopy()
    {
        ArrayList list;

        list.copy() @=> List copy0;
        assertTrue(copy0.isEmpty());

        list.add(foo);
        list.add(bar);
        list.add(baz);
        list.copy() @=> List copy1;
        assertTrue(copy1.contains(foo));
        assertTrue(copy1.contains(bar));
        assertTrue(copy1.contains(baz));
        assertFalse(copy1.contains(garply));
    }

    fun void testSubList()
    {
        ArrayList list;
        list.add(foo);
        list.add(bar);
        list.add(baz);

        list.subList(99, 100) @=> List subList0;
        assertTrue(subList0.isEmpty());

        list.subList(0, 99) @=> List subList1;
        assertTrue(subList1.contains(foo));
        assertTrue(subList1.contains(bar));
        assertTrue(subList1.contains(baz));
        assertFalse(subList1.contains(garply));

        list.subList(1, 2) @=> List subList2;
        assertFalse(subList2.contains(foo));
        assertTrue(subList2.contains(bar));
        assertFalse(subList2.contains(baz));
        assertFalse(subList2.contains(garply));

        list.subList(1, 3) @=> List subList3;
        assertFalse(subList3.contains(foo));
        assertTrue(subList3.contains(bar));
        assertTrue(subList3.contains(baz));
        assertFalse(subList3.contains(garply));
    }

    fun void testFoo()
    {
        ArrayList list0;
        Foo fooIn;
        list0.add(fooIn);
        list0.get(0) $ Foo @=> Foo fooOut;
        assertEquals(fooIn, fooOut);
    }
}

ArrayListTest arrayListTest;
1::second => now;
