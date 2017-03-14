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

class SleepProcedure extends Procedure
{
    Sleep @ sleep;

    fun void run()
    {
        sleep.sleep();
    }
}

class SleepIntProcedure extends IntProcedure
{
    Sleep @ sleep;

    fun void run(int n)
    {
        sleep.value => dur oldValue;
        sleep.value * n => sleep.value;
        sleep.sleep();
        oldValue => sleep.value;
    }
}

class SleepFloatProcedure extends FloatProcedure
{
    Sleep @ sleep;

    fun void run(float f)
    {
        sleep.value => dur oldValue;
        sleep.value * f => sleep.value;
        sleep.sleep();
        oldValue => sleep.value;
    }
}

public class Sleep
//  implements Procedure, IntProcedure, FloatProcedure
{
    0::ms => dur value;

    // hack to simulate multiple inheritance
    SleepProcedure _procedure;
    SleepIntProcedure _intProcedure;
    SleepFloatProcedure _floatProcedure;

    {
        this @=> _procedure.sleep;
        this @=> _intProcedure.sleep;
        this @=> _floatProcedure.sleep;
    }

    fun void sleep()
    {
        value => now;
    }

    fun Procedure asProcedure()
    {
        return _procedure;
    }

    fun IntProcedure asIntProcedure()
    {
        return _intProcedure;
    }

    fun FloatProcedure asFloatProcedure()
    {
        return _floatProcedure;
    }
}
