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

public class Functions
{
    fun static UnaryFunction compose(UnaryFunction g, UnaryFunction h)
    {
        CompositeFunction composite;
        g @=> composite.g;
        h @=> composite.h;
        return composite;
    }

    fun static UnaryFunction condition(Predicate p, UnaryFunction f)
    {
        ConditionalFunction conditional;
        p @=> conditional.p;
        f @=> conditional.f;
        return conditional;
    }

    fun static UnaryFunction almostAlways(UnaryFunction f)
    {
        AlmostAlways almostAlways;
        return condition(almostAlways, f);
    }

    fun static UnaryFunction frequently(UnaryFunction f)
    {
        Frequently frequently;
        return condition(frequently, f);
    }

    fun static UnaryFunction often(UnaryFunction f)
    {
        Often often;
        return condition(often, f);
    }

    fun static UnaryFunction sometimes(UnaryFunction f)
    {
        Sometimes sometimes;
        return condition(sometimes, f);
    }

    fun static UnaryFunction coinFlip(UnaryFunction f)
    {
        CoinFlip coinFlip;
        return condition(coinFlip, f);
    }

    fun static UnaryFunction infrequently(UnaryFunction f)
    {
        Infrequently infrequently;
        return condition(infrequently, f);
    }

    fun static UnaryFunction rarely(UnaryFunction f)
    {
        Rarely rarely;
        return condition(rarely, f);
    }

    fun static UnaryFunction mod(UnaryFunction f, int n)
    {
        Mod.create(n) @=> Mod mod;
        return condition(mod, f);
    }
}
