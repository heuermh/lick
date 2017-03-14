/*

    LiCK  Library for ChucK.
    Copyright (c) 2007-2017 held jointly by the individual authors.

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

// download waveforms from http://www.adventurekid.se/AKRT

SndBuf akwf;
"samples/AKWF/AKWF_raw/AKWF_raw_0022.wav" => akwf.read;
akwf.loop(true);

TimeSignature.common(96) @=> TimeSignature t;

ADSR adsr;
adsr.set(t.s, t.h, 0.9, t.e);

akwf => adsr => dac;

261.6256 => float c;
440.0 => float a;

Chords.majorTriad(c, "C") @=> Chord c_maj;
Chords.minorThirteenth(a, "A") @=> Chord a_min13;

t.w => now;

while (true)
{
    <<<c_maj.symbol>>>;
    akwf.freq(c_maj.sample());
    adsr.keyOn(1);
    t.h + t.q => now;
    adsr.keyOff(1);
    t.q => now;

    <<<a_min13.symbol>>>;
    akwf.freq(a_min13.sample());
    adsr.keyOn(1);
    t.h + t.q => now;
    adsr.keyOff(1);
    t.q => now;
}
