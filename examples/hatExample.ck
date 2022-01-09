/*

    LiCK  Library for ChucK.
    Copyright (c) 2007-2022 held jointly by the individual authors.

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

Hat hat => dac;

0.8 => hat.gain;

TimeSignature.common(100) @=> TimeSignature ts;

while (true)
{
    Math.random2f(0.4, 0.8) => float acc;
    acc => hat.accent;

    Math.random2f(0.0, 2.0) * 10::ms + 1::ms => dur att;
    att => hat.attack;

    Math.random2f(2000.0, 12000.0) => float f;
    f => hat.freq;

    Math.random2f(0.50, 4.0) => float r;
    r => hat.resonance;

    Math.random2f(800.0, 2000.0) => float hp;
    hp => hat.highPass;

    Math.random2f(0.0, 1.0) * 140::ms + 60::ms => dur d;
    d => hat.decay;

    <<<"accent", acc, "attack", (att/1::ms), "ms freq", f, "resonance", r, "highPass", hp, "decay", (d/1::ms), "ms">>>;

    for (0 => int i; i < 8; i++)
    {
        <<<"hat">>>;
        spork ~ hat.play();

        ts.s => now;
    }
}