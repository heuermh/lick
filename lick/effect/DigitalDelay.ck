/*

    LiCK  Library for ChucK.
    Copyright (c) 2007-2015 held jointly by the individual authors.

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

public class DigitalDelay extends Effect
{
    Delay _delay;
    Gain _pre;
    Gain _feedback;

    0.2 => _feedback.gain;

    inlet => _pre => _delay;
    _delay => _feedback => _pre;
    _delay => wet;

    fun dur delay()
    {
        return _delay.delay();
    }

    fun dur delay(dur d)
    {
        d => _delay.delay;
    }

    fun dur max()
    {
        return _delay.max();
    }

    fun dur max(dur d)
    {
        d => _delay.max;
    }

    fun float feedback()
    {
        return _feedback.gain();
    }

    fun float feedback(float f)
    {
        f => _feedback.gain;
    }

    fun static DigitalDelay create()
    {
        DigitalDelay delay;
        return delay;
    }
}
