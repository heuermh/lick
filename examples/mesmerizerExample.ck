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

Mesmerizer mesmerizer => dac;
330.0 => mesmerizer.filterFreq;
0.0 => mesmerizer.filterSpread;

SinOsc low;
0.3 => low.gain;
220.0 => low.freq;

SinOsc high;
0.3 => high.gain;
440.0 => high.freq;

low => mesmerizer;
high => mesmerizer;

while (true)
{
    5::second => now;
    Math.random2f(0.05, 10.0) => mesmerizer.lfoFreq;
    Math.random2f(0.0001, 0.00001) => mesmerizer.phasorLfoDepth;

    <<<"lfo freq", mesmerizer.lfoFreq(), "phasor lfo depth", mesmerizer.phasorLfoDepth()>>>;
}
