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
// Super-simple wah-wah pedal example
// by Perry R. Cook, October 2013
//     this one uses Chuggraph extension
// Based on Julius O. Smith's experiments
// with his own CryBaby.  See:
// https://ccrma.stanford.edu/realsimple/faust_strings/faust_strings.pdf

// OK, now let's test this baby!!
SndBuf s => CryBaby myWah => dac;
"shuffle.wav" => s.read; // test guitar riff
1 => s.loop;

SinOsc autoWah => blackhole; // we use this to automatically
0.3 => autoWah.freq;         // open/close our wah-wah filter

while (1)  {  // just hang here and update
    0.5*(1.0+autoWah.last()) => myWah.setWah;
    0.01 :: second => now;
}
