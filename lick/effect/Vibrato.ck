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

// needs work ;)
public class Vibrato extends LfoEffect
{ 
    DelayL _delay;

    2.0 => float _vibratoRate;

    inlet => _delay => wet;

    {
        sinLfo();
        4.0 => rate;
        0.5 => depth;

        1::second => _delay.max;
        1::second / _vibratoRate => _delay.delay;

        spork ~ _updateAtSampleRate();
    }

    fun float vibratoRate()
    {
        return _vibratoRate;
    }

    fun float vibratoRate(float f)
    {
        f => _vibratoRate;
        1::second / _vibratoRate => _delay.delay;
        return f;
    }

    fun void _updateAtSampleRate()
    {
        while (true)
        {
            _vibratoRate + ((_lfo.last() + 0.5) * _vibratoRate) => float v;
            if (v > 0.0)
            {
                Constrain.constraind(1::second / v, 1::samp, 1::second) => _delay.delay;
            }
            else
            {
                1::samp => _delay.delay;
            }
            1::samp => now;
        }
    }

    fun static Vibrato create()
    {
        Vibrato vibrato;
        return vibrato;
    }
}
