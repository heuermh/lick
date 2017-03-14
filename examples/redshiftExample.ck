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

TimeSignature.common(280) @=> TimeSignature t;

293.67 => float d;
Chords.dominantEleventh(d, "D") @=> Chord d_11;

BeeThree bt => ADSR adsr => Redshift redshift => dac;

adsr.set(t.s, t.s, 0.8, t.q);

for (0 => int i; i < 10; i++)
{
  i * 0.1 => redshift.mix;
  <<<"redshift", redshift.mix()>>>;
  for (0 => int j; j < 8; j++)
  {
    d_11.sampleInterval().evaluate(d) => bt.freq;
    1.0 => bt.noteOn;
    1 => adsr.keyOn;
    <<<"  ", bt.freq()>>>;
    t.h => now;
    1 => adsr.keyOff;
    1.0 => bt.noteOff;
    t.h => now;
  }
}
<<<"done">>>;
