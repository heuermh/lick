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
// inspired by EarthQuaker Devices Night Wire
// buy one here: http://earthquakerdevices.com/shop/Night%20Wire/cat/13097
//

public class Wire extends LfoFeedback
{
    CrossOver2 _crossOver;
    Gain _trem1;
    Gain _trem2;

    float _freq;
    Lfo _freqLfo;

    pre => _crossOver.in;
    _crossOver.out1 => _trem1 => post;
    _crossOver.out2 => _trem2 => post;
    feedbackOut => feedbackIn;
    _freqLfo => blackhole;

    {
        8800.0 => freq;
        0.1 => freqLfoRate;
        1.0 => freqLfoDepth;

        0.3 => rate;
        0.6 => depth;
        0.01 => feedback;

        hyperLfo();

        spork ~ _updateAtSampleRate();
    }

    fun float freq()
    {
        return _freq;
    }

    fun float freq(float f)
    {
        f => _freq;
        _freq => _crossOver.freq;
        return f;
    }

    fun float spread()
    {
        return _crossOver.spread();
    }

    fun float spread(float f)
    {
        return _crossOver.spread(f);
    }

    fun float Q()
    {
        return _crossOver.Q();
    }

    fun float Q(float f)
    {
        return _crossOver.Q(f);
    }

    fun float freqLfoDepth()
    {
        return _freqLfo.depth();
    }

    fun float freqLfoDepth(float f)
    {
        return _freqLfo.depth(f);
    }

    fun float freqLfoRate()
    {
        return _freqLfo.rate();
    }

    fun float freqLfoRate(float f)
    {
        return _freqLfo.rate(f);
    }

    fun void _updateAtSampleRate()
    {
        while (true)
        {
            1::samp => now;

            // update tremolo
            1.0 - _lfo.depth()/2.0 + _lfo.last()/2.0 => _trem1.gain;
            1.0 - _lfo.depth()/2.0 - _lfo.last()/2.0 => _trem2.gain;

            // update filter frequency
            _freq + _freqLfo.last() => _crossOver.freq;
        }
    }
}
