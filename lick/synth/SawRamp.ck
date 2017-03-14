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
// inspired by the documentation accompanying the bass synth
//
// Critter & Guitari Bolsa Bass 
// Buy one here:  http://www.critterandguitari.com/products/bolsa-bass
//

public class SawRamp extends Chubgraph
{
    SinOsc osc1;
    SinOsc osc2;
    SawOsc osc3;
    ADSR adsr;

    0.30 => osc1.gain;
    0.30 => osc2.gain;
    0.40 => osc3.gain;

    inlet => blackhole;
    osc1 => adsr;
    osc2 => adsr;
    osc3 => adsr;
    adsr => outlet;

    now => time _last;
    220.0 => float _sourceFreq;
    220.0 => float _targetFreq;

    200::ms => dur ramp;
    -0.8 => float detune;
    Intervals.octave() @=> Interval interval;
    Interpolations.linear() @=> Interpolation interpolation;

    spork ~ _tickAtSampleRate();

    fun void noteOn(int note)
    {
        noteOn(Std.mtof(note));
    }
 
    fun void noteOn(float freq)
    {
        now => _last;
        freq => _sourceFreq;
        interval.evaluate(freq) => _targetFreq;

        1 => adsr.keyOn;
    }

    fun void noteOff()
    {
        1 => adsr.keyOff;
    }

    fun void _tickAtSampleRate()
    {
        while (true)
        {
            if (adsr.state() < 4)
            {
                now => time _current;
                interpolation.evaluate((_current - _last) / ramp) => float v;

                if (v < 1.0)
                {
                    Interpolate.linear(v, 0.0, 1.0, _targetFreq, _sourceFreq) => float freq;
                    freq => osc1.freq;
                    freq => osc3.freq;
                    freq + detune => osc2.freq;
                }
            }
            1::samp => now;
        }
    }
}
