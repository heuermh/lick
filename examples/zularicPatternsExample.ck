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

Nks ch => dac;
Nks oh => dac;
Twkz sn => dac;
Thump ki => dac;

0.10 => ch.gain;
ch.closed();

0.15 => oh.gain;
oh.open();

0.10 => sn.gain;
0.65 => ki.gain;
30.0 => ki.freq;
800.0::ms => ki.decay;
100.0::ms => ki.pitchDecay;

Patterns.zularic16() @=> Pattern p[];

while(true) {
  for (0 => int i; i < p[0].size(); i++) {
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
    90::ms => now;
  }
}
