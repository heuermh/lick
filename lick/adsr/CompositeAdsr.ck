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
// abstract ADSR composed from one or more ADSRs
//

public class CompositeAdsr extends AbstractAdsr
{
    ADSR @ _adsr;
    ArrayList adsrs;

    fun ADSR _nextAdsr()
    {
        // subclasses implement this
    }

    fun ADSR current()
    {
        return _adsr;
    }

    fun int keyOn(int i)
    {
        current().keyOn(i) => int rv;
        _nextAdsr();
        return rv;
    }

    fun int keyOff(int i)
    {
        return _adsr.keyOff(i);
    }

    fun dur attackTime()
    {
        return _adsr.attackTime();
    }

    fun dur attackTime(dur d)
    {
        return _adsr.attackTime(d);
    }

    fun float attackRate()
    {
        return _adsr.attackRate();
    }

    fun float attackRate(float f)
    {
        return _adsr.attackRate(f);
    }

    fun dur decayTime()
    {
        return _adsr.decayTime();
    }

    fun dur decayTime(dur d)
    {
        return _adsr.decayTime(d);
    }

    fun float decayRate()
    {
        return _adsr.decayRate();
    }

    fun float decayRate(float f)
    {
        return _adsr.decayRate(f);
    }

    fun float sustainLevel()
    {
        return _adsr.sustainLevel();
    }

    fun float sustainLevel(float f)
    {
        return _adsr.sustainLevel(f);
    }

    fun dur releaseTime()
    {
        return _adsr.releaseTime();
    }

    fun dur releaseTime(dur d)
    {
        return _adsr.releaseTime(d);
    }

    fun float releaseRate()
    {
        return _adsr.releaseRate();
    }

    fun float releaseRate(float f)
    {
        return _adsr.releaseRate(f);
    }

    fun int state()
    {
        return _adsr.state();
    }

    fun void set(dur a, dur d, float s, dur r)
    {
        _adsr.set(a, d, s, r);
    }

    fun void setAll(dur a, dur d, float s, dur r)
    {
        adsrs.iterator() @=> Iterator iterator;
        while (iterator.hasNext())
        {
            iterator.next() $ ADSR @=> ADSR adsr;
            adsr.set(a, d, s, r);
        }
    }
}