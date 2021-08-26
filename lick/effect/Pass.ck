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

//
// inspired by pass mode in the Sunlight Reverb, buy one here
// https://www.oldbloodnoise.com/pedals/sunlight
//

public class Pass extends LfoFeedback
{
    Hall initialReverb;
    Hall filteredReverb;
    BPF bpf;

    float _freq;
    float _resonance;

    pre => initialReverb => bpf => filteredReverb => post;
    feedbackOut => feedbackIn;

    {
        0.4 => feedback;

        880.0 => freq;
        1.0 => resonance;

        0.6 => depth;
        0.6 => rate;

        smoothSampleHoldLfo();
    }

    fun float freq()
    {
        return bpf.freq();
    }

    fun float freq(float f)
    {
        f => _freq;
        f => bpf.freq;
        return f;
    }

    fun float resonance()
    {
        return bpf.Q();
    }

    fun float resonance(float f)
    {
        f => _resonance;
        f => bpf.Q;
        return f;
    }

    fun void _updateAtSampleRate()
    {
        while (true)
        {
            1::samp => now;
            // todo: consider expo for freq
            Constrain.constrainf(_freq + (_freq * _lfo.last()), 30.0, 30000.0) => bpf.freq;
        }
    }
}