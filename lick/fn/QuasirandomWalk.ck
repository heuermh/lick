/*

    LiCK  Library for ChucK.
    Copyright (c) 2007-2026 held jointly by the individual authors.

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

public class QuasirandomWalk extends Chance
{
    0.0 => float last;

    fun float get()
    {
        Math.random2f(0.0, 0.5) => float r;

        // si = s(i-1) + 0.5 + ri (mod 1)
        (last + 0.5 + r) % 1 => float s;
        s => last;
        return s;
    }
}
