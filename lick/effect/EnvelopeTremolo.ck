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

public class EnvelopeTremolo extends Effect
{
    Envelope _env;
    float _rate;

    inlet => _env => wet;
    {
        spork ~ _updateAtRate();
    }

    fun float rate()
    {
        return _rate;
    }

    fun float rate(float f)
    {
        f => _rate;
        return f;
    }

    fun dur duration()
    {
        return _env.duration();
    }

    fun dur duration(dur d)
    {
        d => _env.duration;
    }

    fun void scale(float f)
    {
        duration() * f => duration;
    }

    fun void _updateAtRate()
    {
        while (true)
        {
            1 => _env.keyOn;
            1::second / (2.0 * _rate) => now;
            1 => _env.keyOff;
            1::second / (2.0 * _rate) => now;
        }
    }

    fun static EnvelopeTremolo create()
    {
        EnvelopeTremolo envelopeTremolo;
        return envelopeTremolo;
    }

    fun static EnvelopeTremolo create(dur duration)
    {
        EnvelopeTremolo envelopeTremolo;
        duration => envelopeTremolo.duration;
        return envelopeTremolo;
    }
}
