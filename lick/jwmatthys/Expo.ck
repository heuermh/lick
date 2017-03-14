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

// wrapper for ExpDelay chugin
//   see also https://github.com/jwmatthys/chugins/blob/master/ExpDelay/expdelay-help.ck
public class Expo extends Effect
{
    inlet => ExpDelay expo => wet;

    1.0 => expo.mix;

    fun dur max()
    {
        return expo.max();
    }

    fun dur max(dur d)
    {
        return expo.max(d);
    }

    fun dur delay()
    {
        return expo.delay();
    }

    fun dur delay(dur d)
    {
        return expo.delay(d);
    }

    fun int reps()
    {
        return expo.reps();
    }

    fun int reps(int i)
    {
        return expo.reps(i);
    }

    fun float durcurve()
    {
        return expo.durcurve();
    }

    fun float durcurve(float f)
    {
        return expo.durcurve(f);
    }

    fun float ampcurve()
    {
        return expo.ampcurve();
    }

    fun float ampcurve(float f)
    {
        return expo.ampcurve(f);
    }
}
