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

AdsrTremolo adsrTremolo;

1.0 => adsrTremolo.mix;
6::ms => adsrTremolo.attack;
24::ms => adsrTremolo.decay;
0.9 => adsrTremolo.sustain;
30::ms => adsrTremolo.release;
16.666 => adsrTremolo.rate;

SinOsc sin;
0.8 => sin.gain;
220.0 => sin.freq;

sin => adsrTremolo => dac;

<<<"ready">>>;
for (0 => int i; i < 5; i++)
{
    <<<"rate", adsrTremolo.rate()>>>;
    10::second => now;
    adsrTremolo.rate() / 2.0 => adsrTremolo.rate;
}
<<<"done">>>;
