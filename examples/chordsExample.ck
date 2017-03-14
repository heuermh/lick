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

BeeThree bt => dac;
bt.noteOff(1.0);

class Play extends FloatProcedure
{
    fun void run(float value)
    {
        value => bt.freq;
        bt.noteOn(1.0);
        500::ms => now;
        bt.noteOff(1.0);
        100::ms => now;
    }
}

261.6256 => float c;
440.0 => float a;

Play play;
Chords.majorTriad(c, "C") @=> Chord c_maj;
Chords.minorTriad(a, "A") @=> Chord a_min;

2::second => now;

for (0 => int i; i < 4; i++)
{
    <<<c_maj.symbol>>>;
    c_maj.forEach(play);

    <<<a_min.symbol>>>;
    a_min.forEach(play);
}

play.run(c_maj.root);
