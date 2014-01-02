/*

    LiCK  Library for ChucK.
    Copyright (c) 2007-2014 held jointly by the individual authors.

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
    Gain _cv0;
    Gain _cv1;
    Gain _cv2;

    {
        _cv0 => blackhole;
        _cv1 => blackhole;
        _cv2 => blackhole;
    }

    fun float tick(float in)
    {
        return tick(in, _cv0.last(), _cv1.last(), _cv2.last());
    }

    // subclasses override this function
    fun float tick(float in, float cv0, float cv1, float cv2)
    {
        return in;        
    }
}