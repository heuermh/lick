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
// abstract class that looks like an ADSR
//

public class AbstractAdsr extends IntProcedure
{
    float _attackRate;
    float _decayRate;
    float _sustainLevel;
    float _releaseRate;

    0 => static int ATTACK;
    1 => static int DECAY;
    2 => static int SUSTAIN;
    3 => static int RELEASE;
    4 => static int DONE;
    DONE => int _state;

    fun void run(int arg)
    {
        keyOn(arg);
    }

    fun int keyOn(int i)
    {
        return i;
    }

    fun int keyOff(int i)
    {
        return i;
    }

    fun dur attackTime()
    {
        return 1::second / _attackRate;
    }

    fun dur attackTime(dur d)
    {
        d / 1::second => _attackRate;
        return d;
    }

    fun float attackRate()
    {
        return _attackRate;
    }

    fun float attackRate(float f)
    {
        f => _attackRate;
        return _attackRate;
    }

    fun dur decayTime()
    {
        return 1::second / _decayRate;
    }

    fun dur decayTime(dur d)
    {
        d / 1::second => _decayRate;
        return d;
    }

    fun float decayRate()
    {
        return _decayRate;
    }

    fun float decayRate(float f)
    {
        f => _decayRate;
        return _decayRate;
    }

    fun float sustainLevel()
    {
        return _sustainLevel;
    }

    fun float sustainLevel(float f)
    {
        f => _sustainLevel;
        return _sustainLevel;
    }

    fun dur releaseTime()
    {
        return 1::second / _releaseRate;
    }

    fun dur releaseTime(dur d)
    {
        d / 1::second => _releaseRate;
        return d;
    }

    fun float releaseRate()
    {
        return _releaseRate;
    }

    fun float releaseRate(float f)
    {
        f => _releaseRate;
        return _releaseRate;
    }

    fun int state()
    {
        return _state;
    }

    fun void set(dur a, dur d, float s, dur r)
    {
        attackTime(a);
        decayTime(d);
        sustainLevel(s);
        releaseTime(r);
    }
}
