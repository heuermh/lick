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

// todo: add ref link
class F extends FloatFunction
{
    0.9f => float kneeStart;
    5.0f => float kneeCurve;

    fun float evaluate(float value)
    {
        Math.clampf(value, -kneeStart, kneeStart) => float linearPart;
        value - linearPart => float clippedPart;
        Math.atan(clippedPart * kneeCurve) / kneeCurve => clippedPart;
        return linearPart + clippedPart;
    }
}

public class KneeClip extends WaveShaper
{
    F f;
    {
        f @=> shape;
    }

    fun float kneeStart()
    {
        return f.kneeStart;
    }

    fun float kneeStart(float k)
    {
        k => f.kneeStart;
        return k;
    }

    fun float kneeCurve()
    {
        return f.kneeCurve;
    }

    fun float kneeCurve(float k)
    {
        k => f.kneeCurve;
        return k;
    }
}
