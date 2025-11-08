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

public class Bezier extends Chugen
{
    Gain a => blackhole;
    Gain b => blackhole;
    Gain c => blackhole;
    Gain d => blackhole;

    0.9 => float exp;

    fun float vca(float in, float cv) {
        return in * Math.pow(Math.clampf(cv, 0.0, 1.0), exp);
    }

    fun float tick(float in)
    {
        Math.clampf(in, 0.0, 1.0) => float t;
        vca(t, t) => float t2;
        vca(t2, t) => float t3;

        1.0 - t => float tInv;
        vca(tInv, tInv) => float t2Inv;
        vca(t2Inv, tInv) => float t3Inv;

        vca(a.last(), t3Inv) => float compA;
        vca(b.last(), 3.0 * (t2Inv - t3Inv)) => float compB;
        vca(c.last(), 3.0 * (t2 - t3)) => float compC;
        vca(d.last(), t3) => float compD;

        return compA + compB + compC + compD;
    }
}
