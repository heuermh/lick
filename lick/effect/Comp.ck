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

public class Comp extends DynamicEffect
{
    {
        _dyno.compress();
    }

    fun static Comp create()
    {
        Comp comp;
        return comp;
    }

    fun static Comp create(UGen sideInput)
    {
        Comp comp;
        sideInput => comp.sideInput;
        1 => comp.externalSideInput;
        return comp;
    }

    fun static Comp create(float ratio, float threshold, dur attackTime, dur releaseTime)
    {
        Comp comp;
        ratio => comp.ratio;
        threshold => comp.threshold;
        attackTime => comp.attackTime;
        releaseTime => comp.releaseTime;
        return comp;
    }

    fun static Comp create(float ratio, float threshold, dur attackTime, dur releaseTime, UGen sideInput)
    {
        Comp comp;
        ratio => comp.ratio;
        threshold => comp.threshold;
        attackTime => comp.attackTime;
        releaseTime => comp.releaseTime;
        sideInput => comp.sideInput;
        1 => comp.externalSideInput;
        return comp;
    }
}
