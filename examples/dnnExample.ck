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

@import "../lick/snare/Dnn"
@import "../lick/duration/TimeSignature"

Dnn dnn => dac;

TimeSignature.common(110) @=> TimeSignature ts;

while (true)
{
    Math.random2f(0.7, 0.9) => float a;
    a => dnn.accent;

    Math.random2f(30.0, 400.0) => float f;
    f => dnn.freq;

    Math.random2f(0.0, 1.0) => float t;
    t => dnn.tone;

    Math.random2f(0.3, 0.6) => float pw;
    pw => dnn.pulseWidth;

    Math.random2f(4.0, 300.0) => float mr;
    mr => dnn.modulationRate;

    Math.random2f(0.0, 1.0) * 200::ms + 80::ms => dur d;
    d => dnn.decay;

    <<<"accent", a, "freq", f, "tone", t, "pulseWidth", pw, "modulationRate", mr, "decay", (d/1::ms), "ms">>>;

    for (0 => int i; i < 8; i++)
    {
        <<<"dnn">>>;
        dnn.play();

        ts.e => now;
    }
}
