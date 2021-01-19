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

Boom boom;
Duff duff;
Thump thump;
Thwok thwok;
Fwak fwak;
Fwak2 fwak2;

// noise sample
Samples.createSample("samples/AkaiMpc60/OpenHat.wav") @=> Sample sample;

Thud.create(sample) @=> Thud thud;
Kick.create(sample) @=> Kick kick;

boom => dac;
duff => dac;
thump => dac;
thud => dac;
kick => dac;
thwok => dac;
fwak => dac;
fwak2 => dac;

// thwok is really loud
0.05 => thwok.gain;

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
    f => thwok.freq;
    f => fwak.freq;
    f => fwak2.freq;

    Math.random2f(20.0, 200.0) => float b;

    b => boom.bend;
    b => duff.bend;
    b => thump.bend;
    b => thud.bend;
    b => kick.bend;
    b => thwok.bend;
    b => fwak.bend;
    b => fwak2.bend;

    Math.random2f(0.0, 0.1) => float s;

    s => duff.shape;
    s => thump.shape;
    s => kick.shape;

    Math.random2f(0.01, 0.08) => float n;

    n => thump.noise;
    n => thud.sample;
    n/2.0 => kick.noise;
    n/2.0 => kick.sample;

    Math.random2f(0.0, 4.0) => float dr;

    dr => boom.drift;
    dr => kick.drift;

    Math.random2f(0.1, 1.0) * 4::ms => dur a;

    a => boom.attack;
    a => thump.attack;
    a => thud.attack;
    a => kick.attack;
    a => thwok.attack;
    a => fwak.attack;
    a => fwak2.attack;

    Math.random2f(0.0, 1.0) * 900::ms + 100::ms => dur d;

    d => boom.decay;
    d => duff.decay;
    d => thump.decay;
    d => thud.decay;
    d => kick.decay;
    d => thwok.decay;
    d => fwak.decay;
    d => fwak2.decay;

    Math.random2f(0.1, 1.0) * 100::ms => dur pd;

    pd => boom.pitchDecay;
    pd => duff.pitchDecay;
    pd => thump.pitchDecay;
    pd => thud.pitchDecay;
    pd => kick.pitchDecay;
    pd => thwok.pitchDecay;
    pd => fwak.pitchDecay;
    pd => fwak2.pitchDecay;

    Math.random2f(0.1, 1.0) * 2::ms => dur nd;

    nd => thump.noiseDecay;
    nd => thud.sampleDecay;
    nd => kick.noiseDecay;
    nd => kick.sampleDecay;

    Math.random2f(0.1, 2.0) => float fo;

    fo => fwak.fold;
    fo => fwak2.fold;

    Math.random2f(0.1, 1.0) * 40::ms => dur fd;

    fd => fwak.foldDecay;
    fd => fwak2.foldDecay;

    <<<"freq", f, "bend", b, "shape", s, "noise", n, "drift", dr, "fold", fo, "attack", (a/1::ms), "ms decay", (d/1::ms), "ms pitchDecay", (pd/1::ms), "ms noiseDecay", (nd/1::ms), "ms foldDecay", (fd/1::ms), "ms">>>;

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

    <<<"  thwok">>>;
    thwok.play();
    ts.q => now;
    thwok.play();
    ts.q => now;
    thwok.play();
    ts.q => now;
    thwok.play();
    ts.q => now;

    <<<"  fwak">>>;
    fwak.play();
    ts.q => now;
    fwak.play();
    ts.q => now;
    fwak.play();
    ts.q => now;
    fwak.play();
    ts.q => now;

    <<<"  fwak2">>>;
    fwak2.play();
    ts.q => now;
    fwak2.play();
    ts.q => now;
    fwak2.play();
    ts.q => now;
    fwak2.play();
    ts.q => now;
}
