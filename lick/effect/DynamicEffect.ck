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

@import "Effect"

public class DynamicEffect extends Effect
{
    Gain sideInput => blackhole;
    inlet => Dyno _dyno => outlet;

    {
        spork ~ _updateAtSampleRate();
    }

    fun float ratio()
    {
        return _dyno.ratio();
    }

    fun float ratio(float f)
    {
        f => _dyno.ratio;
        return f;
    }

    fun float threshhold()
    {
        return _dyno.thresh();
    }

    fun float threshold(float f)
    {
        f => _dyno.thresh;
        return f;
    }

    fun dur attackTime()
    {
        return _dyno.attackTime();
    }

    fun dur attackTime(dur d)
    {
        d => _dyno.attackTime;
        return d;
    }

    fun dur releaseTime()
    {
        return _dyno.releaseTime();
    }

    fun dur releaseTime(dur d)
    {
        d => _dyno.releaseTime;
        return d;
    }

    fun int externalSideInput()
    {
        return _dyno.externalSideInput();
    }

    fun int externalSideInput(int i)
    {
        i => _dyno.externalSideInput;
        return i;
    }

    fun void _updateAtSampleRate()
    {
        while (true)
        {
            if (externalSideInput())
            {
                sideInput.last() => _dyno.sideInput;
            }
            1::samp => now;
        }
    }
}
