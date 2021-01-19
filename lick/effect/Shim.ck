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

public class Shim extends LfoFeedback
{
    Delay _delay;
    LPF _lpf;
    PRCRev _reverb;
    PitShift _pitchShift;

    pre => _delay => post;
    feedbackOut => _pitchShift => _lpf => _reverb => feedbackIn;

    {
        2.0 => _pitchShift.shift;
        10000.0 => _lpf.freq;
        0.6 => _reverb.mix;
        0.5 => rate;
        0.05 => depth;
        smoothSampleHoldLfo();

        600::ms => max;
        60::ms => delay;
        0.5 => feedback;
    }

    fun dur max()
    {
        return _delay.max();
    }

    fun dur max(dur d)
    {
        d => _delay.max;
        return d;
    }

    fun dur delay()
    {
        return _delay.delay();
    }

    fun dur delay(dur d)
    {
        d => _delay.delay;
        return d;
    }

    fun void _updateAtSampleRate()
    {
        while (true)
        {
            1::samp => now;
            delay() + _lfo.last() * delay() => delay;
        }
    }
}
