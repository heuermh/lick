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
// inspired by BMC21. Full Wave Dual Rectifier
// http://www.bartonmusicalcircuits.com/fwd/
//

public class DualRect extends Effect
{
    FullRectifier _rect0;
    FullRectifier _rect1;

    Gain cv0 => blackhole;
    Gain cv1 => blackhole;

    inlet => _rect0 => _rect1 => wet;

    {
        spork ~ _updateAtSampleRate();
    }

    fun void _updateAtSampleRate()
    {
        while (true)
        {
            cv0.last() => _rect0.bias;
            cv1.last() => _rect1.bias;
            1::samp => now;
        }
    }

    fun static DualRect create(Lfo lfo0, Lfo lfo1)
    {
        DualRect dualRect;
        lfo0 => dualRect.cv0;
        lfo1 => dualRect.cv1;
        return dualRect;
    }
}
