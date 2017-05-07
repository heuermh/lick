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
// inspired by Kilpatrick Audio Echo Centric
// http://www.kilpatrickaudio.com/?p=echo_centric
//

public class Totter extends Feedback
{
    AnalogDelay.create() @=> AnalogDelay _quarters;
    AnalogDelay.create() @=> AnalogDelay _thirds;
    AnalogDelay.create() @=> AnalogDelay _whole;

    Gain _sync => post;
    pre => _quarters => _sync;
    pre => _thirds => _sync;
    pre => _whole => post;

    {
        1200::ms => max;
        400::ms => delay;

        thirds();
        0.33 => syncopate;
    }

    fun dur delay()
    {
        return _whole.delay();
    }

    fun dur delay(dur d)
    {
        d => _whole.delay;
        d / 3.0 => _thirds.delay;
        d / 4.0 => _quarters.delay;
        return d;
    }

    fun dur max()
    {
        return _whole.max();
    }

    fun dur max(dur d)
    {
        d => _whole.max;
        d => _thirds.max;
        d => _quarters.max;
        return d;
    }

    fun void thirds()
    {
        1.0 => _thirds.gain;
        0.0 => _quarters.gain;
    }

    fun void quarters()
    {
        0.0 => _thirds.gain;
        1.0 => _quarters.gain;
    }

    fun float syncopate()
    {
        return _sync.gain();
    }

    fun float syncopate(float f)
    {
        f => _sync.gain;
        return f;
    }
}