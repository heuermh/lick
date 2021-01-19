/*

    LiCK  Library for ChucK.
    Copyright (c) 2007-2021 held jointly by the individual authors.

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

// noise sample
Samples.createSample("samples/AkaiMpc60/OpenHat.wav") @=> Sample sample;

Kick.create(sample) @=> Kick kick;

kick => dac;

20.601 => float e;
Scales.major(e) @=> Scale emaj;

TimeSignature.common(90) @=> TimeSignature ts;

while (true)
{
    emaj.sample() => float f;

    f => kick.freq;

    Math.random2f(20.0, 200.0) => float b;

    b => kick.bend;

    Math.random2f(0.0, 0.1) => float s;

    s => kick.shape;

    Math.random2f(0.0, 1.0) => float n;
    if (n < 0.66)
    {
        Math.random2f(0.01, 0.08) => float wn;
        wn => kick.noise;
        0.0 => kick.sample;
    }
    else
    {
        Math.random2f(0.01, 0.20) => float sn;
        0.0 => kick.noise;
        sn => kick.sample;
    }

    Math.random2f(0.0, 4.0) => float dr;

    dr => kick.drift;

    Math.random2f(0.1, 1.0) * 4::ms => dur a;

    a => kick.attack;

    Math.random2f(0.0, 1.0) * 900::ms + 100::ms => dur d;

    d => kick.decay;

    Math.random2f(0.1, 1.0) * 100::ms => dur pd;

    pd => kick.pitchDecay;

    Math.random2f(0.1, 1.0) * 2::ms => dur nd;

    nd => kick.noiseDecay;
    nd => kick.sampleDecay;

    <<<"freq", f, "bend", b, "shape", s, "noise", kick.noise(), "sample", kick.sample(), "drift", dr, "attack", (a/1::ms), "ms decay", (d/1::ms), "ms pitchDecay", (pd/1::ms), "ms noiseDecay", (nd/1::ms), "ms">>>;

    for (0 => int i; i < 4; i++)
    {
        <<<"  kick">>>;
        kick.play();
        ts.q => now;
    }
}
