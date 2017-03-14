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

public class StereoFeedbackMachine
{
    Gain inputL;
    Gain inputR;
    Gain dryL;
    Gain dryR;
    Gain wetL;
    Gain wetR;

    Gain route1Lto2L;
    Gain route1Lto3L;
    Gain route1Lto4L;
    Gain route2Lto1L;
    Gain route2Lto3L;
    Gain route2Lto4L;
    Gain route3Lto1L;
    Gain route3Lto2L;
    Gain route3Lto4L;
    Gain route4Lto1L;
    Gain route4Lto2L;
    Gain route4Lto3L;

    Gain route1Rto2R;
    Gain route1Rto3R;
    Gain route1Rto4R;
    Gain route2Rto1R;
    Gain route2Rto3R;
    Gain route2Rto4R;
    Gain route3Rto1R;
    Gain route3Rto2R;
    Gain route3Rto4R;
    Gain route4Rto1R;
    Gain route4Rto2R;
    Gain route4Rto3R;

    StereoDelay delay1;
    StereoDelay delay2;
    StereoDelay delay3;
    StereoDelay delay4;

    // running by default
    true => int _running;

    {
        // setup left channel
        0.0 => route1Lto2L.gain;
        0.0 => route1Lto3L.gain;
        0.0 => route1Lto4L.gain;
        0.0 => route2Lto1L.gain;
        0.0 => route2Lto3L.gain;
        0.0 => route2Lto4L.gain;
        0.0 => route3Lto1L.gain;
        0.0 => route3Lto2L.gain;
        0.0 => route3Lto4L.gain;
        0.0 => route4Lto1L.gain;
        0.0 => route4Lto2L.gain;
        0.0 => route4Lto3L.gain;

        inputL => delay1.inputL;
        inputL => delay2.inputL;
        inputL => delay3.inputL;
        inputL => delay4.inputL;

        delay1.delayL => route1Lto2L => delay2.inputL;
        delay1.delayL => route1Lto3L => delay3.inputL;
        delay1.delayL => route1Lto4L => delay4.inputL;

        delay2.delayL => route2Lto1L => delay1.inputL;
        delay2.delayL => route2Lto3L => delay3.inputL;
        delay2.delayL => route2Lto4L => delay4.inputL;

        delay3.delayL => route3Lto1L => delay1.inputL;
        delay3.delayL => route3Lto2L => delay2.inputL;
        delay3.delayL => route3Lto4L => delay4.inputL;

        delay4.delayL => route4Lto1L => delay1.inputL;
        delay4.delayL => route4Lto2L => delay2.inputL;
        delay4.delayL => route4Lto3L => delay3.inputL;

        inputL => dryL;
        delay1.outputL => wetL;
        delay2.outputL => wetL;
        delay3.outputL => wetL;
        delay4.outputL => wetL;

        // setup right channel
        0.0 => route1Rto2R.gain;
        0.0 => route1Rto3R.gain;
        0.0 => route1Rto4R.gain;
        0.0 => route2Rto1R.gain;
        0.0 => route2Rto3R.gain;
        0.0 => route2Rto4R.gain;
        0.0 => route3Rto1R.gain;
        0.0 => route3Rto2R.gain;
        0.0 => route3Rto4R.gain;
        0.0 => route4Rto1R.gain;
        0.0 => route4Rto2R.gain;
        0.0 => route4Rto3R.gain;

        inputR => delay1.inputR;
        inputR => delay2.inputR;
        inputR => delay3.inputR;
        inputR => delay4.inputR;

        delay1.delayR => route1Rto2R => delay2.inputR;
        delay1.delayR => route1Rto3R => delay3.inputR;
        delay1.delayR => route1Rto4R => delay4.inputR;

        delay2.delayR => route2Rto1R => delay1.inputR;
        delay2.delayR => route2Rto3R => delay3.inputR;
        delay2.delayR => route2Rto4R => delay4.inputR;

        delay3.delayR => route3Rto1R => delay1.inputR;
        delay3.delayR => route3Rto2R => delay2.inputR;
        delay3.delayR => route3Rto4R => delay4.inputR;

        delay4.delayR => route4Rto1R => delay1.inputR;
        delay4.delayR => route4Rto2R => delay2.inputR;
        delay4.delayR => route4Rto3R => delay3.inputR;

        inputR => dryR;
        delay1.outputR => wetR;
        delay2.outputR => wetR;
        delay3.outputR => wetR;
        delay4.outputR => wetR;
    }

    fun void panic()
    {
        feedback(0.0);
        route(0.0);
    }

    fun void feedback(float f)
    {
        f => delay1.feedbackL.gain;
        f => delay2.feedbackL.gain;
        f => delay3.feedbackL.gain;
        f => delay4.feedbackL.gain;
        f => delay1.feedbackR.gain;
        f => delay2.feedbackR.gain;
        f => delay3.feedbackR.gain;
        f => delay4.feedbackR.gain;
    }

    fun void route(float f)
    {
        f => route1Lto2L.gain;
        f => route1Lto3L.gain;
        f => route1Lto4L.gain;
        f => route2Lto1L.gain;
        f => route2Lto3L.gain;
        f => route2Lto4L.gain;
        f => route3Lto1L.gain;
        f => route3Lto2L.gain;
        f => route3Lto4L.gain;
        f => route4Lto1L.gain;
        f => route4Lto2L.gain;
        f => route4Lto3L.gain;

        f => route1Rto2R.gain;
        f => route1Rto3R.gain;
        f => route1Rto4R.gain;
        f => route2Rto1R.gain;
        f => route2Rto3R.gain;
        f => route2Rto4R.gain;
        f => route3Rto1R.gain;
        f => route3Rto2R.gain;
        f => route3Rto4R.gain;
        f => route4Rto1R.gain;
        f => route4Rto2R.gain;
        f => route4Rto3R.gain;
    }

    fun void start()
    {
        if (!_running)
        {
            inputL =< delay1.inputL;
            inputL =< delay2.inputL;
            inputL =< delay3.inputL;
            inputL =< delay4.inputL;

            inputR => delay1.inputR;
            inputR => delay2.inputR;
            inputR => delay3.inputR;
            inputR => delay4.inputR;

            true => _running;
        }
    }

    fun void _stagger(dur wait)
    {
        wait => now;
        inputL => delay1.inputL;
        inputR => delay1.inputR;

        wait => now;
        inputL => delay2.inputL;
        inputR => delay2.inputR;

        wait => now;
        inputL => delay3.inputL;
        inputR => delay3.inputR;

        wait => now;
        inputL => delay4.inputL;
        inputR => delay4.inputR;
    }

    fun void staggeredStart(dur wait)
    {
        if (!_running)
        {
            //spork ~ _stagger(wait);
            _stagger(wait);
            true => _running;
        }
    }

    fun void stop()
    {
        if (_running)
        {
            inputL => delay1.inputL;
            inputL => delay2.inputL;
            inputL => delay3.inputL;
            inputL => delay4.inputL;

            inputR => delay1.inputR;
            inputR => delay2.inputR;
            inputR => delay3.inputR;
            inputR => delay4.inputR;

            false => _running;
        }
    }

    fun void toggle()
    {
        if (_running)
        {
            stop();
        }
        else
        {
            start();
        }
    }

    fun int running()
    {
        return _running;
    }
}
