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

public class StereoFeedbackMachines
{
    fun static StereoFeedbackMachine fourMono(float f)
    {
        StereoFeedbackMachine fm;
        fm.feedback(f);
        return fm;
    }

    fun static StereoFeedbackMachine dualPingpong(float f)
    {
        StereoFeedbackMachine fm;
        fm.feedback(0.0);
        f => fm.route1Lto2L.gain;
        f => fm.route2Lto1L.gain;
        f => fm.route3Lto4L.gain;
        f => fm.route4Lto3L.gain;
        f => fm.route1Rto2R.gain;
        f => fm.route2Rto1R.gain;
        f => fm.route3Rto4R.gain;
        f => fm.route4Rto3R.gain;
        return fm;
    }

    fun static StereoFeedbackMachine quadPingpong(float f)
    {
        StereoFeedbackMachine fm;
        fm.feedback(0.0);
        f => fm.route1Lto2L.gain;
        f => fm.route2Lto3L.gain;
        f => fm.route3Lto4L.gain;
        f => fm.route1Rto2R.gain;
        f => fm.route2Rto3R.gain;
        f => fm.route3Rto4R.gain;
        fm.inputL =< fm.delay2.inputL;
        fm.inputL =< fm.delay3.inputL;
        fm.inputL =< fm.delay4.inputL;
        fm.inputR =< fm.delay2.inputR;
        fm.inputR =< fm.delay3.inputR;
        fm.inputR =< fm.delay4.inputR;
        return fm;
    }

    /*
    fun static StereoFeedbackMachine quadPermute(float f)
    {
    }
    */

    fun static StereoFeedbackMachine quadNetwork(float f)
    {
        StereoFeedbackMachine fm;
        fm.feedback(0.0);
        f => fm.route1Lto2L.gain;
        f => fm.route1Lto3L.gain;
        f => fm.route1Lto4L.gain;
        f => fm.route2Lto1L.gain;
        f => fm.route2Lto3L.gain;
        f => fm.route2Lto4L.gain;
        f => fm.route3Lto1L.gain;
        f => fm.route3Lto2L.gain;
        f => fm.route3Lto4L.gain;
        f => fm.route4Lto1L.gain;
        f => fm.route4Lto2L.gain;
        f => fm.route4Lto3L.gain;
        f => fm.route1Rto2R.gain;
        f => fm.route1Rto3R.gain;
        f => fm.route1Rto4R.gain;
        f => fm.route2Rto1R.gain;
        f => fm.route2Rto3R.gain;
        f => fm.route2Rto4R.gain;
        f => fm.route3Rto1R.gain;
        f => fm.route3Rto2R.gain;
        f => fm.route3Rto4R.gain;
        f => fm.route4Rto1R.gain;
        f => fm.route4Rto2R.gain;
        f => fm.route4Rto3R.gain;
        return fm;
    }

    fun static StereoFeedbackMachine oneTwoIntoThreeFour(float f)
    {
        StereoFeedbackMachine fm;
        fm.feedback(0.0);
        0.0 => fm.delay1.feedbackL.gain;
        0.0 => fm.delay2.feedbackL.gain;
        0.0 => fm.delay1.feedbackR.gain;
        0.0 => fm.delay2.feedbackR.gain;
        f => fm.delay3.feedbackL.gain;
        f => fm.delay4.feedbackL.gain;
        f => fm.delay3.feedbackR.gain;
        f => fm.delay4.feedbackR.gain;
        f => fm.route1Lto3L.gain;
        f => fm.route2Lto4L.gain;
        f => fm.route1Rto3R.gain;
        f => fm.route2Rto4R.gain;
        return fm;
    }

    fun static StereoFeedbackMachine cascade(float f)
    {
        StereoFeedbackMachine fm;
        fm.feedback(0.0);
        f => fm.route1Lto2L.gain;
        f => fm.route1Lto3L.gain;
        f => fm.route1Lto4L.gain;
        f => fm.route2Lto3L.gain;
        f => fm.route2Lto4L.gain;
        f => fm.route3Lto4L.gain;
        f => fm.route1Rto2R.gain;
        f => fm.route1Rto3R.gain;
        f => fm.route1Rto4R.gain;
        f => fm.route2Rto3R.gain;
        f => fm.route2Rto4R.gain;
        f => fm.route3Rto4R.gain;
        return fm;
    }

    fun static StereoFeedbackMachine sink(float f)
    {
        StereoFeedbackMachine fm;
        fm.feedback(0.0);
        f => fm.route1Lto4L.gain;
        f => fm.route2Lto4L.gain;
        f => fm.route3Lto4L.gain;
        f => fm.route1Rto4R.gain;
        f => fm.route2Rto4R.gain;
        f => fm.route3Rto4R.gain;
        f => fm.delay4.feedbackL.gain;
        f => fm.delay4.feedbackR.gain;
        return fm;
    }

    fun static StereoFeedbackMachine lambda(float f)
    {
        StereoFeedbackMachine fm;
        fm.feedback(0.0);
        f => fm.route1Lto2L.gain;
        f => fm.route2Lto3L.gain;
        f => fm.route2Lto4L.gain;
        f => fm.route1Rto2R.gain;
        f => fm.route2Rto3R.gain;
        f => fm.route2Rto4R.gain;
        f => fm.delay3.feedbackL.gain;
        f => fm.delay4.feedbackL.gain;
        f => fm.delay3.feedbackR.gain;
        f => fm.delay4.feedbackR.gain;
        return fm;
    }

    fun static StereoFeedbackMachine diamond(float f)
    {
        StereoFeedbackMachine fm;
        fm.feedback(0.0);
        f => fm.route1Lto2L.gain;
        f => fm.route1Lto3L.gain;
        f => fm.route2Lto4L.gain;
        f => fm.route3Lto4L.gain;
        f => fm.route1Rto2R.gain;
        f => fm.route1Rto3R.gain;
        f => fm.route2Rto4R.gain;
        f => fm.route3Rto4R.gain;
        f => fm.delay2.feedbackL.gain;
        f => fm.delay3.feedbackL.gain;
        f => fm.delay2.feedbackR.gain;
        f => fm.delay3.feedbackR.gain;
        return fm;
    }
}
