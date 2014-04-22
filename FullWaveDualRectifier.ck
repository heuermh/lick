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

class Bias extends Chugen
{
    0.0 => float offset; // between -1.0 and 1.0

    fun float tick(float in)
    {
        return offset + in;
    }
}

//
// inspired by BMC21. Full Wave Dual Rectifier
// http://www.bartonmusicalcircuits.com/fwd/
//
public class FullWaveDualRectifier extends Effect
{
    FullRect rect0;
    Bias bias0;
    FullRect rect1;
    Bias bias1;

    Gain cv0 => blackhole;
    Gain cv1 => blackhole;
    spork ~ _tickAtSampleRate();

    inlet => rect0 => bias0 => rect1 => bias1 => wet;

    fun void _tickAtSampleRate()
    {
        while (true)
        {
            cv0.last() => bias0.offset;
            cv1.last() => bias1.offset;
            1::samp => now;
        }
    }
}
