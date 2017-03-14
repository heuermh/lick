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

public class Blueshift extends LfoFeedback
{
    Delay _delay;

    {
        pre => _delay => post;
        feedbackOut => feedbackIn;

        10::ms => _delay.max;
        1::ms => _delay.delay;

        0.05 => feedback;

        spork ~ _updateAtSampleRate();
    }

    fun void _updateAtSampleRate()
    {
        while (true)
        {
            1::samp => now;
            Interpolate.linear(_lfo.last(), -1.0, 1.0, 1.0, 10.0) => float v;
            1::ms * v => _delay.delay;
        }
    }

    fun static Blueshift create()
    {
        Blueshift blueshift;
        return blueshift;
    }
}
