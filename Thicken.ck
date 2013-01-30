/*

    LiCK  Library for ChucK.
    Copyright (c) 2007-2013 held jointly by the individual authors.

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

public class Thicken extends Chubgraph
{
    inlet => Gain dry => outlet;
    inlet => Delay delay => Gain wet => outlet;

    0.5 => dry.gain;
    0.5 => wet.gain;
    1::ms => delay.max;
    1::ms => delay.delay;

    // running by default
    true => int _running;

    fun void start()
    {
        if (!_running)
        {
            0.5 => dry.gain;
            0.5 => wet.gain;
            true => _running;
        }
    }

    fun void stop()
    {
        if (_running)
        {
            1.0 => dry.gain;
            0.0 => wet.gain;
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