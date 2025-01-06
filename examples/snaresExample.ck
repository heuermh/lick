/*

    LiCK  Library for ChucK.
    Copyright (c) 2007-2025 held jointly by the individual authors.

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


Gain mix;

Cch cch => mix;
//Czh czh => mix;
Dmch dmch => mix;
Dnn dnn => mix;
Snare snare => mix;
Tss tss => mix;
Twkz twkz => mix;

mix => dac;

TimeSignature.common(120) @=> TimeSignature ts;

30.0f => dmch.freqDepth;

2 => twkz.bitDepth;
4000.0f => twkz.crushRate;

while (true)
{
    Math.random2f(0.7, 1.1) => float a;
    a => cch.accent;
    a => dmch.accent;
    a => dnn.accent;
    a => snare.accent;
    a => tss.accent;
    a => twkz.accent;

    Math.random2f(80.0, 220.0) => float f;
    f => dmch.freq;
    f => dnn.freq;
    f => snare.freq;

    Math.random2f(0.0, 1.0) => float t;
    t => cch.tone;
    t => dnn.tone;
    t => snare.tone;
    t => tss.tone;
    t => twkz.tone;

    // no tone field, specifically
    Interpolate.linear(t, 0.0f, 1.0f, 2200.0f, 4800.0f) => dmch.noiseCutoff;

    Math.random2f(0.2, 0.7) => float n;
    n => dmch.noiseMix;
    (1.0f - n) => dmch.drumMix;
    n => dnn.noise;
    n => snare.noise;

    Math.random2f(0.0, 1.0) * 120::ms + 80::ms => dur d;
    d => cch.decay;
    d => dmch.drumDecay;
    d - 10::ms => dmch.noiseDecay;
    d - 20::ms => dmch.freqDecay;
    d => dnn.decay;
    d => snare.decay;
    d => tss.decay;
    d => twkz.decay;

    <<<"accent", a, "freq", f, "tone", t, "noise", n, "decay", (d/1::ms), "ms">>>;

    for (0 => int i; i < 4; i++)
    {
        <<<"cch">>>;
        cch.play();

        ts.q => now;
    }

    for (0 => int i; i < 4; i++)
    {
        <<<"dmch">>>;
        dmch.play();

        ts.q => now;
    }

    for (0 => int i; i < 4; i++)
    {
        <<<"dnn">>>;
        dnn.play();

        ts.q => now;
    }

    for (0 => int i; i < 4; i++)
    {
        <<<"snare">>>;
        snare.play();

        ts.q => now;
    }

    for (0 => int i; i < 4; i++)
    {
        <<<"tss">>>;
        tss.play();

        ts.q => now;
    }

    for (0 => int i; i < 4; i++)
    {
        <<<"twkz">>>;
        twkz.play();

        ts.q => now;
    }
}
