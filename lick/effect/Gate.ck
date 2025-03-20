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

@import "DynamicEffect"

public class Gate extends DynamicEffect
{
    {
        _dyno.gate();
    }

    fun static Gate create()
    {
        Gate gate;
        return gate;
    }

    fun static Gate create(UGen sideInput)
    {
        Gate gate;
        sideInput => gate.sideInput;
        1 => gate.externalSideInput;
        return gate;
    }

    fun static Gate create(float ratio, float threshold, dur attackTime, dur releaseTime)
    {
        Gate gate;
        ratio => gate.ratio;
        threshold => gate.threshold;
        attackTime => gate.attackTime;
        releaseTime => gate.releaseTime;
        return gate;
    }

    fun static Gate create(float ratio, float threshold, dur attackTime, dur releaseTime, UGen sideInput)
    {
        Gate gate;
        ratio => gate.ratio;
        threshold => gate.threshold;
        attackTime => gate.attackTime;
        releaseTime => gate.releaseTime;
        sideInput => gate.sideInput;
        1 => gate.externalSideInput;
        return gate;
    }
}
