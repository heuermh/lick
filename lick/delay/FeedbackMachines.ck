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

public class FeedbackMachines
{
    fun static FeedbackMachine fourMono(float f)
    {
        FeedbackMachine fm;
        fm.fourMono(f);
        return fm;
    }

    fun static FeedbackMachine fourMono(float f, dur d1, dur d2, dur d3, dur d4)
    {
        FeedbackMachine fm;
        fm.fourMono(f);
        fm.delay(d1, d2, d3, d4);
        return fm;
    }

    fun static FeedbackMachine dualPingpong(float f)
    {
        FeedbackMachine fm;
        fm.dualPingpong(f);
        return fm;
    }

    fun static FeedbackMachine dualPingpong(float f, dur d1, dur d2, dur d3, dur d4)
    {
        FeedbackMachine fm;
        fm.dualPingpong(f);
        fm.delay(d1, d2, d3, d4);
        return fm;
    }

    fun static FeedbackMachine quadPingpong(float f)
    {
        FeedbackMachine fm;
        fm.quadPingpong(f);
        return fm;
    }

    fun static FeedbackMachine quadPingpong(float f, dur d1, dur d2, dur d3, dur d4)
    {
        FeedbackMachine fm;
        fm.quadPingpong(f);
        fm.delay(d1, d2, d3, d4);
        return fm;
    }

    /*
    fun static FeedbackMachine quadPermute(float f)
    {
    }
    */

    fun static FeedbackMachine quadNetwork(float f)
    {
        FeedbackMachine fm;
        fm.quadNetwork(f);
        return fm;
    }

    fun static FeedbackMachine quadNetwork(float f, dur d1, dur d2, dur d3, dur d4)
    {
        FeedbackMachine fm;
        fm.quadNetwork(f);
        fm.delay(d1, d2, d3, d4);
        return fm;
    }

    fun static FeedbackMachine oneTwoIntoThreeFour(float f)
    {
        FeedbackMachine fm;
        fm.oneTwoIntoThreeFour(f);
        return fm;
    }

    fun static FeedbackMachine oneTwoIntoThreeFour(float f, dur d1, dur d2, dur d3, dur d4)
    {
        FeedbackMachine fm;
        fm.oneTwoIntoThreeFour(f);
        fm.delay(d1, d2, d3, d4);
        return fm;
    }

    fun static FeedbackMachine cascade(float f)
    {
        FeedbackMachine fm;
        fm.cascade(f);
        return fm;
    }

    fun static FeedbackMachine cascade(float f, dur d1, dur d2, dur d3, dur d4)
    {
        FeedbackMachine fm;
        fm.cascade(f);
        fm.delay(d1, d2, d3, d4);
        return fm;
    }

    fun static FeedbackMachine sink(float f)
    {
        FeedbackMachine fm;
        fm.sink(f);
        return fm;
    }

    fun static FeedbackMachine sink(float f, dur d1, dur d2, dur d3, dur d4)
    {
        FeedbackMachine fm;
        fm.sink(f);
        fm.delay(d1, d2, d3, d4);
        return fm;
    }

    fun static FeedbackMachine lambda(float f)
    {
        FeedbackMachine fm;
        fm.lambda(f);
        return fm;
    }

    fun static FeedbackMachine lambda(float f, dur d1, dur d2, dur d3, dur d4)
    {
        FeedbackMachine fm;
        fm.lambda(f);
        fm.delay(d1, d2, d3, d4);
        return fm;
    }

    fun static FeedbackMachine diamond(float f)
    {
        FeedbackMachine fm;
        fm.diamond(f);
        return fm;
    }

    fun static FeedbackMachine diamond(float f, dur d1, dur d2, dur d3, dur d4)
    {
        FeedbackMachine fm;
        fm.diamond(f);
        fm.delay(d1, d2, d3, d4);
        return fm;
    }
}
