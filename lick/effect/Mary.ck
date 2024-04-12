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
// fixed-freq wah effect with LFO modulation
//

public class Mary extends LfoEffect
{
    float _freq;
    float _resonance;
    inlet => ResonZ _filter => wet;

    {
        1000.0 => freq;
        3.0 => resonance;

        0.01 => rate;
        0.005 => depth;
        smoothSampleHoldLfo();

        spork ~ _updateAtSampleRate();
    }

    fun float freq()
    {
        return _freq;
    }

    fun float freq(float f)
    {
        // see CryBaby.ck
        if (f < 460.0) {
             9.4 => resonance;
        }
        else if (f < 840.0) {
             Interpolate.linear(f, 460.0, 840.0, 9.4, 4.0) => resonance;
        }
        else if (f < 2250.0) {
             Interpolate.linear(f, 840.0, 2250.0, 4.0, 2.0) => resonance;
        }
        else {
             2.0 => resonance;
        }
        f => _freq;
        f => _filter.freq;
        return f;
    }

    fun float resonance()
    {
        return _resonance;
    }

    fun float resonance(float f)
    {
        f => _resonance;
        f => _filter.Q;
        return f;
    }

    fun void _updateAtSampleRate()
    {
        while (true)
        {
            1::samp => now;
            _freq + (_lfo.last() * _freq) => freq;
        }
    }

    fun static Mary create(float freq, float rate, float depth)
    {
        Mary mary;
        freq => mary.freq;
        rate => mary.rate;
        depth => mary.depth;
        return mary;
    }
}
