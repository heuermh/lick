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

public class Poly
{
    Gain outputL;
    Gain outputR;
    Lfo lfo;
    SawOsc sawOsc;
    SinOsc sinOsc;
    SqrOsc sqrOsc;
    TriOsc triOsc;
    SinOsc subOsc;
    SinOsc sub2Osc;
    Noise noise;
    Gain mix;
    Pan2 pan;

    float _freq;
    float _phase;

    {
        lfo => blackhole;
        sawOsc => mix;
        sinOsc => mix;
        triOsc => mix;
        sqrOsc => mix;
        subOsc => mix;
        sub2Osc => mix;
        noise => mix;
        mix => pan.left => outputL;
        mix => pan.right => outputR;

        20.0 => freq;
        0.0 => phase;
        0.01 => lfo.depth;
        0.5 => lfo.rate;
        0.05 => sawOsc.gain;
        0.6 => sinOsc.gain;
        0.0 => sqrOsc.gain;
        0.05 => triOsc.gain;
        0.005 => noise.gain;
        0.2 => subOsc.gain;
        0.1 => sub2Osc.gain;
        1.0 => mix.gain;
        1.0 => pan.gain;
        0.0 => pan.pan;
        1.0 => outputL.gain;
        1.0 => outputR.gain;

        spork ~ _tickAtSampleRate();
    }


    fun float freq()
    {
        return _freq;
    }

    fun float freq(float freq)
    {
        freq => _freq;
        _freq => sawOsc.freq;
        _freq => sinOsc.freq;
        _freq => sqrOsc.freq;
        _freq => triOsc.freq;
        _freq/2 => subOsc.freq;
        _freq/4 => sub2Osc.freq;
        return _freq;
    }

    fun float phase()
    {
        return _phase;
    }

    fun float phase(float phase)
    {
        phase => _phase;
        _phase => sawOsc.phase;
        _phase => sinOsc.phase;
        _phase => sqrOsc.phase;
        _phase => triOsc.phase;
        _phase => subOsc.phase;
        _phase => sub2Osc.phase;
        return _phase;
    }

    fun void _tickAtSampleRate()
    {
        while (true)
        {
            _freq + (_freq * lfo.last()) => _freq;
            1::samp => now;
        }
    }
}
