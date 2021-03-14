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

Cch cch => dac;
Czh czh => dac;
Tss tss => dac;
Dnn dnn => dac;
Snare snare => dac;

140.0 => dnn.freq;

TimeSignature.common(110) @=> TimeSignature ts;

while (true)
{
    Math.random2f(0.7, 0.9) => float a;
    a => cch.accent;
    a => czh.accent;
    a => tss.accent;
    a => dnn.accent;
    a => snare.accent;

    Math.random2f(30.0, 400.0) => float f;
    f => dnn.freq;
    f => snare.freq;

    Math.random2f(0.0, 1.0) => float t;
    t => cch.tone;
    t => czh.tone;
    t => tss.tone;
    t => dnn.tone;
    t => snare.tone;

    Math.random2f(0.2, 0.7) => float n;
    n => dnn.noise;
    n => snare.noise;

    Math.random2f(0.6, 1.0) => float c;
    c => czh.crush;

    Math.random2f(4.0, 32.0) $ int => int b;
    b => czh.bits;

    Math.random2f(2.0, 8.0) $ int => int ds;
    ds => czh.downsample;

    Math.random2f(0.3, 0.6) => float pw;
    pw => dnn.pulseWidth;

    Math.random2f(4.0, 300.0) => float mr;
    mr => dnn.modulationRate;

    Math.random2f(0.0, 1.0) * 200::ms + 80::ms => dur d;
    d => cch.decay;
    d => czh.decay;
    d => tss.decay;
    d => dnn.decay;

    <<<"accent", a, "freq", f, "tone", t, "noise", n, "crush", c, "bits", b, "downsample", ds, "pulseWidth", pw, "modulationRate", mr, "decay", (d/1::ms), "ms">>>;

    for (0 => int i; i < 4; i++)
    {
        <<<"cch">>>;
        cch.play();

        ts.q => now;
    }

    for (0 => int i; i < 4; i++)
    {
        <<<"czh">>>;
        czh.play();

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
}
