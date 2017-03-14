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

public class Swirl
{
    Gain input;    
    Gain outputL;
    Gain outputR;
    Gain cv;

    Pan2 _pan;

    // running by default
    true => int _running;

    {
        cv => blackhole;
        input => _pan;
        _pan.left => outputL;
        _pan.right => outputR;

        spork ~ _tickAtSampleRate();
    }

    fun void _tickAtSampleRate()
    {
        while (true)
        {
            1::samp => now;
            if (_running)
            {
                cv.last() => _pan.pan;
            }
        }
    }

    fun float pan()
    {
        return _pan.pan();
    }

    fun float pan(float pan)
    {
        pan => _pan.pan;
        return pan;
    }

    fun void start()
    {
        if (!_running)
        {
            true => _running;
        }
    }

    fun void stop()
    {
        if (_running)
        {
            0.0 => _pan.pan;
            false => _running;
        }
    }

    fun void toggle()
    {
        if (_running)
        {
            stop();
        }
        else
        {
            start();
        }
    }

    fun int running()
    {
        return _running;
    }
}
