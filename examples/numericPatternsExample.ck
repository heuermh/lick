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

Hat ch => dac;
Hat oh => dac;
Snare sn => dac;
Duff ki => dac;

0.10 => ch.gain;
4800.0 => ch.freq;
40::ms => ch.decay;

0.15 => oh.gain;
3000.0 => oh.freq;
100::ms => oh.decay;

0.25 => sn.gain;
0.50 => ki.gain;

Patterns.numeric13() @=> Pattern p[];

while(true) {
  for (0 => int i; i < 16; i++) {
    if (p[0].get(i)) {
      spork ~ ch.play();
    }
    if (p[1].get(i)) {
      spork ~ oh.play();
    }
    if (p[2].get(i)) {
      spork ~ sn.play();
    }
    if (p[3].get(i)) {
      spork ~ ki.play();
    }
    100::ms => now;
  }
}
