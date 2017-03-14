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

Quad quad;
quad.lfo1 => blackhole;
quad.lfo2 => blackhole;
quad.lfo3 => blackhole;
quad.lfo4 => blackhole;

for (0 => int i; i < 500; i++)
{
    <<<quad.lfo1.last(), quad.lfo2.last(), quad.lfo3.last(), quad.lfo4.last()>>>;
    10::ms => now;
}
<<<"done">>>;
