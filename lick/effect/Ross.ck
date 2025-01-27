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
@import "Comp"

public class Ross extends Effect
{
    inlet => Comp _comp => outlet;

    0 => static int STANDARD;
    1 => static int BRIGHT;

    20::ms => static dur MIN_RELEASE_TIME;
    2000::ms => static dur RELEASE_TIME_RANGE;

    int _voice;
    float _level;
    float _sustain;

    {
        level(0.8);
        sustain(0.2);
        standard();
    }

    fun float level()
    {
        return _level;
    }

    fun float level(float f)
    {
        f => _level;
        f => _comp.threshold;
        return f;
    }

    fun float sustain()
    {
        return _sustain;
    }

    fun float sustain(float f)
    {
        f => _sustain;
        MIN_RELEASE_TIME + (_sustain * (RELEASE_TIME_RANGE)) => _comp.releaseTime;
        return f;
    }

    fun int voice()
    {
        return _voice;
    }

    fun int voice(int i)
    {
        i => _voice;
        return i;
    }

    fun int standard()
    {
        return voice(STANDARD);
    }

    fun int bright()
    {
        // todo: mid boost?
        return voice(BRIGHT);
    }
}