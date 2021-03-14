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

public class IntervalDurProvider extends HumanizedDurProvider
{
    1.0 => float f;
    Interval @ interval;
    DurProvider @ durProvider;
    TimeSignature @ timeSignature;

    fun dur evaluate()
    {
        interval.evaluate(f) * durProvider.get() => dur duration;
        return Humanize.humanize(duration, anticipation, delay, timeSignature.random);
    }

    fun static IntervalDurProvider create(TimeSignature timeSignature, Interval interval, float f, DurProvider durProvider)
    {
        IntervalDurProvider intervalDurProvider;
        timeSignature @=> intervalDurProvider.timeSignature;
        interval @=> intervalDurProvider.interval;
        f => intervalDurProvider.f;
        durProvider @=> intervalDurProvider.durProvider;
        return intervalDurProvider;
    }
}