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

Dist dist;
AtanDist atanDist;
TanhDist tanhDist;
RibbonDist ribbonDist;
FrostburnDist frostburnDist;
KijjazDist kijjazDist;
KijjazDist2 kijjazDist2;
KijjazDist3 kijjazDist3;
KijjazDist4 kijjazDist4;

AnalogDelay.create(kijjazDist4) @=> AnalogDelay delay;

600::ms => delay.max;
600::ms => delay.delay;
0.95 => delay.feedback;
0.80 => delay.mix;

adc => delay => dac;

/*
20000.0 => float freq;
for (0 => int i; i < 20; i++)
{
   6::second => now;
   freq => delay.cutoff;
   freq - 1000.0 => freq;
   <<<"cutoff", freq>>>;
}
*/

/*

  todo: filter is unstable at or below Q 0.8

1.0 => float q;
for (0 => int i; i < 20; i++)
{
   6::second => now;
   q => delay.resonance;
   q - 0.01 => q;
   <<<"Q", q>>>;
}
for (0 => int i; i < 20; i++)
{
   6::second => now;
   q => delay.resonance;
   q + 0.01 => q;
   <<<"Q", q>>>;
}
*/

1::minute => now;

<<<"done">>>;
