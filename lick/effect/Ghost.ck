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

//
// similar to Death By Audio Ghost Delay
//
// buy one here:
// http://www.deathbyaudio.com/ghostdelay.html
//

public class Ghost extends Effect
{
    float _blend;

    // delay range 30 ms to 700 ms
    AnalogDelay.create() => AnalogDelay black;
    AnalogDelay.create() => AnalogDelay silver;
    AnalogDelay.create() => AnalogDelay white;
    Gain aux;

    inlet => black => silver => white => wet;
    silver => aux;
    {
        700::ms => black.max;
        30::ms => black.delay;
        700::ms => silver.max;
        131::ms => silver.delay;
        700::ms => white.max;
        673::ms => white.delay;
    }

    fun float blend()
    {
        return _blend;
    }

    fun float blend(float f)
    {
        f => _blend;
        _blend => white.mix;
        _blend => silver.mix;
        _blend => black.mix;
        return _blend;
    }
}
