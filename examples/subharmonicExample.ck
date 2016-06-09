/*

    LiCK  Library for ChucK.
    Copyright (c) 2007-2016 held jointly by the individual authors.

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

class SubOsc
{
    float freq;

    SawOsc saw1;
    2 => int divider1;

    SawOsc saw2;
    3 => int divider2;

    SawOsc saw3;
    4 => int divider3;

    SawOsc saw4;
    5 => int divider4;

    Gain out;

    saw1 => out;
    saw2 => out;
    saw3 => out;
    saw4 => out;

    {
        0.40 => saw1.gain;
        0.30 => saw2.gain;
        0.20 => saw3.gain;
        0.10 => saw4.gain;

        spork ~ _updateAtSampleRate();
    }

    fun void _updateAtSampleRate()
    {
        while (true)
        {
            freq / divider1 => saw1.freq;
            freq / divider2 => saw2.freq;
            freq / divider3 => saw3.freq;
            freq / divider4 => saw4.freq;
            1::samp => now;
        }
    }
}

class TF extends Effect
{
    int _state;
    0 => static int BAND_PASS;
    1 => static int LOW_PASS;

    BPF _bpf;
    LPF _lpf;

    inlet => _bpf => wet;
    inlet => _lpf => wet;

    {
        lpf();

        1.0 => mix;
    }

    fun float freq()
    {
        return _bpf.freq();
    }

    fun float freq(float f)
    {
        f => _bpf.freq;
        f => _lpf.freq;
        return f;
    }

    fun float Q()
    {
        return _bpf.Q();
    }

    fun float Q(float f)
    {
        f => _bpf.Q;
        f => _lpf.Q;
        return f;
    }

    fun void bpf()
    {
        1.0 => _bpf.gain;
        0.0 => _lpf.gain;
        BAND_PASS => _state;
    }

    fun void lpf()
    {
        0.0 => _bpf.gain;
        1.0 => _lpf.gain;
        LOW_PASS => _state;
    }

    fun void toggle()
    {
        if (_state == BAND_PASS)
        {
            lpf();
        }
        else
        {
            bpf();
        }
    }
}

class Trout
{
    float freq;

    SawOsc master;
    SawOsc side;
    Noise noise;
    SubOsc sub;
    Gain mixer;

    TF filter1;
    TF filter2;
    TF filter3;
    TF filter4;

    Lfo lfo;
    ADSR adsr;
    Tremolo rhythm;
    Gain out;

    master => mixer;
    side => mixer;
    noise => mixer;
    sub.out => mixer;

    mixer => filter1 => rhythm;
    mixer => filter2 => rhythm;
    mixer => filter3 => rhythm;
    mixer => filter4 => rhythm;

    lfo => blackhole;
    rhythm => adsr => out;

    {
        220.0 => freq;
        220.0 => sub.freq;
        222.0 => side.freq;

        0.20 => master.gain;
        0.70 => sub.out.gain;
        0.05 => side.gain;
        0.05 => noise.gain;

        filter1.bpf();
        filter2.bpf();
        filter3.bpf();
        filter4.bpf();

        700.0 => filter1.freq;
        0.8 => filter1.Q;

        1300.0 => filter1.freq;
        0.7 => filter1.Q;

        2100.0 => filter1.freq;
        0.6 => filter1.Q;

        3900.0 => filter1.freq;
        0.5 => filter1.Q;

        0.25 => filter1.gain;
        0.25 => filter2.gain;
        0.25 => filter3.gain;
        0.25 => filter4.gain;

        lfo.hyper();
        1.0 => lfo.rate;
        0.05 => lfo.depth;

        8.0 => rhythm.rate;
        0.20 => rhythm.mix;

        spork ~ _updateAtSampleRate();
    }

    fun void _updateAtSampleRate()
    {
        while (true)
        {
            freq + lfo.last() => sub.freq;
            freq + 1.0 => side.freq;
            1::samp => now;
        }
    }
}

Trout t;
t.out => dac;

261.6256 => float c;
440.0 => float a;
Scales.majorBlues(c, "C") @=> Scale c_majorBlues;
Scales.minorBlues(a, "A") @=> Scale a_minorBlues;

TimeSignature.common(110) @=> TimeSignature ts;

0 => int i;
while (true)
{
    if (i % 4 == 0 || i % 7 == 0)
    {
        a_minorBlues.sample() => t.freq;
    }
    else
    {
        c_majorBlues.sample() => t.freq;
    }

    Math.random2f(0.5, 1.5) => t.lfo.rate;
    Math.random2f(0.05, 0.20) => t.lfo.depth;
    Math.random2f(0.5, 10.0) => t.rhythm.rate;
    Math.random2f(0.05, 0.20) => t.rhythm.mix;
    <<<"freq", t.freq, "lfo rate", t.lfo.rate(), "lfo depth", t.lfo.depth(), "rhythm rate", t.rhythm.rate(), "rhythm mix", t.rhythm.mix()>>>;

    1 => t.adsr.keyOn;
    if (i % 3 == 0 || i % 11 == 0)
    {
        ts.h => now;
        1 => t.adsr.keyOff;
        ts.e => now;
    }
    else
    {
        ts.q => now;
        1 => t.adsr.keyOff;
        ts.s => now;
    }

    i++;
}
