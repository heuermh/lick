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
        testGetAddSet();
        testIterator();
        testForEach();
        testAssign();
        testTransform();
        testAddAll();
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

    fun void testFoo()
    {
        ArrayList list0;
        Foo fooIn;
        list0.add(fooIn);
        list0.get(0) $ Foo @=> Foo fooOut;
        assertEquals(fooIn, fooOut);
        <<<fooOut.foo()>>>;
    }
}

ArrayListTest arrayListTest;
1::second => now;