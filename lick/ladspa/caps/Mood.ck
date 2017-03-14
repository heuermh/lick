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
// similar to Moodring
// buy the PCB here:  http://madbeanpedals.com/projects/index.html
//

public class Mood extends Effect
{
    Delay _predelay;
    TanhDist _dist;
    GVerb _gverb;
    Eq _eq;
    Gain _recovery;
    Gain _feedback;

    /*

        inlet --+---------- dry -------------------------------------------------+---> outlet
                |                                                                |
                |                                                                |
                +--> pre-delay ---> dist ---> gverb ---> eq ---> gain recovery --+
                      ^                                              |
                      |                                              |
                      |                                             \./
                      +-------------------------------------------- feedback

    */

    {
        inlet => _predelay => _dist => _gverb => _eq => _recovery => wet;
        _recovery => _feedback => _predelay;

        300::ms => _predelay.max;
        10::ms => _predelay.delay;
        1.1 => _dist.gain;
        0.0 => _gverb.dry;
        0.06 => _gverb.early;
        0.12 => _gverb.tail;
        30.0 => _gverb.roomsize;
        1.10 => _recovery.gain;
        0.01 => _feedback.gain;
    }

    fun dur predelay()
    {
        return _predelay.delay();
    }

    fun dur predelay(dur d)
    {
        d => _predelay.delay;
        return d;
    }

    fun float dist()
    {
        return Interpolate.linear(_dist.gain() - 1.0, 0.0, 0.2, 0.0, 1.0);
    }

    fun float dist(float f)
    {
        1.0 + Interpolate.linear(f, 0.0, 1.0, 0.0, 0.2) => _dist.gain;
        return f;
    }

    fun float reverb()
    {
        return (1.0 - _gverb.dry());
    }

    fun float reverb(float f)
    {
        (1.0 - f) => _gverb.dry;
        0.40 * f => _gverb.early;
        0.60 * f => _gverb.tail;
        return f;
    }

    fun float recovery()
    {
        return Interpolate.linear(_recovery.gain() - 1.0, 0.0, 0.2, 0.0, 1.0);
    }

    fun float recovery(float f)
    {
        1.0 + Interpolate.linear(f, 0.0, 1.0, 0.0, 0.2) => _recovery.gain;
        return f;
    }

    fun float feedback()
    {
        return _feedback.gain();
    }

    fun float feedback(float f)
    {
        f => _feedback.gain;
        return f;
    }

    fun static Mood createMood()
    {
        Mood mood;
        return mood;
    }

    fun static Mood createMood(dur predelay, float dist, float reverb, float recovery, float feedback)
    {
        Mood mood;
        predelay => mood.predelay;
        dist => mood.dist;
        reverb => mood.reverb;
        recovery => mood.recovery;
        feedback => mood.feedback;
        return mood;
    }
}
