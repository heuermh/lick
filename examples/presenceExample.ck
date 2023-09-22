/*

    LiCK  Library for ChucK.
    Copyright (c) 2007-2023 held jointly by the individual authors.

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

adc => Presence presence => dac;

while (true)
{
    Math.random2f(700.0, 2000.0) => presence.lpf.freq;
    Math.random2f(0.1, 0.9) => presence.feedback;

    <<<"freq", presence.lpf.freq(), "presence", presence.feedback()>>>;
    4::second => now;
}
