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

// unit test for ArraySet

class ArraySetTest extends Assert
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
        testAdd();
        testAddAll();
        testContains();
        testContainsAll();
        testIterator();
        testForEach();
        //testTransform();
        testCollect();
        testCopy();

        <<<"ArraySetTest ok">>>;
    }

    fun void testConstructor()
    {
        ArraySet set;
        assertNotNull(set);
    }

    fun void testSize()
    {
        ArraySet set;
        assertNotNull(set);
        assertEquals(0, set.size());
        assertTrue(set.isEmpty());

        assertEquals(16, set.size(16));
        assertFalse(set.isEmpty());

        assertEquals(0, set.size(0));
        assertTrue(set.isEmpty());
    }

    fun void testAdd()
    {
        ArraySet set;

        set.add(foo);
        assertEquals(1, set.size());
        assertFalse(set.isEmpty());
        assertEquals(foo, set.iterator().next());

        set.add(foo);
        assertEquals(1, set.size());
        assertFalse(set.isEmpty());
        assertEquals(foo, set.iterator().next());

        set.add(bar);
        assertEquals(2, set.size());
        assertFalse(set.isEmpty());
        set.iterator() @=> Iterator iterator;
        while (iterator.hasNext())
        {
            iterator.next() @=> Object value;
            assertTrue((value == foo) || (value == bar));
        }
    }

    fun void testContains()
    {
        ArraySet set;

        set.add(foo);
        assertTrue(set.contains(foo));
        assertFalse(set.contains(bar));
    }

    fun void testContainsAll()
    {
        ArraySet set0;
        ArraySet set1;

        set0.add(foo);
        assertTrue(set0.containsAll(set1));
    }

    fun void testIterator()
    {
        ArraySet set;
        set.add(foo);
        set.add(bar);
        set.add(baz);

        set.iterator() @=> Iterator iterator;
        assertNotNull(iterator);
        while (iterator.hasNext())
        {
            iterator.next() @=> Object value;
            assertNotNull(value);
        }
    }

    fun void testForEach()
    {
        ArraySet set;
        set.add(foo);
        set.add(bar);
        set.add(baz);

        UnaryProcedure procedure;
        set.forEach(procedure);

        NeverTrue neverTrue;
        set.forEach(neverTrue, procedure);

        AlwaysTrue alwaysTrue;
        set.forEach(alwaysTrue, procedure);

        // throws NullPointerException
        //set.forEach(null);
        //set.forEach(null, procedure);
        //set.forEach(alwaysTrue, null);
    }

    fun void testTransform()
    {
        ArraySet set;
        Iterator @ iterator;
        Nullify nullify;
        set.size(16);

        set.add(foo);
        set.add(bar);
        set.add(baz);
        set.iterator() @=> iterator;
        while (iterator.hasNext())
        {
            iterator.next() @=> Object value;
            assertTrue((value == foo) || (value == bar) || (value == baz));
        }

        // todo:  this breaks the set contract, allowing more than one null
        set.transform(nullify);
        set.iterator() @=> iterator;
        while (iterator.hasNext())
        {
            iterator.next() @=> Object value;
            assertNull(value);
        }

        // throws NullPointerException
        //set.transform(null);
    }

    fun void testCollect()
    {
        ArraySet set;

        set.add(foo);
        set.add(bar);
        set.add(baz);

        NeverTrue neverTrue;
        set.collect(neverTrue) @=> Set result0;
        assertTrue(result0.isEmpty());

        AlwaysTrue alwaysTrue;
        set.collect(alwaysTrue) @=> Set result1;
        assertTrue(result1.contains(foo));
        assertTrue(result1.contains(bar));
        assertTrue(result1.contains(baz));
        assertFalse(result1.contains(garply));
    }

    fun void testAddAll()
    {
        ArraySet set0;
        set0.add(foo);
        set0.add(bar);

        ArraySet set1;
        set1.add(baz);
        set1.add(qux);

        ArraySet set2;
        set2.addAll(set0);
        set2.addAll(set1);
        assertEquals(4, set2.size());

        set2.iterator() @=> Iterator iterator;
        while (iterator.hasNext())
        {
            iterator.next() @=> Object value;
            assertTrue("value is foo, bar, baz, or qux", (value == foo) || (value == bar) || (value == baz) || (value == qux));
        }
    }

    fun void testCopy()
    {
        ArraySet set;

        set.copy() @=> Set copy0;
        assertTrue("copy0 is empty", copy0.isEmpty());

        set.add(foo);
        set.add(bar);
        set.add(baz);
        set.copy() @=> Set copy1;
        assertTrue("copy1 contains foo", copy1.contains(foo));
        assertTrue("copy1 contains bar", copy1.contains(bar));
        assertTrue("copy1 contains baz", copy1.contains(baz));
        assertFalse("copy1 does not contain garply", copy1.contains(garply));
    }
}

ArraySetTest arraySetTest;
1::second => now;
