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
            freq + (freq * lfo.last()) => sub.freq;
            freq + 1.0 => side.freq;
            1::samp => now;
        }
    }
}

class SF extends Effect
{
    int _state;
    0 => static int BAND_PASS;
    1 => static int LOW_PASS;
    2 => static int HIGH_PASS;
    //3 => static int FORMANT;

    BPF _bpf;
    LPF _lpf;
    HPF _hpf;

    inlet => _bpf => wet;
    inlet => _lpf => wet;
    inlet => _hpf => wet;

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
        f => _hpf.freq;
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
        f => _hpf.Q;
        return f;
    }

    fun void bpf()
    {
        1.0 => _bpf.gain;
        0.0 => _lpf.gain;
        0.0 => _hpf.gain;
        BAND_PASS => _state;
    }

    fun void lpf()
    {
        0.0 => _bpf.gain;
        1.0 => _lpf.gain;
        0.0 => _hpf.gain;
        LOW_PASS => _state;
    }

    fun void hpf()
    {
        0.0 => _bpf.gain;
        0.0 => _lpf.gain;
        1.0 => _hpf.gain;
        HIGH_PASS => _state;
    }
}

class StylizedPostHorn
{
    float freq;

    SawOsc master;
    SubOsc sub;
    Gain mixer;

    SF filter1;
    SF filter2;
    SF filter3;
    SF filter4;

    ADSR adsr;
    Lfo vibrato;
    Tremolo rhythm;
    Revenge ring;
    Gain out;

    master => mixer;
    sub.out => mixer;

    mixer => filter1 => rhythm;
    mixer => filter2 => rhythm;
    mixer => filter3 => rhythm;
    mixer => filter4 => rhythm;

    vibrato => blackhole;
    rhythm => ring => adsr => out;

    {
        220.0 => freq;
        220.0 => sub.freq;

        0.20 => master.gain;
        0.80 => sub.out.gain;

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

        vibrato.hyper();
        1.0 => vibrato.rate;
        0.05 => vibrato.depth;

        8.0 => rhythm.rate;
        0.20 => rhythm.mix;

        0.10 => ring.mix;

        spork ~ _updateAtSampleRate();
    }

    fun void _updateAtSampleRate()
    {
        while (true)
        {
            freq + (freq * vibrato.last()) => sub.freq;
            1::samp => now;
        }
    }
}

class Divider extends Effect
{
    // empty
}

class Switch extends Effect
{
    // empty
}

class SubOsc2 extends Effect
{
    float freq;

    SqrOsc divider1;
    SqrOsc divider2;
    SqrOsc divider3;
    SqrOsc divider4;
}

class TriShaper extends Effect
{
    // empty
}

class Ring extends Effect
{
    // empty
}

class Subharchord
{
    float freq;

    SqrOsc main;
    Lfo vibrato;
    Tremolo tremolo;

    Divider d1;
    Divider d2;
    Divider d3;
    Divider d4;
    Divider d5;
    Divider d6;
    Divider d7;

    Switch s1;
    Switch s2;
    Switch s3;
    Switch s4;

    SubOsc2 sub;
    Gain sqr;
    TriShaper tri;
    Gain matrix;

    LPF lpf;
    HPF hpf;
    BPF bpf;
    //FormatFilter formant;

    Gain ringPre;
    Ring ring;
    Gain carrier;

    Gain mixer;
    ADSR adsr;
    Chorus chorus;
    Gain out;

    /*

      main  <=== MIDI, OSC
       |
       v
     vibrato
       |
       v
     tremolo ----+------+------+------+------+------+------+----> s1
       |         |      |      |      |      |      |      |
       +-------- d1 --> d2 --> d3 --> d4 --> d5 --> d6 --> d7
                 |      |      |      |      |      |      |
                 +------+------+------+------+------+------+----> s2
                 |      |      |      |      |      |      |
                 +------+------+------+------+------+------+----> s3
                 |      |      |
                 +------+------+------+------+------+------+----> s4


       s1 --> sub -----+        +--> lpf ---+
                       |        |           |
                       v        |           |
       s2 --> sqr --> matrix ---+--> hpf ---+
                       ^        |           |
                       |        |           |
       s3 --> tri -----+        +--> bpf ---+---> mixer --> adsr --> chorus --> out
                                            |
                                            |
       s4 --> ringPre --> ring -------------+
                           ^
                           |
                          carrier
    */

    main => vibrato => tremolo;
    tremolo => s1;
    tremolo => d1;
    d1 => d2 => d3 => d4 => d5 => d6 => d7;
    d1 => s2;
    d1 => s3;
    d1 => s4;
    d2 => s2;
    d2 => s3;
    d2 => s4;
    d3 => s2;
    d3 => s3;
    d3 => s4;
    d4 => s2;
    d4 => s3;
    d4 => s4;
    d5 => s2;
    d5 => s3;
    d5 => s4;
    d6 => s2;
    d6 => s3;
    d6 => s4;
    d7 => s2;
    d7 => s3;
    d7 => s4;
    s1 => sub;
    sub.divider1 => matrix;
    sub.divider2 => matrix;
    sub.divider3 => matrix;
    sub.divider4 => matrix;
    s2 => sqr => matrix;
    s3 => tri => matrix;
    matrix => lpf => mixer;
    matrix => hpf => mixer;
    matrix => bpf => mixer;
    //matrix => formant => mixer;
    s4 => ringPre => ring => mixer;
    carrier => ring;
    mixer => adsr => chorus => out;

    {
        spork ~ _updateAtSampleRate();
    }

    fun void _updateAtSampleRate()
    {
        while (true)
        {
            freq + (freq * vibrato.last()) => freq;
            freq => main.freq;
            freq => sub.freq;
            1::samp => now;
        }
    }
}

//Trout t;
StylizedPostHorn t;
//Subharchord t;
t.out => dac;

261.6256 => float c;
440.0 => float a;
Scales.majorBlues(c, "C") @=> Scale c_majorBlues;
Scales.minorBlues(a, "A") @=> Scale a_minorBlues;

TimeSignature.common(110) @=> TimeSignature ts;

1::second/ts.q => t.ring.rate;

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

    //Math.random2f(0.01, 1.0) => t.lfo.rate;
    //Math.random2f(0.01, 0.04) => t.lfo.depth;
    Math.random2f(0.01, 1.0) => t.vibrato.rate;
    Math.random2f(0.01, 0.04) => t.vibrato.depth;
    Math.random2f(0.5, 10.0) => t.rhythm.rate;
    Math.random2f(0.05, 0.50) => t.rhythm.mix;
    Math.random2f(0.00, 0.80) => t.ring.mix;
    //<<<"freq", t.freq, "lfo rate", t.lfo.rate(), "lfo depth", t.lfo.depth(), "rhythm rate", t.rhythm.rate(), "rhythm mix", t.rhythm.mix()>>>;
    <<<"freq", t.freq, "vibrato rate", t.vibrato.rate(), "vibrato depth", t.vibrato.depth(), "rhythm rate", t.rhythm.rate(), "rhythm mix", t.rhythm.mix(), "ring mix", t.ring.mix()>>>;

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
