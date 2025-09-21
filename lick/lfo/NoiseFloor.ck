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

public class NoiseFloor extends Slew
{
    float _noiseFloor;

    fun NoiseFloor(float f1, dur d, float f2)
    {
        f1 => amount;
        d => time;
        f2 => noiseFloor;
    }

    fun float tick(float in)
    {
        in - _last => float d;
        if (Math.fabs(d) > _noiseFloor)
        {
            _amount / (_time/1::samp) => float m;
            Math.clampf(d, -m, m) => d;
            d +=> _last;
        }
        return _last;
    }

    fun float noiseFloor()
    {
        return _noiseFloor;
    }

    fun float noiseFloor(float f)
    {
        f => _noiseFloor;
        return f;
    }

    fun static NoiseFloor create(float f1, dur d, float f2)
    {
        return new NoiseFloor(f1, d, f2);
    }
}
