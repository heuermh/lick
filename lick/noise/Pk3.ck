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

public class Pk3 extends Chugen
{
    float b0;
    float b1;
    float b2;
    float b3;
    float b4;
    float b5;
    float b6;

    fun float tick(float f)
    {
        0.99886 * b0 + f * 0.0555179 => b0;
        0.99332 * b1 + f * 0.0750759 => b1;
        0.96900 * b2 + f * 0.1538520 => b2;
        0.86650 * b3 + f * 0.3104856 => b3;
        0.55000 * b4 + f * 0.5329522 => b4;
        -0.7616 * b5 - f * 0.0168980 => b5;
        f * 0.115926 => b6;
        return b0 + b1 + b2 + b3 + b4 + b5 + b6 + f * 0.5362;
    }
}
