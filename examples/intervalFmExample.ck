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

@import "../lick/fm/IntervalFm"
@import "../lick/interval/Chord"
@import "../lick/interval/Chords"

IntervalFm intervalFm => dac;

Intervals.majorThird().asc() @=> Interval asc;
Intervals.majorThird().desc() @=> Interval desc;

261.6256 => float c;
Chords.majorTriad(c, "C") @=> Chord c_maj;

<<<"ready">>>;
for (0 => int i; i < 8; i++)
{
  10.0 * (12 * i + 1) => intervalFm.depth;

  asc => intervalFm.interval;
  <<<"asc", "depth", intervalFm.depth()>>>;
  for (0 => int j; j < 8; j++)
  {
    c_maj.sample() => intervalFm.carrier;
    <<<"  asc", "carrier", intervalFm.carrier(), "modulator", intervalFm.modulator(), "interval", intervalFm.interval().description, "ratio", intervalFm.interval().ratio, "actual ratio", intervalFm.interval().antecedent, ":", intervalFm.interval().consequent>>>;
    200::ms => now;
  }

  desc => intervalFm.interval;
  <<<"desc", "depth", intervalFm.depth()>>>;
  for (0 => int j; j < 8; j++)
  {
    c_maj.sample() => intervalFm.carrier;
    <<<"  desc", "carrier", intervalFm.carrier(), "modulator", intervalFm.modulator(), "interval", intervalFm.interval().description, "ratio", intervalFm.interval().ratio, "actual ratio", intervalFm.interval().antecedent, ":", intervalFm.interval().consequent>>>;
    200::ms => now;
  }
}

<<<"done">>>;
