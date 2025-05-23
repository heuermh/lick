/*

    LiCK  Library for ChucK.
    Copyright (c) 2007-2025 held jointly by the individual authors.

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

Interpolations.circularIn() @=> Interpolation in;
Interpolations.circularOut() @=> Interpolation out;
Interpolations.circularInOut() @=> Interpolation inOut;

for (0.0 => float f; f < 1.01; f + 0.01 => f)
{
    <<<f, in.evaluate(f), out.evaluate(f), inOut.evaluate(f)>>>;
}
