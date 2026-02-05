/*

    LiCK  Library for ChucK.
    Copyright (c) 2007-2026 held jointly by the individual authors.

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

Strange strange => dac;

TimeSignature.common(110) @=> TimeSignature t;

261.6256 => float c;
440.0 => float a;

Chords.addNine(c, "C") @=> Chord c_maj;
Chords.minorNinth(a, "A") @=> Chord a_min;

fun void play()
{
    for (0 => int i; i < 4; i++)
    {
        c_maj.sample() => strange.freq;
        strange.keyOn();
        3 * t.s => now;
        strange.keyOff();
        t.s => now;
    }
    for (0 => int i; i < 4; i++)
    {
        a_min.sample() => strange.freq;
        strange.keyOn();
        3 * t.s => now;
        strange.keyOff();
        t.s => now;
    }
}

strange.ee();
<<<"ee">>>;
play();

strange.i();
<<<"i">>>;
play();

strange.e();
<<<"e">>>;
play();

strange.ae();
<<<"ae">>>;
play();

strange.ah();
<<<"ah">>>;
play();

strange.aw();
<<<"aw">>>;
play();

strange.u();
<<<"u">>>;
play();

strange.oo();
<<<"oo">>>;
play();

strange.a();
<<<"a">>>;
play();

strange.er();
<<<"er">>>;
play();

<<<"done">>>;
