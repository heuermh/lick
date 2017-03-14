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

public class DigitalDelay extends Feedback
{
    Delay _delay;

    pre => _delay => post;
    feedbackOut => feedbackIn;

    {
        0.2 => feedback;
    }

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

    fun static DigitalDelay create()
    {
        DigitalDelay delay;
        return delay;
    }

    fun static DigitalDelay create(dur delay)
    {
        DigitalDelay digitalDelay;
        delay => digitalDelay.max;
        delay => digitalDelay.delay;
        return digitalDelay;
    }

    fun static DigitalDelay create(dur delay, float feedback)
    {
        DigitalDelay digitalDelay;
        delay => digitalDelay.max;
        delay => digitalDelay.delay;
        feedback => digitalDelay.feedback;
        return digitalDelay;
    }

    fun static DigitalDelay create(dur max, dur delay, float feedback)
    {
        DigitalDelay digitalDelay;
        max => digitalDelay.max;
        delay => digitalDelay.delay;
        feedback => digitalDelay.feedback;
        return digitalDelay;
    }
}
