/*

    LiCK  Library for ChucK.
    Copyright (c) 2007-2024 held jointly by the individual authors.

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

SinOsc sin => Foldr foldr => dac;

440.0 => sin.freq;

for (0 => int i; i < 10; i++)
{
    (i + 1) * 10.0f => foldr.incr;
    <<<"foldr.incr", foldr.incr>>>;
    200::ms => now;
}
for (0 => int i; i < 10; i++)
{
    (i + 1) * 100.0f => foldr.incr;
    <<<"foldr.incr", foldr.incr>>>;
    1400::ms => now;
}
for (0 => int i; i < 10; i++)
{
    (i + 1) * 1000.0f => foldr.incr;
    <<<"foldr.incr", foldr.incr>>>;
    4::second => now;
}

<<<"done">>>;
