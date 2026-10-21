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

public class MonoInChorus60
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

    Gain input;
    Gain outputL;
    Gain outputR;

    Gain inputL;
    LPF preFilterL;
    DelayL delayL;
    LPF postFilterL;
    Gain dryL;
    Gain wetL;

    Gain inputR;
    LPF preFilterR;
    DelayL delayR;
    LPF postFilterR;
    Gain dryR;
    Gain wetR;

    input => inputL => preFilterL => delayL => postFilterL => wetL => outputL;
    inputL => dryL => outputL;

    input => inputR => preFilterR => delayR => postFilterR => wetR => outputR;
    inputR => dryR => outputR;

    SinOsc sinLfoL => blackhole;
    SinOsc sinLfoR => blackhole;
    TriOsc triLfoL => blackhole;
    TriOsc triLfoR => blackhole;

    {
        20::ms => delayL.max;
        20::ms => delayR.max;

        10000.0f => preFilterL.freq;
        10000.0f => preFilterR.freq;

        10000.0f => postFilterL.freq;
        10000.0f => postFilterR.freq;

        0.5646f => _lastMix;
        OFF => _lastMode;

        0.5646f => mix;
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

        // update mix
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

        // update other parameters
        if (I == i)
        {
            0.513f => triLfoL.freq;
            0.513f => triLfoR.freq;
            0.0f => triLfoL.phase;
            0.5f => triLfoR.phase;
            1.805f => triLfoL.gain;
            1.945f => triLfoR.gain;
        }
        else if (II == i)
        {
            0.863f => triLfoL.freq;
            0.863f => triLfoR.freq;
            0.0f => triLfoL.phase;
            0.5f => triLfoR.phase;
            1.805f => triLfoL.gain;
            1.945f => triLfoR.gain;
        }
        else if (III == i)
        {
            9.75f => sinLfoL.freq;
            9.75f => sinLfoR.freq;
            0.0f => sinLfoL.phase;
            0.5f => sinLfoR.phase;
            0.170f => sinLfoL.gain;
            0.185f => sinLfoR.gain;
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
        if (MANUAL == _mode)
        {
            f => triLfoL.freq;
            f => triLfoR.freq;
        }
        return f;
    }

    fun float depth()
    {
        return _depth;
    }

    fun float depth(float f)
    {
        f => _depth;
        if (MANUAL == _mode)
        {
            _depth => triLfoL.gain;
            _depth => triLfoR.gain;
        }
        return f;
    }

    fun float phase()
    {
        return _phase;
    }

    fun float phase(float f)
    {
        f => _phase;
        if (MANUAL == _mode)
        {
            0.0f => triLfoL.phase;
            f => triLfoR.phase;
        }
        return f;
    }

    fun void _updateAtSampleRate()
    {
        while (true)
        {
            1::samp => now;

            if (I == _mode || II == _mode || MANUAL == _mode)
            {
                (triLfoL.last() + 3.345f) * 1::ms => delayL.delay;
                (triLfoR.last() + 3.345f) * 1::ms => delayR.delay;
            }
            else if (III == _mode)
            {
                (sinLfoL.last() + 3.390f) * 1::ms => delayL.delay;
                (sinLfoR.last() + 3.465f) * 1::ms => delayR.delay;
            }
        }
    }
}
