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

public class PinkDelay extends Feedback
{
    Delay _delay;
    EnvelopeFollower _env;
    Noise _noise;
    Pke _pink;
    Gain _mix;
    LPF _lpf;

    pre => _delay => post;
    feedbackOut => _env => blackhole;
    feedbackOut => _mix => _lpf => feedbackIn;
    _noise => _pink => _mix;

    {
        0.0 => _noise.gain;
        1600::ms => max;
        800::ms => delay;
        0.9 => feedback;
        20000.0 => cutoff;
        1.0 => resonance;
        0.4 => pink;

        spork ~ _updateAtSampleRate();
    }

    fun dur delay()
    {
        return _delay.delay();
    }

    fun dur delay(dur d)
    {
        return _delay.delay(d);
    }

    fun dur max()
    {
        return _delay.max();
    }

    fun dur max(dur d)
    {
        return _delay.max(d);
    }

    fun float cutoff()
    {
        return _lpf.freq();
    }

    fun float cutoff(float f)
    {
        return _lpf.freq(f);
    }

    fun float resonance()
    {
        return _lpf.Q();
    }

    fun float resonance(float f)
    {
        return _lpf.Q(f);
    }

    fun float pink()
    {
        return _pink.gain();
    }

    fun float pink(float f)
    {
        f => _pink.gain;
        return f;
    }

    fun void _updateAtSampleRate()
    {
        while (true)
        {
            _env.last() => float f;
            f => _noise.gain;
            1::samp => now;
        }
    }
}
