/*

    LiCK  Library for ChucK.
    Copyright (c) 2007-2020 held jointly by the individual authors.

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

Boom boom;
Duff duff;
Thump thump;

Samples.createSample("samples/AkaiMpc60/OpenHat.wav") @=> Sample sample;

Thud.create(sample) @=> Thud thud;
Kick.create(sample) @=> Kick kick;

boom => dac;
duff => dac;
thump => dac;
thud => dac;
kick => dac;

20.601 => float e;
Scales.major(e) @=> Scale emaj;

TimeSignature.common(90) @=> TimeSignature ts;

while (true)
{
    emaj.sample() => float f;

    f => boom.freq;
    f => duff.freq;
    f => thump.freq;
    f => thud.freq;
    f => kick.freq;

    Math.random2f(20.0, 200.0) => float b;

    b => boom.bend;
    b => duff.bend;
    b => thump.bend;
    b => thud.bend;
    b => kick.bend;

    Math.random2f(0.0, 0.1) => float s;

    s => duff.shape;
    s => thump.shape;
    s => kick.shape;

    Math.random2f(0.01, 0.08) => float n;

    n => thump.noise;
    n => thud.sample;
    n/2.0 => kick.whiteNoise;
    n/2.0 => kick.pinkNoise;
    n/2.0 => kick.sample;

    Math.random2f(0.0, 4.0) => float dr;

    dr => boom.drift;
    dr => kick.drift;

    Math.random2f(0.1, 1.0) * 4::ms => dur a;

    a => boom.attack;
    a => thump.attack;
    a => thud.attack;
    a => kick.attack;

    Math.random2f(0.0, 1.0) * 900::ms + 100::ms => dur d;

    d => boom.decay;
    d => duff.decay;
    d => thump.decay;
    d => thud.decay;
    d => kick.decay;

    Math.random2f(0.1, 1.0) * 100::ms => dur pd;

    pd => boom.pitchDecay;
    pd => duff.pitchDecay;
    pd => thump.pitchDecay;
    pd => thud.pitchDecay;
    pd => kick.pitchDecay;

    Math.random2f(0.1, 1.0) * 2::ms => dur nd;

    nd => thump.noiseDecay;
    nd => thud.sampleDecay;
    nd => kick.whiteNoiseDecay;
    nd => kick.pinkNoiseDecay;
    nd => kick.sampleDecay;

    <<<"freq", f, "bend", b, "shape", s, "noise", n, "drift", dr, "attack", (a/1::ms), "ms decay", (d/1::ms), "ms pitchDecay", (pd/1::ms), "ms noiseDecay", (nd/1::ms), "ms">>>;

    <<<"  boom">>>;
    boom.play();
    ts.q => now;
    boom.play();
    ts.q => now;
    boom.play();
    ts.q => now;
    boom.play();
    ts.q => now;

    <<<"  duff">>>;
    duff.play();
    ts.q => now;
    duff.play();
    ts.q => now;
    duff.play();
    ts.q => now;
    duff.play();
    ts.q => now;

    <<<"  thump">>>;
    thump.play();
    ts.q => now;
    thump.play();
    ts.q => now;
    thump.play();
    ts.q => now;
    thump.play();
    ts.q => now;

    <<<"  thud">>>;
    thud.play();
    ts.q => now;
    thud.play();
    ts.q => now;
    thud.play();
    ts.q => now;
    thud.play();
    ts.q => now;

    <<<"  kick">>>;
    kick.play();
    ts.q => now;
    kick.play();
    ts.q => now;
    kick.play();
    ts.q => now;
    kick.play();
    ts.q => now;
}
