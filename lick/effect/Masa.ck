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
// inspired by Malekko Thicken, buy one here
// https://malekkoheavyindustry.com/product/thicken/
//

public class Masa extends Effect
{
    Delay _delay1;
    Delay _delay2;
    Gain _dry;
    Cee cee;

    float _spread;

    inlet => _dry => cee;
    inlet => _delay1 => cee;
    inlet => _delay2 => cee;
    cee => wet;

    {
        0.0 => _spread;
        0.5 => _dry.gain;

        198::ms => _delay1.max;
        18::ms => _delay1.delay;
        0.3 => _delay1.gain;

        2246::ms => _delay2.max;
        20::ms => _delay2.delay;
        0.2 => _delay2.gain;
    }

    fun float spread()
    {
        return _spread;
    }

    fun float spread(float f)
    {
        f => _spread;
        18::ms + (f * 180::ms) => _delay1.delay;
        _delay1.delay() + (Math.pow(2, 10 * f) * 1::ms) => _delay2.delay;
        return _spread;
    }

    fun float rate()
    {
        return cee.rate();
    }

    fun float rate(float f)
    {
        return cee.rate(f);
    }

    fun float depth()
    {
        return cee.depth();
    }

    fun float depth(float f)
    {
        return cee.depth(f);
    }

    fun float cutoff()
    {
        return cee.cutoff();
    }

    fun float cutoff(float f)
    {
        return cee.cutoff(f);
    }

    fun float resonance()
    {
        return cee.resonance();
    }

    fun float resonance(float f)
    {
        return cee.resonance(f);
    }
}
