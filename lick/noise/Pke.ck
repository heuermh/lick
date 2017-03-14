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

//
// see
// http://www.firstpr.com.au/dsp/pink-noise/ for further references
//

public class Pke extends Chugen
{
    float b0;
    float b1;
    float b2;

    fun float tick(float f)
    {
        0.99765 * b0 + f * 0.0990460 => b0;
        0.96300 * b1 + f * 0.2965164 => b1;
        0.57000 * b2 + f * 1.0526913 => b2;
        return b0 + b1 + b2 + f * 0.1848;
    }
}
