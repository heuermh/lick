/*

    LiCK  Library for ChucK.
    Copyright (c) 2007-2026 held jointly by the individual authors.

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

public class FloatProcedures
{
    fun static FloatProcedure condition(Predicate p, FloatProcedure r)
    {
        ConditionalFloatProcedure conditional;
        p @=> conditional.p;
        r @=> conditional.r;
        return conditional;
    }

    fun static FloatProcedure almostAlways(FloatProcedure p)
    {
        AlmostAlways almostAlways;
        return condition(almostAlways, p);
    }

    fun static FloatProcedure frequently(FloatProcedure p)
    {
        Frequently frequently;
        return condition(frequently, p);
    }

    fun static FloatProcedure often(FloatProcedure p)
    {
        Often often;
        return condition(often, p);
    }

    fun static FloatProcedure sometimes(FloatProcedure p)
    {
        Sometimes sometimes;
        return condition(sometimes, p);
    }

    fun static FloatProcedure coinFlip(FloatProcedure p)
    {
        CoinFlip coinFlip;
        return condition(coinFlip, p);
    }

    fun static FloatProcedure infrequently(FloatProcedure p)
    {
        Infrequently infrequently;
        return condition(infrequently, p);
    }

    fun static FloatProcedure rarely(FloatProcedure p)
    {
        Rarely rarely;
        return condition(rarely, p);
    }

    fun static FloatProcedure mod(FloatProcedure p, int n)
    {
        Mod.create(n) @=> Mod mod;
        return condition(mod, p);
    }
}
