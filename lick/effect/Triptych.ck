/*

    LiCK  Library for ChucK.
    Copyright (c) 2007-2021 held jointly by the individual authors.

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
// inspired by DelayNoMore3
// https://www.muffwiggler.com/forum/viewtopic.php?p=3052908#3052908
//

public class Triptych extends Effect
{
    DigitalDelay _stage1;
    DigitalDelay _stage2;
    DigitalDelay _stage3;
    Gain _feedbackToStage1;
    Gain _feedbackToStage2;

    /*
       inlet --> _stage1 --> _stage2 ---> _stage3 --> wet
                  ^   |^      ^    ||^      ^   ||
                  ---- |      -----||      -----||
                  fdbk |      fdbk ||      fdbk  |
                       |           ||            |
                       |----------- |            |
                         2->1 fdbk  |            |
                                    |            |
                                    -------------
                                       3->2 fbdk
     */

     inlet => _stage1 => _stage2 => _stage3 => wet;
     _stage2 => _feedbackToStage1 => _stage1;
     _stage3 => _feedbackToStage2 => _stage2;

     {
        1::second => stage1Max;
        1::second => stage2Max;
        1::second => stage3Max;

        33::ms => stage1Delay;
        71::ms => stage2Delay;
        119::ms => stage3Delay;

        0.1 => stage1Feedback;
        0.2 => stage2Feedback;
        0.4 => stage3Feedback;

        0.3 => feedbackToStage1;
        0.5 => feedbackToStage2;
    }

    fun dur stage1Max()
    {
        return _stage1.max();
    }

    fun dur stage1Max(dur d)
    {
        return _stage1.max(d);
    }

    fun dur stage1Delay()
    {
        return _stage1.delay();
    }

    fun dur stage1Delay(dur d)
    {
        return _stage1.delay(d);
    }

    fun float stage1Feedback()
    {
        return _stage1.feedback();
    }

    fun float stage1Feedback(float f)
    {
        return _stage1.feedback(f);
    }


    fun dur stage2Max()
    {
        return _stage2.max();
    }

    fun dur stage2Max(dur d)
    {
        return _stage2.max(d);
    }

    fun dur stage2Delay()
    {
        return _stage2.delay();
    }

    fun dur stage2Delay(dur d)
    {
        return _stage2.delay(d);
    }

    fun float stage2Feedback()
    {
        return _stage2.feedback();
    }

    fun float stage2Feedback(float f)
    {
        return _stage2.feedback(f);
    }


    fun dur stage3Max()
    {
        return _stage3.max();
    }

    fun dur stage3Max(dur d)
    {
        return _stage3.max(d);
    }

    fun dur stage3Delay()
    {
        return _stage3.delay();
    }

    fun dur stage3Delay(dur d)
    {
        return _stage3.delay(d);
    }

    fun float stage3Feedback()
    {
        return _stage3.feedback();
    }

    fun float stage3Feedback(float f)
    {
        return _stage3.feedback(f);
    }


    fun float feedbackToStage1()
    {
        return _feedbackToStage1.gain();
    }

    fun float feedbackToStage1(float f)
    {
        f => _feedbackToStage1.gain;
        return f;
    }

    fun float feedbackToStage2()
    {
        return _feedbackToStage2.gain();
    }

    fun float feedbackToStage2(float f)
    {
        f => _feedbackToStage2.gain;
        return f;
    }


    fun static Triptych create()
    {
        Triptych triptych;
        return triptych;
    }

    fun static Triptych create(dur stage1Delay, dur stage2Delay, dur stage3Delay)
    {
        Triptych triptych;

        if (triptych.stage1Max() < stage1Delay)
        {
            stage1Delay => triptych.stage1Max;
        }
        stage1Delay => triptych.stage1Delay;

        if (triptych.stage2Max() < stage2Delay)
        {
            stage2Delay => triptych.stage2Max;
        }
        stage2Delay => triptych.stage2Delay;

        if (triptych.stage3Max() < stage3Delay)
        {
            stage3Delay => triptych.stage3Max;
        }
        stage3Delay => triptych.stage3Delay;

        return triptych;
    }
}
