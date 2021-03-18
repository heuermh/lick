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

public class DurFunctions
{
    fun static DurFunction compose(DurFunction g, DurFunction h)
    {
        CompositeDurFunction composite;
        g @=> composite.g;
        h @=> composite.h;
        return composite;
    }

    fun static DurFunction condition(Predicate p, DurFunction f)
    {
        ConditionalDurFunction conditional;
        p @=> conditional.p;
        f @=> conditional.f;
        return conditional;
    }

    fun static DurFunction almostAlways(DurFunction f)
    {
        AlmostAlways almostAlways;
        condition(almostAlways, f);
    }

    fun static DurFunction frequently(DurFunction f)
    {
        Frequently frequently;
        condition(frequently, f);
    }

    fun static DurFunction often(DurFunction f)
    {
        Often often;
        condition(often, f);
    }

    fun static DurFunction sometimes(DurFunction f)
    {
        Sometimes sometimes;
        condition(sometimes, f);
    }

    fun static DurFunction coinFlip(DurFunction f)
    {
        CoinFlip coinFlip;
        condition(coinFlip, f);
    }

    fun static DurFunction infrequently(DurFunction f)
    {
        Infrequently infrequently;
        condition(infrequently, f);
    }

    fun static DurFunction rarely(DurFunction f)
    {
        Rarely rarely;
        condition(rarely, f);
    }
}
