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

@import "Foldr"

public class Bitr extends Chugen
{
    Foldr _foldr;

    1::second/1::samp => float sampleRate;
    8 => int bitDepth;
    10000.0f => float crushRate;

    fun float tick(float in)
    {
        Math.pow(2.0f, bitDepth) => float bits;
        sampleRate / crushRate => _foldr.incr;

        in * 65536.0f => float out;
        out + 32768 => out;
        out * (bits / 65536.0f) => out;
        Math.floor(out) => out;
        out * (65536.0f / bits) - 32768 => out;

        _foldr.tick(out) => out;
        out / 65536.0f => out;

        return out;
    }
}
