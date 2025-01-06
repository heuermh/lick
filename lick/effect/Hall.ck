/*

    LiCK  Library for ChucK.
    Copyright (c) 2007-2025 held jointly by the individual authors.

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
// effect wrapper for NHHall chugin, with predelay and feedback
//

public class Hall extends LfoFeedback
{
    dur _decay;
    dur _predelay;

    pre => Delay _delay => NHHall _hall => post;
    feedbackOut => feedbackIn;

    {
        0.0 => _hall.stereo;
        0.0 => feedback;
        0::ms => predelay;
        1::second => decay;
    }

    fun void hold()
    {
        1::week => decay;
    }

    fun void panic()
    {
        0.0 => feedback;
    }

    fun dur decay()
    {
        return _decay;
    }

    fun dur decay(dur d)
    {
        d => _decay;
        d/1::second => _hall.rt60;
        return _decay;
    }

    fun dur predelay()
    {
        return _predelay;
    }

    fun dur predelay(dur d)
    {
        d => _predelay;
        d => _delay.delay;
        return _predelay;
    }

    fun static Hall create()
    {
        Hall hall;
        return hall;
    }

    fun static Hall create(dur decay)
    {
        Hall hall;
        decay => hall.decay;
        return hall;
    }

    fun static Hall create(dur predelay, dur decay)
    {
        Hall hall;
        predelay => hall.predelay;
        decay => hall.decay;
        return hall;
    }
}
