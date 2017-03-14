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

SawOsc saw;
220.0 => saw.freq;

ADSR adsr;
adsr.set(10::ms, 800::ms, 0.9, 400::ms);

saw => adsr => dac;

2::second => now;

<<<"no filter">>>;

1 => adsr.keyOn;
1::second => now;
1 => adsr.keyOff;
800::ms => now;

BRF brf;
880.0 => brf.freq;
0.0 => brf.Q;

adsr =< dac;
adsr => brf => dac;

<<<"BRF filter">>>;

1::second => now;

for (0 => int i; i < 10; i++)
{
    <<<"Q", brf.Q()>>>;

    1 => adsr.keyOn;
    1::second => now;
    1 => adsr.keyOff;
    800::ms => now;

    brf.Q() + 0.01 => brf.Q;
}

for (0 => int i; i < 19; i++)
{
    <<<"Q", brf.Q()>>>;

    1 => adsr.keyOn;
    1::second => now;
    1 => adsr.keyOff;
    800::ms => now;

    brf.Q() + 0.05 => brf.Q;
}
<<<"done">>>;
