/*

    LiCK  Library for ChucK.
    Copyright (c) 2007-2026 held jointly by the individual authors.

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

public class StereoInChorus6
{
    float _mix;
    float _lastMix;
    int _mode;
    int _lastMode;

    float _rate;
    float _depth;
    float _phase;

    0 => static int OFF;
    1 => static int I;
    2 => static int II;
    4 => static int III; // I + II
    8 => static int MANUAL;

    Gain inputL;
    Gain inputR;
    Gain outputL;
    Gain outputR;

    LPF preFilterL;
    Delay delayL;
    LPF postFilterL;
    Gain dryL;
    Gain wetL;

    LPF preFilterR;
    Delay delayR;
    LPF postFilterR;
    Gain dryR;
    Gain wetR;

    inputL => preFilterL => delayL => postFilterL => wetL => outputL;
    inputL => dryL => outputL;
    inputR => preFilterR => delayR => postFilterR => wetR => outputR;
    inputR => dryR => outputR;

    SinOsc sinLfoL => blackhole;
    SinOsc sinLfoR => blackhole;
    TriOsc triLfoL => blackhole;
    TriOsc triLfoR => blackhole;

    {
        200::ms => delayL.max;
        200::ms => delayR.max;

        10000.0f => preFilterL.freq;
        10000.0f => preFilterR.freq;

        10000.0f => postFilterL.freq;
        10000.0f => postFilterR.freq;

        0.435355f => _lastMix;
        OFF => _lastMode;

        0.435355f => mix;
        I => mode;

        spork ~ _updateAtSampleRate();
    }

    fun float mix()
    {
        return _mix;
    }

    fun float mix(float f)
    {
        _mix => _lastMix;
        f => _mix;
        f => wetL.gain;
        f => wetR.gain;
        1.0f - f => dryL.gain;
        1.0f - f => dryR.gain;
        return f;
    }

    fun int mode()
    {
        return _mode;
    }

    fun int mode(int i)
    {
        _mode => _lastMode;
        if (OFF == i)
        {
            0.0f => mix;
        }
        else
        {
            if (OFF == _lastMode)
            {
                _lastMix => mix;
            }
        }
        i => _mode;
        return i;
    }

    fun float rate()
    {
        return _rate;
    }

    fun float rate(float f)
    {
        f => _rate;
        return f;
    }

    fun float depth()
    {
        return _depth;
    }

    fun float depth(float f)
    {
        f => _depth;
        return f;
    }

    fun float phase()
    {
        return _phase;
    }

    fun float phase(float f)
    {
        f => _phase;
        return f;
    }

    fun void _updateAtSampleRate()
    {
        while (true)
        {
            1::samp => now;

            if (I == _mode)
            {
                // move elsewhere for performance
                0.4f => triLfoL.freq;
                0.4f => triLfoR.freq;
                0.0f => triLfoL.phase;
                0.5f => triLfoR.phase;
                0.00361f => triLfoL.gain;
                0.00389f => triLfoR.gain;

                (triLfoL.last() + 0.003345f) * 1::second => delayL.delay;
                (triLfoR.last() + 0.003345f) * 1::second => delayR.delay;
            }
            else if (II == _mode)
            {
                // move elsewhere for performance
                0.67f => triLfoL.freq;
                0.67f => triLfoR.freq;
                0.0f => triLfoL.phase;
                0.5f => triLfoR.phase;
                0.00361f => triLfoL.gain;
                0.00389f => triLfoR.gain;

                (triLfoL.last() + 0.003345f) * 1::second => delayL.delay;
                (triLfoR.last() + 0.003345f) * 1::second => delayR.delay;
            }
            else if (III == _mode)
            {
                // move elsewhere for performance
                8.06f => sinLfoL.freq;
                8.06f => sinLfoR.freq;
                0.0f => sinLfoL.phase;
                0.5f => sinLfoR.phase;
                0.00034f => sinLfoL.gain;
                0.00037f => sinLfoR.gain;

                (sinLfoL.last() + 0.00339f) * 1::second => delayL.delay;
                (sinLfoR.last() + 0.003465f) * 1::second => delayR.delay;
            }
            else if (MANUAL == _mode)
            {
                // move elsewhere for performance
                _rate => triLfoL.freq;
                _rate => triLfoR.freq;
                0.0f => triLfoL.phase;
                _phase => triLfoR.phase;
                _depth => triLfoL.gain;
                _depth => triLfoR.gain;

                (triLfoL.last() + 0.003345f) * 1::second => delayL.delay;
                (triLfoR.last() + 0.003345f) * 1::second => delayR.delay;
            }
        }
    }
}
