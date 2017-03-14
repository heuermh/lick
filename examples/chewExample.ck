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

SinOsc sin;
1.0 => sin.gain;
220.0 => sin.freq;

sin => Chew chew => dac;

0.0 => chew.mix;
5::second => now;

1.0 => chew.mix;

<<<"ready">>>;
0.1 => float cutoff;
for (0 => int i; i < 4; i++)
{
    cutoff => chew.topDepth;
    cutoff => chew.bottomDepth;
    <<<cutoff>>>;

    440.0 => float freq;
    for (0 => int j; j < 60; j++)
    {
        250::ms => now;    
        freq * 1.05 => freq;
        freq => chew.topRate;
        freq => chew.bottomRate;
        <<<"  ",freq>>>;
    }
    cutoff * 2 => cutoff;
}

<<<"done">>>;
