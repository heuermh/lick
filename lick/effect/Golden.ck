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

//
// multi-tap delay based on golden ratio

public class Golden extends Ecco
{

    fun static Golden goldenEighths(TimeSignature ts)
    {
        Golden golden;
        ts @=> golden.ts;
        ts.eighthProvider() @=> golden._dur1;
        IntervalDurProvider.create(ts, Intervals.golden(), 1.0, ts.eighthProvider()) @=> golden._dur2;
        IntervalDurProvider.create(ts, Intervals.golden(), 2.0, ts.eighthProvider()) @=> golden._dur3;
        IntervalDurProvider.create(ts, Intervals.golden(), 3.0, ts.eighthProvider()) @=> golden._dur4;
        golden._init();
        return golden;
    }

    fun static Golden goldenSixteenths(TimeSignature ts)
    {
        Golden golden;
        ts @=> golden.ts;
        ts.sixteenthProvider() @=> golden._dur1;
        IntervalDurProvider.create(ts, Intervals.golden(), 1.0, ts.sixteenthProvider()) @=> golden._dur2;
        IntervalDurProvider.create(ts, Intervals.golden(), 2.0, ts.sixteenthProvider()) @=> golden._dur3;
        IntervalDurProvider.create(ts, Intervals.golden(), 3.0, ts.sixteenthProvider()) @=> golden._dur4;
        golden._init();
        return golden;
    }
}
