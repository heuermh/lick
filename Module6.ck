/*

    LiCK  Library for ChucK.
    Copyright (c) 2007-2012 held jointly by the individual authors.

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

public class Module6 extends Chugen
{
    Gain _cv0;
    Gain _cv1;
    Gain _cv2;
    Gain _cv3;
    Gain _cv4;
    Gain _cv5;

    {
        _cv0 => blackhole;
        _cv1 => blackhole;
        _cv2 => blackhole;
        _cv3 => blackhole;
        _cv4 => blackhole;
        _cv5 => blackhole;
    }

    fun float tick(float in)
    {
        return tick(in, _cv0.last(), _cv1.last(), _cv2.last(), _cv3.last(), _cv4.last(), _cv5.last());
    }

    // subclasses override this function
    fun float tick(float in, float cv0, float cv1, float cv2, float cv3, float cv4, float cv5)
    {
        return in;        
    }
}