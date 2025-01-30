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

@import "../lick/duration/TimeSignature"
@import "../lick/interval/Chords"
@import "../lick/synth/Dream"

Dream dream => NRev reverb => dac;

0.6 => dream.gain;
0.2 => reverb.mix;

TimeSignature.common(140) @=> TimeSignature t;

220.0 => float a;
Chords.minorThirteenth(a, "A") @=> Chord a_min13;

while (true)
{
    Std.ftom(a_min13.sample()) $ int => int note;
    <<<"note", note>>>;
    dream.keyOn(note);
    7 * t.e => now;
    dream.keyOff(note);
    t.e => now;
}

<<<"done">>>;
