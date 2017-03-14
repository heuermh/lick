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

public class Overcome extends Effect
{
    EnvelopeFollower _env;
    AnalogDelay.create() @=> AnalogDelay _delay0;
    AnalogDelay.create() @=> AnalogDelay _delay1;
    AnalogDelay.create() @=> AnalogDelay _delay2;
    Gain _gate1;
    Gain _gate2;
    Gain _mix0;
    Gain _mix1;
    Gain _mix2;
    Gain _post;
    0.2 => float _trigger1;
    0.4 => float _trigger2;

    /*

      inlet --> env --> blackhole
        |
        |
        +-----> delay0 --> mix0 ----------> post --> wet
        |                                   ^ ^
        |                                   | |
        +-----> gate1 --> delay1 --> mix1 --+ |
        |                                     |
        |                                     |
        +-----> gate2 --> delay2 --> mix2 ----+

    */

    inlet => _env => blackhole;
    inlet => _delay0 => _mix0 => _post => wet;
    inlet => _gate1 => _delay1 => _mix1 => _post;
    inlet => _gate2 => _delay2 => _mix2 => _post;

    {
        1.0 => _delay0.mix;
        1.0 => _delay1.mix;
        1.0 => _delay2.mix;

        0.50 => _mix0.gain;
        0.30 => _mix1.gain;
        0.20 => _mix2.gain;

        0.0 => _gate1.gain;
        0.0 => _gate2.gain;

        2000::ms => max;
        800::ms => delay;

        spork ~ _updateAtRate();
    }

    fun dur delay()
    {
        return _delay0.delay();
    }

    fun dur delay(dur d)
    {
        d => _delay0.delay;
        d/2.0 => _delay1.delay;
        d/4.0 => _delay2.delay;
        return d;
    }

    fun dur max()
    {
        return _delay0.max();
    }

    fun dur max(dur d)
    {
        d => _delay0.max;
        d/2.0 => _delay1.max;
        d/4.0 => _delay2.max;
        return d;
    }

    fun float feedback()
    {
        return _delay0.feedback();
    }

    fun float feedback(float f)
    {
        f => _delay0.feedback;
        f => _delay1.feedback;
        f => _delay2.feedback;
        return f;
    }

    fun float trigger1()
    {
        return _trigger1;
    }

    fun float trigger1(float f)
    {
        f => _trigger1;
        return f;
    }

    fun float trigger2()
    {
        return _trigger2;
    }

    fun float trigger2(float f)
    {
        f => _trigger2;
        return f;
    }

    fun void _updateAtRate()
    {
        while (true)
        {
            _env.last() => float v;
            if (v > _trigger2)
            {
                v - _trigger2 => _gate2.gain;
                v - _trigger1 => _gate1.gain;
            }
            else if (v > _trigger1)
            {
                0.0 => _gate2.gain;
                v - _trigger1 => _gate1.gain;
            }
            else
            {
                0.0 => _gate2.gain;
                0.0 => _gate1.gain;
            }
            _env.rate() => now;
        }
    }

    fun static Overcome create()
    {
        Overcome overcome;
        return overcome;
    }

    fun static Overcome create(dur delay, float feedback, float trigger1, float trigger2)
    {
        Overcome overcome;
        delay => overcome.max;
        delay => overcome.delay;
        feedback => overcome.feedback;
        trigger1 => overcome.trigger1;
        trigger2 => overcome.trigger2;
        return overcome;
    }
}
