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

//
// similar to Marshall Time Modulator, http://electro-music.com/forum/topic-19408-0.html
//

public class TimeModulator extends Effect
{
    Delay _a;
    Delay _b; // 2x delay time of A
    Delay _c; // 4x delay time of A
    Gain _feedback;
    Lfo _lfo;

    400::ms => dur _d;

    /*

                +---------+
                |         |
               \./        |
        in ---> A ---> feedback ---> wet
                |       ^    ^
                |       |    |
                +-----> B    |
                |      (2x)  |
                |            |
                +----------> C
                            (4x)

    */

    {
        inlet => _a => _feedback => wet;
        _a => _b => _feedback;
        _a => _c => _feedback;
        _feedback => _a;

        1::second => max;
        _d => delay;
        0.90 => mix;
        0.96 => feedback;
        0.70 => a;
        0.20 => b;
        0.10 => c;
        0.20 => _lfo.rate;
        0.05 => _lfo.depth;

        spork ~ _updateAtSampleRate();
    }

    fun dur delay()
    {
        return _d;
    }

    fun dur delay(dur d)
    {
        d => _d;
        _updateDelay(d);
        return d;
    }

    fun dur max()
    {
        return _a.max();
    }

    fun dur max(dur d)
    {
        d => _a.max;
        2.0 * d => _b.max;
        4.0 * d => _b.max;
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

    fun float a()
    {
        return _a.gain();
    }

    fun float a(float f)
    {
        f => _a.gain;
        return f;
    }

    fun float b()
    {
        return _b.gain();
    }

    fun float b(float f)
    {
        f => _b.gain;
        return f;
    }

    fun float c()
    {
        return _c.gain();
    }

    fun float c(float f)
    {
        f => _c.gain;
        return f;
    }

    fun void _updateDelay(dur d)
    {
        d => _a.delay;
        2.0 * d => _b.delay;
        4.0 * d => _b.delay;
    }

    fun void _updateAtSampleRate()
    {
        while (true)
        {
            1::samp => now;
            _updateDelay(_d + (_lfo.last() * _d));
        }
    }

    fun static TimeModulator create()
    {
        TimeModulator timeModulator;
        return timeModulator;
    }

    fun static TimeModulator create(dur delay, float feedback)
    {
        TimeModulator timeModulator;
        delay => timeModulator.max;
        delay => timeModulator.delay;
        feedback => timeModulator.feedback;
        return timeModulator;
    }
}
