/*

    LiCK  Library for ChucK.
    Copyright (c) 2007-2012 held jointly by the individual authors.

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

public class FeedbackMachineA
{
    Gain input;
    Gain dry;
    Gain wet;

    Gain route1to2;
    Gain route1to3;
    Gain route1to4;
    Gain route2to1;
    Gain route2to3;
    Gain route2to4;
    Gain route3to1;
    Gain route3to2;
    Gain route3to4;
    Gain route4to1;
    Gain route4to2;
    Gain route4to3;

    MonoDelayA delay1;
    MonoDelayA delay2;
    MonoDelayA delay3;
    MonoDelayA delay4;

    // running by default
    true => int running;

    {
        0.0 => route1to2.gain;
        0.0 => route1to3.gain;
        0.0 => route1to4.gain;
        0.0 => route2to1.gain;
        0.0 => route2to3.gain;
        0.0 => route2to4.gain;
        0.0 => route3to1.gain;
        0.0 => route3to2.gain;
        0.0 => route3to4.gain;
        0.0 => route4to1.gain;
        0.0 => route4to2.gain;
        0.0 => route4to3.gain;

        input => delay1.input;
        input => delay2.input;
        input => delay3.input;
        input => delay4.input;

        delay1.delay => route1to2 => delay2.input;
        delay1.delay => route1to3 => delay3.input;
        delay1.delay => route1to4 => delay4.input;

        delay2.delay => route2to1 => delay1.input;
        delay2.delay => route2to3 => delay3.input;
        delay2.delay => route2to4 => delay4.input;

        delay3.delay => route3to1 => delay1.input;
        delay3.delay => route3to2 => delay2.input;
        delay3.delay => route3to4 => delay4.input;

        delay4.delay => route4to1 => delay1.input;
        delay4.delay => route4to2 => delay2.input;
        delay4.delay => route4to3 => delay3.input;

        input => dry;
        delay1.output => wet;
        delay2.output => wet;
        delay3.output => wet;
        delay4.output => wet;
    }

    fun void panic()
    {
        feedback(0.0);
        route(0.0);
    }

    fun void feedback(float f)
    {
        f => delay1.feedback.gain;
        f => delay2.feedback.gain;
        f => delay3.feedback.gain;
        f => delay4.feedback.gain;
    }

    fun void route(float f)
    {
        f => route1to2.gain;
        f => route1to3.gain;
        f => route1to4.gain;
        f => route2to1.gain;
        f => route2to3.gain;
        f => route2to4.gain;
        f => route3to1.gain;
        f => route3to2.gain;
        f => route3to4.gain;
        f => route4to1.gain;
        f => route4to2.gain;
        f => route4to3.gain;
    }

    fun void start()
    {
        if (!running)
        {
            input => delay1.input;
            input => delay2.input;
            input => delay3.input;
            input => delay4.input;
            true => running;
        }
    }

    fun void _stagger(dur wait)
    {
        wait => now;
        input => delay1.input;

        wait => now;
        input => delay2.input;

        wait => now;
        input => delay3.input;

        wait => now;
        input => delay4.input;
    }

    fun void staggeredStart(dur wait)
    {
        if (!running)
        {
            spork ~ _stagger(wait);
        }
    }

    fun void stop()
    {
        if (running)
        {
            input =< delay1.input;
            input =< delay2.input;
            input =< delay3.input;
            input =< delay4.input;
            false => running;
        }
    }

    fun void toggle()
    {
        if (running)
        {
            stop();
        }
        else
        {
            start();
        }
    }
}