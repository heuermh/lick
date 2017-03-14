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

EnvelopeTremolo envelopeTremolo;

1.0 => envelopeTremolo.mix;
30::ms => envelopeTremolo.duration;
16.666 => envelopeTremolo.rate;

SinOsc sin;
0.8 => sin.gain;
220.0 => sin.freq;

sin => envelopeTremolo => dac;

<<<"ready">>>;
for (0 => int i; i < 5; i++)
{
    <<<"rate", envelopeTremolo.rate()>>>;
    10::second => now;
    envelopeTremolo.rate() / 2.0 => envelopeTremolo.rate;
}
<<<"done">>>;
