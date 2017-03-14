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

Blueshift blueshift => blackhole;

0.1 => blueshift.rate;
blueshift.sinLfo();

<<<"depth 1.0">>>;
1.0 => blueshift.depth;

for (0 => int i; i < 100; i++)
{
    <<<blueshift._delay.delay()>>>;
    100::ms => now;
}

<<<"depth 0.2">>>;
0.2 => blueshift.depth;

for (0 => int i; i < 100; i++)
{
    <<<blueshift._delay.delay()>>>;
    100::ms => now;
}

<<<"done">>>;