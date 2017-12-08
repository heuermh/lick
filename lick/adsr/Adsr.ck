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
// ADSR adapted to an integer procedure
//

public class Adsr extends AbstractAdsr
{
    ADSR adsr;

    fun int keyOn(int i)
    {
        return adsr.keyOn(i);
    }

    fun int keyOff(int i)
    {
        return adsr.keyOff(i);
    }

    fun dur attackTime()
    {
        return adsr.attackTime();
    }

    fun dur attackTime(dur d)
    {
        return adsr.attackTime(d);
    }

    fun float attackRate()
    {
        return adsr.attackRate();
    }

    fun float attackRate(float f)
    {
        return adsr.attackRate(f);
    }

    fun dur decayTime()
    {
        return adsr.decayTime();
    }

    fun dur decayTime(dur d)
    {
        return adsr.decayTime(d);
    }

    fun float decayRate()
    {
        return adsr.decayRate();
    }

    fun float decayRate(float f)
    {
        return adsr.decayRate(f);
    }

    fun float sustainLevel()
    {
        return adsr.sustainLevel();
    }

    fun float sustainLevel(float f)
    {
        return adsr.sustainLevel(f);
    }

    fun dur releaseTime()
    {
        return adsr.releaseTime();
    }

    fun dur releaseTime(dur d)
    {
        return adsr.releaseTime(d);
    }

    fun float releaseRate()
    {
        return adsr.releaseRate();
    }

    fun float releaseRate(float f)
    {
        return adsr.releaseRate(f);
    }

    fun int state()
    {
        return adsr.state();
    }

    fun void set(dur a, dur d, float s, dur r)
    {
        adsr.set(a, d, s, r);
    }
}
