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

public class Chance extends FloatSupplier
{
    fun float get()
    {
        return Math.random2f(0.0, 1.0);
    }

    fun int almostAlways()
    {
        Math.floor(get() + 0.9) $ int => int i;
        return i;
    }

    fun int frequently()
    {
        Math.floor(get() + 0.8) $ int => int i;
        return i;
    }

    fun int often()
    {
        Math.floor(get() + 0.66) $ int => int i;
        return i;
    }

    fun int coinFlip()
    {
        Math.floor(get() + 0.5) $ int => int i;
        return i;
    }

    fun int sometimes()
    {
        Math.floor(get() + 0.33) $ int => int i;
        return i;
    }

    fun int infrequently()
    {
        Math.floor(get() + 0.2) $ int => int i;
        return i;
    }

    fun int rarely()
    {
        Math.floor(get() + 0.1) $ int => int i;
        return i;
    }
}
