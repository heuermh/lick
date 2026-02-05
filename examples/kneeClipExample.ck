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

SinOsc osc => KneeClip kneeClip => dac;

220.0 => osc.freq;

for (0 => int i; i < 10; i++) {
  1.0f - (0.1 * i) => kneeClip.kneeStart;
  for (1 => int j; j < 21; j++) {
    0.5f * j => kneeClip.kneeCurve;
    <<<kneeClip.kneeStart(), kneeClip.kneeCurve()>>>;
    200::ms => now;
  }
}

//<<<kneeClip.f.kneeStart(), kneeClip.f.kneeCurve()>>>;
//<<<kneeClip.shape.kneeStart(), kneeClip.shape.kneeCurve()>>>;

<<<"done">>>;