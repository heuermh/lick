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

public class Flutter extends Effect
{
    0.0 => float _rate;
    0.0 => float _depth;
    0.0 => float _tone;

    SinOsc lfo0 => blackhole;
    SinOsc lfo1 => blackhole;
    SinOsc lfo2 => blackhole;
    SinOsc lfo3 => blackhole;

    inlet => LPF lpf;

    lpf => PitShift shift0 => wet;
    lpf => PitShift shift1 => wet;
    lpf => PitShift shift2 => wet;
    lpf => PitShift shift3 => wet;

    {
        0.1 => rate;
        0.1 => depth;
        0.1 => tone;

        spork ~ _update();
    }

    fun float rate()
    {
        return _rate;
    }

    fun float rate(float f)
    {
        f => _rate;

        Interpolate.linear(f, 0.0, 1.0, 0.001, 0.1) @=> float r;
        r => lfo0.freq;
        r + r/9.0 => lfo1.freq;
        r + r/5.0 => lfo2.freq;
        r + r/3.0 => lfo3.freq;

        return _rate;
    }

    fun float depth()
    {
        return _depth;
    }

    fun float depth(float f)
    {
        f => _depth;

        Interpolate.linear(f, 0.0, 1.0, 0.0001, 0.01) @=> float d;
        d => lfo0.gain;
        d - d/9.0 => lfo1.gain;
        d - d/5.0 => lfo2.gain;
        d - d/3.0 => lfo3.gain;

        return _depth;
    }

    fun float tone()
    {
        return _tone;
    }

    fun float tone(float f)
    {
        f => _tone;
        Interpolate.linear(f, 0.0, 1.0, 440.0, 2640.0) => lpf.freq;
        return _tone;
    }

    fun void _update()
    {
        while (true)
        {
            10::ms => now;
            Math.pow(2.0, 1.0 + lfo0.last()) => shift0.shift;
            Math.pow(2.0, 1.0 + lfo1.last()) => shift1.shift;
            Math.pow(2.0, 1.0 + lfo2.last()) => shift2.shift;
            Math.pow(2.0, 1.0 + lfo3.last()) => shift3.shift;
        }
    }

    fun static Flutter create()
    {
        Flutter flutter;
        return flutter;
    }

    fun static Flutter create(float rate, float depth, float tone)
    {
        Flutter flutter;
        rate => flutter.rate;
        depth => flutter.depth;
        tone => flutter.tone;
        return flutter;
    }
}
