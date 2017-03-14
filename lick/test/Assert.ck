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

public class Assert
{
    false => int exitOnFailure;

    fun void assertTrue(int expr)
    {
        if (!expr)
        {
            "expected true" => string errorMessage;
            fail(errorMessage);
        }
    }

    fun void assertTrue(string message, int expr)
    {
        if (!expr)
        {
            message + " expected true" => string errorMessage;
            fail(errorMessage);
        }
    }

    fun void assertFalse(int expr)
    {
        if (expr)
        {
            "expected false" => string errorMessage;
            fail(errorMessage);
        }
    }

    fun void assertFalse(string message, int expr)
    {
        if (expr)
        {
            message + " expected false" => string errorMessage;
            fail(errorMessage);
        }
    }

    fun void assertNull(Object value)
    {
        if (value != null)
        {
            "expected null, was: " + value => string errorMessage;
            fail(errorMessage);
        }
    }

    fun void assertNull(string message, Object value)
    {
        if (value != null)
        {
            message + " expected null, was: " + value => string errorMessage;
            fail(errorMessage);
        }
    }

    fun void assertNotNull(Object value)
    {
        if (value == null)
        {
            "expected not null" => string errorMessage;
            fail(errorMessage);
        }
    }

    fun void assertNotNull(string message, Object value)
    {
        if (value == null)
        {
            message + " expected not null" => string errorMessage;
            fail(errorMessage);
        }
    }

    fun void assertEquals(int expected, int actual)
    {
        if (expected != actual)
        {
            "expected: " + expected + " actual: " + actual => string errorMessage;
            fail(errorMessage);
        }
    }

    fun void assertEquals(string message, int expected, int actual)
    {
        if (expected != actual)
        {
            message + " expected: " + expected + " actual: " + actual => string errorMessage;
            fail(errorMessage);
        }
    }

    fun void assertEquals(float expected, float actual, float delta)
    {
        if (Std.fabs(expected - actual) > delta)
        {
            "expected: " + expected + " actual: " + actual + " not within: " + delta => string errorMessage;
            fail(errorMessage);
        }
    }

    fun void assertEquals(string message, float expected, float actual, float delta)
    {
        if (Std.fabs(expected - actual) > delta)
        {
            message + " expected: " + expected + " actual: " + actual + " not within: " + delta => string errorMessage;
            fail(errorMessage);
        }
    }

    fun void assertEquals(Object expected, Object actual)
    {
        if (expected != actual)
        {
            "expected: " + expected + " actual: " + actual => string errorMessage;
            fail(errorMessage);
        }
    }

    fun void assertEquals(string message, Object expected, Object actual)
    {
        if (expected != actual)
        {
            message + " expected: " + expected + " actual: " + actual => string errorMessage;
            fail(errorMessage);
        }
    }

    fun void assertNotEquals(int expected, int actual)
    {
        if (expected == actual)
        {
            "expected: " + expected + " actual: " + actual + " expected not equals" => string errorMessage;
            fail(errorMessage);
        }
    }

    fun void assertNotEquals(string message, int expected, int actual)
    {
        if (expected == actual)
        {
            message + " expected: " + expected + " actual: " + actual + " expected not equals" => string errorMessage;
            fail(errorMessage);
        }
    }

    fun void assertNotEquals(float expected, float actual, float delta)
    {
        if (Std.fabs(expected - actual) <= delta)
        {
            "expected: " + expected + " actual: " + actual + " expected not within: " + delta => string errorMessage;
            fail(errorMessage);
        }
    }

    fun void assertNotEquals(string message, float expected, float actual, float delta)
    {
        if (Std.fabs(expected - actual) <= delta)
        {
            message + " expected: " + expected + " actual: " + actual + " expected not within: " + delta => string errorMessage;
            fail(errorMessage);
        }
    }

    fun void assertNotEquals(Object expected, Object actual)
    {
        if (expected == actual)
        {
            "expected: " + expected + " actual: " + actual + " expected not equals" => string errorMessage;
            fail(errorMessage);
        }
    }

    fun void assertNotEquals(string message, Object expected, Object actual)
    {
        if (expected == actual)
        {
            message + " expected: " + expected + " actual: " + actual + " expected not equals" => string errorMessage;
            fail(errorMessage);
        }
    }

    fun void fail()
    {
        fail(null);
    }

    fun void fail(string message)
    {
        if (message == null)
        {
            <<<"test failure">>>;
        }
        else
        {
            <<<"test failure:", message>>>;            
        }
        if (exitOnFailure)
        {
            me.exit();
        }
    }
}
