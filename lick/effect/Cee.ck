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
// Similar to BOSS Dimension C
// http://www.birthofasynth.com/Scott_Stites/Images/DimC/dimc_block1.jpg
//

public class Cee extends Feedback
{
    Delay _delay1;
    Delay _delay2;
    LPF _lpf1;
    LPF _lpf2;
    Lfo _lfo1;
    Lfo _lfo2;
    float _rate;
    float _depth;
    float _cutoff;
    float _resonance;
    dur _delay;
    dur _max;

    0 => static int LFO;
    1 => static int DELAY;
    LFO => int _mode;

    pre => _delay1 => _lpf1 => post;
    pre => _delay2 => _lpf2 => post;
    _lfo1 => blackhole;
    _lfo2 => blackhole;
    feedbackOut => feedbackIn;

    {
        _lfo1.hyper();
        _lfo2.hyper();
        0.0 => _lfo1.phase;
        1.0 => _lfo2.phase;

        40::ms => max;
        20::ms => delay;
        0.5 => rate;
        0.04 => depth;
        10000.0 => cutoff;
        0.5 => resonance;
        0.5 => mix;
        0.0 => feedback;

        spork ~ _updateAtSampleRate();
    }

    fun float rate()
    {
        return _rate;
    }

    fun float rate(float f)
    {
        f => _rate;
        _rate => _lfo1.rate;
        _rate => _lfo2.rate;
        return _rate;
    }

    fun float depth()
    {
        return _depth;
    }

    fun float depth(float f)
    {
        f => _depth;
        _depth => _lfo1.depth;
        _depth => _lfo2.depth;
        return _depth;
    }

    fun dur delay()
    {
        return _delay;
    }

    fun dur delay(dur d)
    {
        d => _delay;
        return _delay;
    }

    fun float cutoff()
    {
        return _cutoff;
    }

    fun float cutoff(float f)
    {
        f => _cutoff;
        _cutoff => _lpf1.freq;
        _cutoff => _lpf2.freq;
        return _cutoff;
    }

    fun float resonance()
    {
        return _resonance;
    }

    fun float resonance(float f)
    {
        f => _resonance;
        _resonance => _lpf1.Q;
        _resonance => _lpf2.Q;
        return _resonance;
    }

    fun dur max()
    {
        return _max;
    }

    fun dur max(dur d)
    {
        d => _max;
        return _max;
    }

    fun void _updateAtSampleRate()
    {
        while (true)
        {
            if (_mode == LFO)
            {
                _max/2.0 => dur mid;
                mid + (mid * _lfo1.last()) => _delay1.delay;
                mid + (mid * _lfo2.last()) => _delay2.delay;
            }
            else
            {
                if (_delay1.max() < _max)
                {
                    _max => _delay1.max;
                }
                if (_delay2.max() < _max)
                {
                    _max => _delay2.max;
                } 
                _delay => _delay1.delay;
                _delay => _delay2.delay;
            }
            1::samp => now;
        }
    }
}
