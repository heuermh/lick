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

public class Module3 extends Chugen
{
    // chuck LFOs into these
    Gain cv0;
    Gain cv1;
    Gain cv2;

    {
        cv0 => blackhole;
        cv1 => blackhole;
        cv2 => blackhole;
    }

    fun float tick(float in)
    {
        return tick(in, cv0.last(), cv1.last(), cv2.last());
    }

    // subclasses override this function
    fun float tick(float in, float v0, float v1, float v2)
    {
        return in;
    }
}
