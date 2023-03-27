/*

    LiCK  Library for ChucK.
    Copyright (c) 2007-2023 held jointly by the individual authors.

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

public class IntProcedures
{
    fun static IntProcedure condition(Predicate p, IntProcedure r)
    {
        ConditionalIntProcedure conditional;
        p @=> conditional.p;
        r @=> conditional.r;
        return conditional;
    }

    fun static IntProcedure almostAlways(IntProcedure p)
    {
        AlmostAlways almostAlways;
        return condition(almostAlways, p);
    }

    fun static IntProcedure frequently(IntProcedure p)
    {
        Frequently frequently;
        return condition(frequently, p);
    }

    fun static IntProcedure often(IntProcedure p)
    {
        Often often;
        return condition(often, p);
    }

    fun static IntProcedure sometimes(IntProcedure p)
    {
        Sometimes sometimes;
        return condition(sometimes, p);
    }

    fun static IntProcedure coinFlip(IntProcedure p)
    {
        CoinFlip coinFlip;
        return condition(coinFlip, p);
    }

    fun static IntProcedure infrequently(IntProcedure p)
    {
        Infrequently infrequently;
        return condition(infrequently, p);
    }

    fun static IntProcedure rarely(IntProcedure p)
    {
        Rarely rarely;
        return condition(rarely, p);
    }

    fun static IntProcedure mod(IntProcedure p, int n)
    {
        Mod.create(n) @=> Mod mod;
        return condition(mod, p);
    }
}
