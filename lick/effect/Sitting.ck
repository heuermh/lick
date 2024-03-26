/*

    LiCK  Library for ChucK.
    Copyright (c) 2007-2024 held jointly by the individual authors.

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
// inspired by I was Sitting in a Room
// https://www.nonlinearcircuits.com/modules/p/sittinginaroom
//

public class Sitting extends LfoFeedback
{
    dur _delay;
    dur _fixedDelay;

    AnalogDelay delay1;
    AnalogDelay delay2;
    AnalogDelay delay3;
    AnalogDelay delay4;
    AnalogDelay delay5;
    AnalogDelay delay6;
    AnalogDelay delay7;
    AnalogDelay delay8;
    AnalogDelay delay9;

    pre => delay1 => delay2 => delay3 => delay4 => delay5 => delay6 => delay7 => delay8 => delay9 => post;

    Gain feedback2;
    Gain feedback3;
    Gain feedback4;
    Gain feedback5;
    Gain feedback6;
    Gain feedback7;
    Gain feedback8;

    delay2 => feedback2 => pre;
    delay3 => feedback3 => pre;
    delay4 => feedback4 => pre;
    delay5 => feedback5 => pre;
    delay6 => feedback6 => pre;
    delay7 => feedback7 => pre;
    delay8 => feedback8 => pre;

    {
        131::ms => delay;
        71::ms => fixedDelay;

        0.6 => feedback;
        0.0 => internalFeedback;

        // or add floats for each?
        0.8 => feedback6.gain;

        smoothSampleHoldLfo();
        0.01 => rate;
        0.01 => depth;
    }

    fun dur delay()
    {
        return _delay;
    }

    fun dur delay(dur d)
    {
        d => _delay;

        if (d > delay1.max())
        {
            d => delay1.max;
        }
        d => delay1.delay;
        return d;
    }

    fun dur fixedDelay()
    {
        return _fixedDelay;
    }

    fun dur fixedDelay(dur d)
    {
        d => _fixedDelay;
        if (d > delay2.max())
        {
            d => delay2.max;
            d => delay3.max;
            d => delay4.max;
            d => delay5.max;
            d => delay6.max;
            d => delay7.max;
            d => delay8.max;
        }
        d => delay2.delay;
        d => delay3.delay;
        d => delay4.delay;
        d => delay5.delay;
        d => delay6.delay;
        d => delay7.delay;
        d => delay8.delay;
        d => delay9.delay;
        return d;
    }

    fun void panic()
    {
        0.0 => feedback;
        0.0 => internalFeedback;
    }

    fun float internalFeedback(float f)
    {
        f => feedback2.gain;
        f => feedback3.gain;
        f => feedback4.gain;
        f => feedback5.gain;
        f => feedback6.gain;
        f => feedback7.gain;
        f => feedback8.gain;
        return f;
    }

    fun float oddInternalFeedback(float f)
    {
        f => feedback3.gain;
        f => feedback5.gain;
        f => feedback7.gain;
        return f;
    }

    fun float evenInternalFeedback(float f)
    {
        f => feedback2.gain;
        f => feedback4.gain;
        f => feedback6.gain;
        f => feedback8.gain;
        return f;
    }

    fun void _updateAtSampleRate()
    {
        while (true)
        {
            _lfo.last() => float d;
            _delay + (d * _delay) => delay;
            1::samp => now;
        }
    }

    fun static Sitting create()
    {
        Sitting sitting;
        return sitting;
    }

    fun static Sitting create(dur delay, dur fixedDelay)
    {
        Sitting sitting;
        delay => sitting.delay;
        fixedDelay => sitting.fixedDelay;
        return sitting;
    }

    fun static Sitting create(dur delay, dur fixedDelay, float feedback, float evenInternalFeedback, float oddInternalFeedback)
    {
        Sitting sitting;
        delay => sitting.delay;
        fixedDelay => sitting.fixedDelay;
        feedback => sitting.feedback;
        evenInternalFeedback => sitting.evenInternalFeedback;
        oddInternalFeedback => sitting.oddInternalFeedback;
        return sitting;
    }
}
