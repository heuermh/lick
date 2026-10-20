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

public class MonoInChorus6I
{
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

    TriOsc triLfoL => blackhole;
    TriOsc triLfoR => blackhole;

    {
        20::ms => delayL.max;
        20::ms => delayR.max;

        10000.0f => preFilterL.freq;
        10000.0f => preFilterR.freq;

        10000.0f => postFilterL.freq;
        10000.0f => postFilterR.freq;

        0.5646f => wetL.gain;
        0.5646f => wetR.gain;
        1.0 - 0.5646f => dryL.gain;
        1.0 - 0.5646f => dryR.gain;

        0.4f => triLfoL.freq;
        0.4f => triLfoR.freq;
        0.0f => triLfoL.phase;
        0.5f => triLfoR.phase;
        1.805f => triLfoL.gain;
        1.945f => triLfoR.gain;

        spork ~ _updateAtSampleRate();
    }

    fun void _updateAtSampleRate()
    {
        while (true)
        {
            1::samp => now;
            (triLfoL.last() + 3.345f) * 1::ms => delayL.delay;
            (triLfoR.last() + 3.345f) * 1::ms => delayR.delay;
        }
    }
}
