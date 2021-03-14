/*

    LiCK  Library for ChucK.
    Copyright (c) 2007-2021 held jointly by the individual authors.

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
// effect wrapper for NHHall chugin
//

public class Hall extends Feedback
{
    dur _decay;

    pre => NHHall _hall => post;
    feedbackOut => feedbackIn;

    {
        0.0 => _hall.stereo;
        0.02 => feedback;
        1::second => decay;
    }

    fun void hold()
    {
        1::week => decay;
    }

    fun void panic()
    {
        0.0 => feedback;
        1::second => decay;
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
}
