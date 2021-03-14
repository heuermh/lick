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
// similar to Infanem Small Echo Array, buy one here
//   http://www.infanem.com/small-echo-array/
//

public class EchoArray extends Effect
{
    Gain _pre;
    Gain _post;
    Gain _boost;
    Gain _feedback;  // doesn't extend Feedback as boost comes after
    AnalogDelay.create() @=> AnalogDelay _echo1;
    AnalogDelay.create() @=> AnalogDelay _echo2;
    AnalogDelay.create() @=> AnalogDelay _echo3;
    AnalogDelay.create() @=> AnalogDelay _echo4;

    0 => static int OFF;
    1 => static int ON;
    ON => int _echo1State;
    ON => int _echo2State;
    ON => int _echo3State;
    ON => int _echo4State;

    /*

      inlet --> _pre --> _echo1 --> _post --> _boost --> wet
                ^  |                 ^ |
                |  |                 | |
                |  +----> _echo2 ----+ |
                |  |                 | |
                |  +----> _echo3 ----+ |
                |  |                 | |
                |  +----> _echo4 ----+ |
                |                      |
                +------- feedback -----+
     */

    inlet => _pre;
    _pre => _echo1 => _post;
    _pre => _echo2 => _post;
    _pre => _echo3 => _post;
    _pre => _echo4 => _post;
    _post => _feedback => _pre;
    _post => _boost => wet;

    {
        600::ms => _echo1.max;
        30::ms => _echo1.delay;
        1.0 => _echo1.mix;
        0.0 => _echo1.feedback;

        1200::ms => _echo2.max;
        60::ms => _echo2.delay;
        1.0 => _echo2.mix;
        0.0 => _echo2.feedback;

        1800::ms => _echo2.max;
        90::ms => _echo2.delay;
        1.0 => _echo3.mix;
        0.0 => _echo3.feedback;

        2400::ms => _echo2.max;
        120::ms => _echo2.delay;
        1.0 => _echo4.mix;
        0.0 => _echo4.feedback;

        1.0 => boost;
        0.2 => feedback;
    }

    fun float boost()
    {
        return _boost.gain();
    }

    fun float boost(float f)
    {
        f => _boost.gain;
        return f;
    }

    fun dur delay()
    {
        return _echo1.delay();
    }

    fun dur delay(dur d)
    {
        d => _echo1.delay;
        2.0 * d => _echo2.delay;
        3.0 * d => _echo3.delay;
        4.0 * d => _echo4.delay;
        return d;
    }

    fun float feedback()
    {
        return _feedback.gain();
    }

    fun float feedback(float f)
    {
        f => _feedback.gain;
        return f;
    }

    fun void echo1On()
    {
        1.0 => _echo1.gain;
        ON => _echo1State;
    }

    fun void echo1Off()
    {
        0.0 => _echo1.gain;
        OFF => _echo1State;
    }

    fun void toggleEcho1()
    {
        if (_echo1State == ON)
        {
            echo1Off();
        }
        else
        {
            echo1On();
        }
    }

    fun void echo2On()
    {
        1.0 => _echo2.gain;
        ON => _echo2State;
    }

    fun void echo2Off()
    {
        0.0 => _echo2.gain;
        OFF => _echo2State;
    }

    fun void toggleEcho2()
    {
        if (_echo2State == ON)
        {
            echo2Off();
        }
        else
        {
            echo2On();
        }
    }

    fun void echo3On()
    {
        1.0 => _echo3.gain;
        ON => _echo3State;
    }

    fun void echo3Off()
    {
        0.0 => _echo3.gain;
        OFF => _echo3State;
    }

    fun void toggleEcho3()
    {
        if (_echo3State == ON)
        {
            echo3Off();
        }
        else
        {
            echo3On();
        }
    }

    fun void echo4On()
    {
        1.0 => _echo4.gain;
        ON => _echo4State;
    }

    fun void echo4Off()
    {
        0.0 => _echo4.gain;
        OFF => _echo4State;
    }

    fun void toggleEcho4()
    {
        if (_echo4State == ON)
        {
            echo4Off();
        }
        else
        {
            echo4On();
        }
    }

    fun static EchoArray create(dur delay)
    {
        EchoArray echoArray;
        delay => echoArray.delay;
        return echoArray;
    }

    fun static EchoArray create(dur delay, float boost)
    {
        EchoArray echoArray;
        delay => echoArray.delay;
        boost => echoArray.boost;
        return echoArray;
    }

    fun static EchoArray create(dur delay, float boost, float feedback)
    {
        EchoArray echoArray;
        delay => echoArray.delay;
        boost => echoArray.boost;
        feedback => echoArray.feedback;
        return echoArray;
    }
}
