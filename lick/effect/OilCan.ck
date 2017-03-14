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

public class OilCan extends LfoFeedback
{
    pre => Delay _shortTap => post;
    pre => Delay _longTap => post;
    feedbackOut => LPF _lpf => feedbackIn;

    // delay time for short tap, in Hz.
    float _timing;
    // balance between short and long taps
    float _balance;
    // interval between short and long taps
    float _width;
    // interval between delay and lfo
    float _follow;

    {
        800::ms => _shortTap.max;
        3200::ms => _longTap.max;

        3.0 => timing;
        0.6 => balance;
        0.8 => blend;
        0.5 => reverb;
        0.02 => viscosity;
        4.7 => width;
        9.3 => follow;
        10000.0 => cutoff;
        hyperLfo();

        spork ~ _updateAtSampleRate();
    }

    fun float timing()
    {
        return _timing;
    }

    fun float timing(float f)
    {
        f => _timing;
        return _timing;
    }

    fun float balance()
    {
        return _balance;
    }

    fun float balance(float f)
    {
        f => _balance;
        Constrain.constrainf(f, 0.0, 1.0) => _shortTap.gain;
        Constrain.constrainf(1.0 - f, 0.0, 1.0) => _longTap.gain;
        return _balance;
    }

    fun float blend()
    {
        return mix();
    }

    fun float blend(float f)
    {
        return mix(f);
    }

    fun float reverb()
    {
        return feedback();
    }

    fun float reverb(float f)
    {
        return feedback(f);
    }

    fun float viscosity()
    {
        return _lfo.depth();
    }

    fun float viscosity(float f)
    {
        return _lfo.depth(f);
    }

    fun float width()
    {
        return _width;
    }

    fun float width(float f)
    {
        f => _width;
        return _width;
    }

    fun float follow()
    {
        return _follow;
    }

    fun float follow(float f)
    {
        f => _follow;
        return _follow;
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

    fun void _updateAtSampleRate()
    {
        while (true)
        {
            _lfo.last() => float d;
            // modulate short tap delay via lfo
            1.0/(_timing + d) * 1::second => _shortTap.delay;
            // set long tap delay per interval and modulate via lfo
            1.0/(_timing * _width + d) * 1::second => _longTap.delay;
            // set lfo rate per interval
            _timing * _follow => _lfo.rate;

            1::samp => now;
        }
    }
}
