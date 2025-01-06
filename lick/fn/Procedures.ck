/*

    LiCK  Library for ChucK.
    Copyright (c) 2007-2025 held jointly by the individual authors.

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

public class Procedures
{
    fun static Procedure condition(Predicate p, Procedure r)
    {
        ConditionalProcedure conditional;
        p @=> conditional.p;
        r @=> conditional.r;
        return conditional;
    }

    fun static Procedure almostAlways(Procedure p)
    {
        AlmostAlways almostAlways;
        return condition(almostAlways, p);
    }

    fun static Procedure frequently(Procedure p)
    {
        Frequently frequently;
        return condition(frequently, p);
    }

    fun static Procedure often(Procedure p)
    {
        Often often;
        return condition(often, p);
    }

    fun static Procedure sometimes(Procedure p)
    {
        Sometimes sometimes;
        return condition(sometimes, p);
    }

    fun static Procedure coinFlip(Procedure p)
    {
        CoinFlip coinFlip;
        return condition(coinFlip, p);
    }

    fun static Procedure infrequently(Procedure p)
    {
        Infrequently infrequently;
        return condition(infrequently, p);
    }

    fun static Procedure rarely(Procedure p)
    {
        Rarely rarely;
        return condition(rarely, p);
    }

    fun static Procedure mod(Procedure p, int n)
    {
        Mod.create(n) @=> Mod mod;
        return condition(mod, p);
    }
}
