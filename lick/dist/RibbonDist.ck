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

@import "../fn/FloatFunction"
@import "WaveShaper"

// see http://electro-music.com/forum/topic-19287.html&postorder=asc
class F extends FloatFunction
{
    fun float evaluate(float value)
    {
        // f(x) = x / (0.25 * x^2 + 1.0)
        return value / (0.25 * value * value + 1.0);
    }
}

public class RibbonDist extends WaveShaper
{
    {
        F f;
        f @=> shape;
    }
}
