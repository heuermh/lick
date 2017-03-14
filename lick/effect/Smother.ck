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

// auto feedback attenuating analog style delay
public class Smother extends Feedback
{
    Delay _delay;
    LPF _lpf;
    Gain _attenuate;
    EnvelopeFollower _env;

    dur _rate;
    float _threshold;
    float _severity;

    time _last;
    float _source;
    float _target;
    0 => static int LIMITING;
    1 => static int RETURNING;
    RETURNING => int _status;

    pre => _delay => post;
    feedbackOut => _env => blackhole;
    feedbackOut => _attenuate => _lpf => feedbackIn;

    {
        80::ms => rate;
        1600::ms => max;
        800::ms => delay;
        20000.0 => cutoff;
        1.1 => feedback;
        1.0 => resonance;
        0.8 => threshold;
        1.0 => severity;

        spork ~ _updateAtRate();
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

    fun dur rate()
    {
        return _rate;
    }

    fun dur rate(dur d)
    {
        d => _rate;
        return d;
    }

    fun float threshold()
    {
        return _threshold;
    }

    fun float threshold(float f)
    {
        f => _threshold;
        return f;
    }

    fun float severity()
    {
        return _severity;
    }

    fun float severity(float f)
    {
        f => _severity;
        return f;
    }

    fun void _updateAtRate()
    {
        while (true)
        {
            if (_env.last() > _threshold)
            {
                LIMITING => _status;
                now => _last;
                _attenuate.gain() => _source;
                Constrain.constrainf(_source * (1.0 - _severity/10.0), 0.0, 1.0) => _target;

                if (_target > 0.0)
                {
                    <<<_env.last(), "limiting to", _target>>>;
                }
            }
            else
            {
                RETURNING => _status;
                now => _last;
                _attenuate.gain() => _source;
                Constrain.constrainf(_source * (1.0 + _severity/40.0), 0.0, 1.0) => _target;

                if (_target < 1.0)
                {
                   <<<_env.last(), "returning to", _target>>>;
                }
            }
            _rate => now;
        }
    }

    fun void _updateAtSampleRate()
    {
        while (true)
        {
            (now - _last)/_rate => float f;
            Interpolate.linear(f, 0.0, 1.0, _source, _target) => _attenuate.gain;
            1::samp => now;
        }
    }
}
