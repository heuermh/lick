/*

    LiCK  Library for ChucK.
    Copyright (c) 2007-2024 held jointly by the individual authors.

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

public class Limit extends DynamicEffect
{
    {
        _dyno.limit();
    }

    fun static Limit create()
    {
        Limit limit;
        return limit;
    }

    fun static Limit create(UGen sideInput)
    {
        Limit limit;
        sideInput => limit.sideInput;
        1 => limit.externalSideInput;
        return limit;
    }

    fun static Limit create(float ratio, float threshold, dur attackTime, dur releaseTime)
    {
        Limit limit;
        ratio => limit.ratio;
        threshold => limit.threshold;
        attackTime => limit.attackTime;
        releaseTime => limit.releaseTime;
        return limit;
    }

    fun static Limit create(float ratio, float threshold, dur attackTime, dur releaseTime, UGen sideInput)
    {
        Limit limit;
        ratio => limit.ratio;
        threshold => limit.threshold;
        attackTime => limit.attackTime;
        releaseTime => limit.releaseTime;
        sideInput => limit.sideInput;
        1 => limit.externalSideInput;
        return limit;
    }
}
