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

Boom boom => dac;

0.6 => boom.gain;

20.601 => float e;
Scales.major(e) @=> Scale emaj;

TimeSignature.common(40) @=> TimeSignature ts;

while (true)
{
    emaj.sample() => float f;

    f => boom.freq;

    Math.random2f(20.0, 200.0) => float b;

    b => boom.bend;

    Math.random2f(0.0, 6.0) => float dr;

    dr => boom.drift;

    Math.random2f(0.1, 1.0) * 10::ms => dur a;

    a => boom.attack;

    Math.random2f(0.0, 1.0) * 1600::ms + 400::ms => dur d;

    d => boom.decay;

    Math.random2f(0.1, 1.0) * 100::ms => dur pd;

    pd => boom.pitchDecay;

    <<<"freq", f, "bend", b, "drift", dr, "attack", (a/1::ms), "ms decay", (d/1::ms), "ms pitchDecay", (pd/1::ms), "ms">>>;

    for (0 => int i; i < 4; i++)
    {
        <<<"  boom">>>;
        boom.play();
        ts.q => now;
    }
}
