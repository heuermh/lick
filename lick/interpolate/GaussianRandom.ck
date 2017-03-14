/*

    LiCK  Library for ChucK.
    Copyright (c) 2007-2017 held jointly by the individual authors.

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

public class GaussianRandom extends Random
{
    //
    // adapted without caching from org.apache.commmons.math3.random.AbstractRandomGenerator,
    // which implements the Polar Method, due to G.E.P. Box, M.E. Muller and G. Marsaglia,
    // as described in D. Knuth, _The Art of Computer Programming_, 3.4.1C.
    //
    fun static float nextGaussian()
    {
        0.0 => float v1;
        0.0 => float v2;
        1.0 => float s;
        while (s >= 1.0)
        {
            2.0 * Std.randf() - 1.0 => v1;
            2.0 * Std.randf() - 1.0 => v2;
            v1 * v1 + v2 * v2 => s;
        }
        if (s > 0.0)
        {
            Math.sqrt(-2.0 * Math.log(s)/s) => s;
        }
        return v1 * s;
    }

    fun float evaluate()
    {
        return nextGaussian();
    }
}
