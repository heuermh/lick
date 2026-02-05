/*

    LiCK  Library for ChucK.
    Copyright (c) 2007-2026 held jointly by the individual authors.

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

public class Slew extends Chugen
{
    float _last;
    float _amount;
    dur _time;

    fun Slew(float f, dur d)
    {
        f => amount;
        d => time;
    }

    fun float tick(float in)
    {
        in - _last => float d;
        _amount / (_time/1::samp) => float m;
        Math.clampf(d, -m, m) => d;
        d +=> _last;
        return _last;
    }

    fun float amount()
    {
        return _amount;
    }

    fun float amount(float f)
    {
        f => _amount;
        return f;
    }

    fun dur time()
    {
        return _time;
    }

    fun dur time(dur d)
    {
        d => _time;
        return d;
    }

    fun static Slew create(float f, dur d)
    {
        return new Slew(f, d);
    }
}
