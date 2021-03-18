/*

    LiCK  Library for ChucK.
    Copyright (c) 2007-2021 held jointly by the individual authors.

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

public class IntFunctions
{
    fun static IntFunction compose(IntFunction g, IntFunction h)
    {
        CompositeIntFunction composite;
        g @=> composite.g;
        h @=> composite.h;
        return composite;
    }

    fun static IntFunction condition(Predicate p, IntFunction f)
    {
        ConditionalIntFunction conditional;
        p @=> conditional.p;
        f @=> conditional.f;
        return conditional;
    }

    fun static IntFunction almostAlways(IntFunction f)
    {
        AlmostAlways almostAlways;
        condition(almostAlways, f);
    }

    fun static IntFunction frequently(IntFunction f)
    {
        Frequently frequently;
        condition(frequently, f);
    }

    fun static IntFunction often(IntFunction f)
    {
        Often often;
        condition(often, f);
    }

    fun static IntFunction sometimes(IntFunction f)
    {
        Sometimes sometimes;
        condition(sometimes, f);
    }

    fun static IntFunction coinFlip(IntFunction f)
    {
        CoinFlip coinFlip;
        condition(coinFlip, f);
    }

    fun static IntFunction infrequently(IntFunction f)
    {
        Infrequently infrequently;
        condition(infrequently, f);
    }

    fun static IntFunction rarely(IntFunction f)
    {
        Rarely rarely;
        condition(rarely, f);
    }
}
