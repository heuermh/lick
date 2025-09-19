/*

    LiCK  Library for ChucK.
    Copyright (c) 2007-2025 held jointly by the individual authors.

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
// Ideas For Using Two Delay Pedals
// https://www.youtube.com/watch?v=LfxwJ0yZ1Vs
//

public class PhasingDelay extends LfoFeedback
{
    AnalogDelay _dark;
    DigitalDelay _bright;
    HPF _brightHpf;
    Gain _mix;
    Lfo _spreadLfo => blackhole;

    inlet => _dark => _mix;
    inlet => _bright => _brightHpf => _mix;
    _mix => wet;

    dur _delay;
    dur _max;
    dur _spread;

    {
        1.0f => _dark.mix;
        1.0f => _bright.mix;

        0.5f => _dark.gain;
        0.5f => _bright.gain;

        4000.0f => _dark.cutoff;
        4000.0f => _brightHpf.freq;

        2::second => max;
        200::ms => delay;
        10::ms => spread;

        0.01f => depth;
        0.5f => rate;

        0.5f => spreadLfoDepth;
        0.1f => spreadLfoRate;

        sinLfo();
        _spreadLfo.smoothSampleHold();
    }

    fun dur delay()
    {
        return _delay;
    }

    fun dur delay(dur d)
    {
        d => _delay;
        return d;
    }

    fun dur max()
    {
        return _max;
    }

    fun dur max(dur d)
    {
        d => _max;
        d => _dark.max;
        d + (2 * _spread) => _bright.max;
        return d;
    }

    fun dur spread()
    {
        return _spread;
    }

    fun dur spread(dur d)
    {
        d => _spread;
        _max + (2 * _spread) => _bright.max;
        return d;
    }

    fun float spreadLfoDepth()
    {
        return _spreadLfo.depth();
    }

    fun float spreadLfoDepth(float f)
    {
        f => _spreadLfo.depth;
        return f;
    }

    fun float spreadLfoRate()
    {
        return _spreadLfo.rate();
    }

    fun float spreadLfoRate(float f)
    {
        f => _spreadLfo.rate;
        return f;
    }

    fun float dark()
    {
        return _dark.gain();
    }

    fun float dark(float f)
    {
        f => _dark.gain;
        1.0f - f => _bright.gain;
        return f;
    }

    fun float bright()
    {
        return _bright.gain();
    }

    fun float bright(float f)
    {
        f => _bright.gain;
        1.0f - f => _dark.gain;
        return f;
    }

    fun void _updateAtSampleRate()
    {
        while (true)
        {
            1::samp => now;
            _delay + (_lfo.last() * _delay) => _dark.delay;
            _dark.delay() + (_spreadLfo.last() * _spread) => _bright.delay;
        }
    }
}
