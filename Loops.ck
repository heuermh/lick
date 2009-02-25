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

public class Loops
{
    0::ms => static dur none;
    52::week => static dur forever;

    fun static Procedure append(Procedure g, Procedure h)
    {
        Append append;
        g @=> append.g;
        h @=> append.h;
        return append;
    }

    fun static Procedure loop(Procedure procedure, dur wait)
    {
        return loop(procedure, none, wait, forever);
    }

    fun static Procedure loop(Procedure procedure, dur wait, dur length)
    {
        return loop(procedure, none, wait, length);
    }

    fun static Procedure loop(Procedure procedure, dur offset, dur wait, dur length)
    {
        Loop loop;
        offset => loop.offset;
        wait => loop.wait;
        length => loop.length;
        procedure @=> loop.procedure;
        return loop;
    }

    fun static Procedure loop(FloatProcedure floatProcedure, dur wait)
    {
        return loop(floatProcedure, none, wait, forever);
    }

    fun static Procedure loop(FloatProcedure floatProcedure, dur wait, dur length)
    {
        return loop(floatProcedure, none, wait, length);
    }

    fun static Procedure loop(FloatProcedure floatProcedure, dur offset, dur wait, dur length)
    {
        Loop loop;
        offset => loop.offset;
        wait => loop.wait;
        length => loop.length;
        floatProcedure @=> loop.floatProcedure;
        return loop;
    }

    fun static Procedure loop(Procedure procedure, int n)
    {
        return loop(procedure, none, none, n);
    }

    fun static Procedure loop(Procedure procedure, dur wait, int n)
    {
        return loop(procedure, none, wait, n);
    }

    fun static Procedure loop(Procedure procedure, dur offset, dur wait, int n)
    {
        Repeat r;
        n => r.n;
        offset => r.offset;
        wait => r.wait;
        procedure @=> r.procedure;
        return r;
    }

    fun static Procedure loop(FloatProcedure floatProcedure, int n)
    {
        return loop(floatProcedure, none, none, n);
    }

    fun static Procedure loop(FloatProcedure floatProcedure, dur wait, int n)
    {
        return loop(floatProcedure, none, wait, n);
    }

    fun static Procedure loop(FloatProcedure floatProcedure, dur offset, dur wait, int n)
    {
        Repeat r;
        n => r.n;
        offset => r.offset;
        wait => r.wait;
        floatProcedure @=> r.floatProcedure;
        return r;
    }

    fun static Procedure prepend(Procedure g, Procedure h)
    {
        Prepend prepend;
        g @=> prepend.g;
        h @=> prepend.h;
        return prepend;
    }
}
