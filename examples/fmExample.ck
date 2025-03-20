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

@import "../lick/fm/Fm"

Fm fm => dac;

<<<"fm m", fm.modulator(), fm.m.freq(), "c", fm.carrier(), fm.c.freq(), "ratio", fm.ratio(), "a", fm.depth(), fm.a.gain()>>>;

for (0 => int i; i < 10; i++)
{
  200.0 * (i+1) => fm.depth;
  for (0 => int j; j < 10; j++)
  {
    (j+1) / 5.0 => fm.ratio;
    <<<"  i", i, "j", j, "fm m", fm.modulator(), fm.m.freq(), "c", fm.carrier(), fm.c.freq(), "ratio", fm.ratio(), "a", fm.depth(), fm.a.gain()>>>;
    200::ms => now;
  }
}
<<<"done">>>;
