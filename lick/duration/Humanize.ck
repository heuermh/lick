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

public class Humanize
{
    fun static dur humanize(dur value)
    {
        return humanize(value, 0.05, 0.05);
    }

    fun static dur humanize(dur value, float anticipation, float delay)
    {
        return value - Std.rand2f(0.0, anticipation) * value + Std.rand2f(0.0, delay) * value;
    }

    fun static dur anticipate(dur value)
    {
        return anticipate(value, 0.1);
    }

    fun static dur anticipate(dur value, float anticipation)
    {
        return value - Std.rand2f(0.0, anticipation) * value;
    }

    fun static dur delay(dur value)
    {
        return delay(value, 0.1);
    }

    fun static dur delay(dur value, float delay)
    {
        return value + Std.rand2f(0.0, delay) * value;
    }

    // todo:  add swing


    fun static dur humanize(dur value, Random random)
    {
        return humanize(value, 0.05, 0.05, random);
    }

    fun static dur humanize(dur value, float anticipation, float delay, Random random)
    {
        return value - random.evaluate() * anticipation * value + random.evaluate() * delay * value;
    }

    fun static dur anticipate(dur value, Random random)
    {
        return anticipate(value, 0.1, random);
    }

    fun static dur anticipate(dur value, float anticipation, Random random)
    {
        return value - random.evaluate() * anticipation * value;
    }

    fun static dur delay(dur value, Random random)
    {
        return delay(value, 0.1, random);
    }

    fun static dur delay(dur value, float delay, Random random)
    {
        return value + random.evaluate() * delay * value;
    }


    fun dur humanizeGaussian(dur value)
    {
        return humanizeGaussian(value, 0.05, 0.05);
    }

    fun dur humanizeGaussian(dur value, float anticipation, float delay)
    {
        return value + GaussianRandom.nextGaussian() * anticipation * value - GaussianRandom.nextGaussian() * delay * value;
    }

    fun static dur anticipateGaussian(dur value)
    {
        return anticipateGaussian(value, 0.1);
    }

    fun static dur anticipateGaussian(dur value, float anticipation)
    {
        return value - GaussianRandom.nextGaussian() * anticipation * value;
    }

    fun static dur delayGaussian(dur value)
    {
        return delayGaussian(value, 0.1);
    }

    fun static dur delayGaussian(dur value, float delay)
    {
        return value + GaussianRandom.nextGaussian() * delay * value;
    }
}
