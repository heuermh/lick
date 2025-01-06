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

Thwok thwok;

thwok => dac;

// thwok is really loud
0.05 => thwok.gain;

20.601 => float e;
Scales.major(e) @=> Scale emaj;

TimeSignature.common(90) @=> TimeSignature ts;

while (true)
{
    emaj.sample() => float f;

    f => thwok.freq;

    Math.random2f(20.0, 200.0) => float b;

    b => thwok.bend;

    Math.random2f(0.1, 1.0) * 4::ms => dur a;

    a => thwok.attack;

    Math.random2f(0.0, 1.0) * 900::ms + 100::ms => dur d;

    d => thwok.decay;

    Math.random2f(0.1, 1.0) * 100::ms => dur pd;

    pd => thwok.pitchDecay;

    <<<"freq", f, "bend", b, "attack", (a/1::ms), "ms decay", (d/1::ms), "ms pitchDecay", (pd/1::ms)>>>;

    for (0 => int i; i < 4; i++)
    {
        <<<"  thwok">>>;
        thwok.play();
        ts.q => now;
    }
}
