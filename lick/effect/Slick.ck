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

// band pass filtered delay with smooth sample hold lfo
public class Slick extends LfoFeedback
{
    BPF _bpf;
    Delay _delay;

    inlet => _bpf => _delay => wet;
    feedbackOut => feedbackIn;

    {
        2000::ms => max;
        250::ms => delay;
        1200.0 => freq;
        0.25 => depth;
        0.25 => rate;
        0.80 => feedback;
        smoothSampleHoldLfo();
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

    fun float freq()
    {
        return _bpf.freq();
    }

    fun float freq(float f)
    {
        f => _bpf.freq;
        return f;
    }

    fun float resonance()
    {
        return _bpf.Q();
    }

    fun float resonance(float f)
    {
        f => _bpf.Q;
        return f;
    }

    fun void _updateAtSampleRate()
    {
        while (true)
        {
            1::samp => now;
            freq() + _lfo.last() * freq() => freq;
        }
    }

    fun static Slick create()
    {
        Slick slick;
        return slick;
    }

    fun static Slick create(dur delay, float freq)
    {
        Slick slick;
        delay => slick.delay;
        1.0::second/delay => slick.rate;
        freq => slick.freq;
        return slick;
    }

    fun static Slick create(dur delay, float freq, float depth)
    {
        Slick slick;
        delay => slick.delay;
        1.0::second/delay => slick.rate;
        freq => slick.freq;
        depth => slick.depth;
        return slick;
    }
}