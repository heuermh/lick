me.exit();
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

@import "../lick/dist/Bitr"
@import "../lick/lfo/Lfo"

Bitr bitr;

Lfo bitDepth => blackhole;
Lfo crushRate => blackhole;

0.0933f => bitDepth.rate;
3.0f => bitDepth.depth;
bitDepth.sin();

0.177f => crushRate.rate;
8000.0f => crushRate.depth;
crushRate.saw();

SinOsc sin => bitr => dac;

220.0 => sin.freq;

fun dump()
{
  while (true)
  {
    <<<"bitr.bitDepth", bitr.bitDepth, "bitr.crushRate", bitr.crushRate, "foldr.incr", (bitr.sampleRate/bitr.crushRate)>>>;
    400::ms => now;
  }
}

spork ~ dump();

while (true)
{
  (bitDepth.last() + 3.0f) $ int => bitr.bitDepth;
  (crushRate.last() + 10000.0f) => bitr.crushRate;
  1::samp => now;
}
<<<"done">>>;
