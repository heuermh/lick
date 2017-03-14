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

Folder2 f => dac;

0.8 => f.gain;
110.0 => f.freq;

<<<"ready">>>;
while (true)
{
    800::ms => now;
    for (0.0 => float a; a < 1.6; )
    {
        <<<"a", a>>>;//, "_i", f._i, "last", f.last()>>>;
        a => f.a;
        40::ms => now;
        a + 0.01 => a;
    }
    100::ms => now;
    for (1.6 => float a; a > 0.0; )
    {
        <<<"a", a>>>;//, "_i", f._i, "last", f.last()>>>;
        a => f.a;
        40::ms => now;
        a - 0.01 => a;
    }
}
