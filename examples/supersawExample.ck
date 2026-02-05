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

//SzaboSupersaw supersaw => ADSR adsr => dac;
GiuliozSupersaw supersaw => ADSR adsr => dac;

329.63f => float e;
Scales.majorBlues(e, "E") @=> Scale scale;
TimeSignature.common(110) @=> TimeSignature t;

SinOsc lfo => blackhole;

0.5f => lfo.freq;

while (true)
{
    for (1 => int i; i < 5; i++)
    {
        2400.0f + (lfo.last() * 2000.0f) => supersaw.hpf.freq;
        scale.sample() => supersaw.freq;
        adsr.keyOn();
        t.s => now;
        adsr.keyOff();
    }
}
