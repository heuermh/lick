/*

    LiCK  Library for ChucK.
    Copyright (c) 2007-2014 held jointly by the individual authors.

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
        fm.feedback(f);
        return fm;
    }

    fun static FeedbackMachine dualPingpong(float f)
    {
        FeedbackMachine fm;
        fm.feedback(0.0);
        f => fm.route1to2.gain;
        f => fm.route2to1.gain;
        f => fm.route3to4.gain;
        f => fm.route4to3.gain;
        return fm;
    }

    fun static FeedbackMachine quadPingpong(float f)
    {
        FeedbackMachine fm;
        fm.feedback(0.0);
        f => fm.route1to2.gain;
        f => fm.route2to3.gain;
        f => fm.route3to4.gain;
        fm.input =< fm.delay2.input;
        fm.input =< fm.delay3.input;
        fm.input =< fm.delay4.input;
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
        fm.feedback(0.0);
        f => fm.route1to2.gain;
        f => fm.route1to3.gain;
        f => fm.route1to4.gain;
        f => fm.route2to1.gain;
        f => fm.route2to3.gain;
        f => fm.route2to4.gain;
        f => fm.route3to1.gain;
        f => fm.route3to2.gain;
        f => fm.route3to4.gain;
        f => fm.route4to1.gain;
        f => fm.route4to2.gain;
        f => fm.route4to3.gain;
        return fm;
    }

    fun static FeedbackMachine oneTwoIntoThreeFour(float f)
    {
        FeedbackMachine fm;
        0.0 => fm.delay1.feedback.gain;
        0.0 => fm.delay2.feedback.gain;
        f => fm.delay3.feedback.gain;
        f => fm.delay4.feedback.gain;
        f => fm.route1to3.gain;
        f => fm.route2to4.gain;
        return fm;
    }

    fun static FeedbackMachine cascade(float f)
    {
        FeedbackMachine fm;
        fm.feedback(0.0);
        f => fm.route1to2.gain;
        f => fm.route1to3.gain;
        f => fm.route1to4.gain;
        f => fm.route2to3.gain;
        f => fm.route2to4.gain;
        f => fm.route3to4.gain;
        return fm;
    }

    fun static FeedbackMachine sink(float f)
    {
        FeedbackMachine fm;
        fm.feedback(0.0);
        f => fm.route1to4.gain;
        f => fm.route2to4.gain;
        f => fm.route3to4.gain;
        f => fm.delay4.feedback.gain;
        return fm;
    }

    fun static FeedbackMachine lambda(float f)
    {
        FeedbackMachine fm;
        fm.feedback(0.0);
        f => fm.route1to2.gain;
        f => fm.route2to3.gain;
        f => fm.route2to4.gain;
        f => fm.delay3.feedback.gain;
        f => fm.delay4.feedback.gain;
        return fm;
    }

    fun static FeedbackMachine diamond(float f)
    {
        FeedbackMachine fm;
        fm.feedback(0.0);
        f => fm.route1to2.gain;
        f => fm.route1to3.gain;
        f => fm.route2to4.gain;
        f => fm.route3to4.gain;
        f => fm.delay2.feedback.gain;
        f => fm.delay3.feedback.gain;
        return fm;
    }
}
