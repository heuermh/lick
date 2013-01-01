/*

    LiCK  Library for ChucK.
    Copyright (c) 2007-2013 held jointly by the individual authors.

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

Tremolo tremolo;
1.0 => float depth;
1.0 => float rate;

BeeThree bt;
220.0 => bt.freq;
bt.noteOff(1.0);

bt => tremolo.input;
tremolo.output => dac;

500::ms => now;

<<<tremolo.sinMix, tremolo.sqrMix, tremolo.triMix>>>;
for (0 => int i; i < 4; i++)
{
    rate => tremolo.rate;
    for (0 => int j; j < 10; j++)
    {
        8.0 * (j+1)/10.0 => depth;
        depth => tremolo.depth;

        <<<"tremolo rate", rate, "depth", depth>>>;
        bt.noteOn(1.0);
        800::ms => now;
        bt.noteOff(1.0);
        200::ms => now;
    }
    2.0 +=> rate;
}

1.0 => rate;
1.0 => tremolo.sinMix;
0.0 => tremolo.sqrMix;
0.0 => tremolo.triMix;
<<<tremolo.sinMix, tremolo.sqrMix, tremolo.triMix>>>;
for (0 => int i; i < 4; i++)
{
    rate => tremolo.rate;
    for (0 => int j; j < 10; j++)
    {
        8.0 * (j+1)/10.0 => depth;
        depth => tremolo.depth;

        <<<"tremolo rate", rate, "depth", depth>>>;
        bt.noteOn(1.0);
        800::ms => now;
        bt.noteOff(1.0);
        200::ms => now;
    }
    2.0 +=> rate;
}

1.0 => rate;
0.0 => tremolo.sinMix;
1.0 => tremolo.sqrMix;
0.0 => tremolo.triMix;
<<<tremolo.sinMix, tremolo.sqrMix, tremolo.triMix>>>;
for (0 => int i; i < 4; i++)
{
    rate => tremolo.rate;
    for (0 => int j; j < 10; j++)
    {
        8.0 * (j+1)/10.0 => depth;
        depth => tremolo.depth;

        <<<"tremolo rate", rate, "depth", depth>>>;
        bt.noteOn(1.0);
        800::ms => now;
        bt.noteOff(1.0);
        200::ms => now;
    }
    2.0 +=> rate;
}

1.0 => rate;
0.0 => tremolo.sinMix;
0.0 => tremolo.sqrMix;
1.0 => tremolo.triMix;
<<<tremolo.sinMix, tremolo.sqrMix, tremolo.triMix>>>;
for (0 => int i; i < 4; i++)
{
    rate => tremolo.rate;
    for (0 => int j; j < 10; j++)
    {
        8.0 * (j+1)/10.0 => depth;
        depth => tremolo.depth;

        <<<"tremolo rate", rate, "depth", depth>>>;
        bt.noteOn(1.0);
        800::ms => now;
        bt.noteOff(1.0);
        200::ms => now;
    }
    2.0 +=> rate;
}

<<<"done">>>;
