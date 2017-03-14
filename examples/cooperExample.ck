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

adc => Cooper cooper => dac;

0.8 => cooper.mix;

0.0 => float feedback;
<<<"ready">>>;
10::second => now;
for (1 => int i; i < 11; i++)
{
    (i * 0.1) - 0.01 => feedback;
    <<<"feedback",feedback>>>;
    10::second => now;
}

<<<"done">>>;
