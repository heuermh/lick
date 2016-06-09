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

class Trout
{
    float freq;

    SawOsc master;
    SawOsc side;
    Noise noise;
    SubOsc sub;
    Gain mixer;

    BPF bpf1;
    LPF lpf1;
    Gain filter1;

    BPF bpf2;
    LPF lpf2;
    Gain filter2;

    BPF bpf3;
    LPF lpf3;
    Gain filter3;

    BPF bpf4;
    LPF lpf4;
    Gain filter4;

    ADSR adsr;

    master => mixer;
    side => mixer;
    noise => mixer;
    sub.out => mixer;

    mixer => bpf1 => filter1;
    mixer => lpf1 => filter1;

    mixer => bpf2 => filter2;
    mixer => lpf2 => filter2;

    mixer => bpf3 => filter3;
    mixer => lpf3 => filter3;

    mixer => bpf4 => filter4;
    mixer => lpf4 => filter4;

    filter1 => adsr;
    filter2 => adsr;
    filter3 => adsr;
    filter4 => adsr;

    {
        220.0 => freq;
        220.0 => sub.freq;
        222.0 => side.freq;

        0.20 => master.gain;
        0.70 => sub.out.gain;
        0.05 => side.gain;
        0.05 => noise.gain;

        1.0 => bpf1.gain;
        0.0 => lpf1.gain;
        1.0 => bpf2.gain;
        0.0 => lpf2.gain;
        1.0 => bpf3.gain;
        0.0 => lpf3.gain;
        1.0 => bpf4.gain;
        0.0 => lpf4.gain;

        700.0 => bpf1.freq;
        700.0 => lpf1.freq;
        0.8 => bpf1.Q;
        0.8 => lpf1.Q;

        1300.0 => bpf2.freq;
        1300.0 => lpf2.freq;
        0.7 => bpf2.Q;
        0.7 => lpf2.Q;

        2100.0 => bpf3.freq;
        2100.0 => lpf3.freq;
        0.6 => bpf3.Q;
        0.6 => lpf3.Q;

        2900.0 => bpf4.freq;
        2900.0 => lpf4.freq;
        0.5 => bpf4.Q;
        0.5 => lpf4.Q;

        0.25 => filter1.gain;
        0.25 => filter2.gain;
        0.25 => filter3.gain;
        0.25 => filter4.gain;

        spork ~ _updateAtSampleRate();
    }

    fun void _updateAtSampleRate()
    {
        while (true)
        {
            freq => sub.freq;
            freq + 1.0 => side.freq;
            1::samp => now;
        }
    }
}

Trout t;
t.adsr => dac;

while (true)
{
    Math.random2f(200.0, 2000.0) => t.freq;
    <<<"freq", t.freq>>>;
    1 => t.adsr.keyOn;
    1200::ms => now;
    1 => t.adsr.keyOff;
    200::ms => now;
}
