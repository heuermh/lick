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
// effect wrapper for GVerb chugin, with predelay and feedback
//

public class Verb extends LfoFeedback
{
    float _early;
    float _tail;
    float _damping;
    float _room;
    dur _predelay;
    dur _decay;

    pre => Delay _delay => GVerb _gverb => post;
    feedbackOut => feedbackIn;

    {
        0.0 => feedback;

        // ok to zero this out?  effect provides its own dry
        0.0 => _gverb.dry;

        0.4 => early;
        0.5 => tail;
        0.8 => damping;
        30.0 => room;
        0::ms => predelay;
        2::second => decay;
    }

    fun void panic()
    {
        0.0 => feedback;
    }

    fun float early()
    {
        return _early;
    }

    fun float early(float f)
    {
        f => _early;
        f => _gverb.early;
        return f;
    }

    fun float tail()
    {
        return _tail;
    }

    fun float tail(float f)
    {
        f => _tail;
        f => _gverb.tail;
    }

    fun float damping()
    {
        return _damping;
    }

    fun float damping(float f)
    {
        f => _damping;
        f => _gverb.damping;
        return f;
    }

    fun float room()
    {
        return _room;
    }

    fun float room(float f)
    {
        f => _room;
        f => _gverb.roomsize;
    }

    fun dur predelay()
    {
        return _predelay;
    }

    fun dur predelay(dur d)
    {
        d => _predelay;
        d => _delay.delay;
        return d;
    }

    fun dur decay()
    {
        return _decay;
    }

    fun dur decay(dur d)
    {
        d => _decay;
        d => _gverb.revtime;
        return d;
    }

    fun static Verb create()
    {
        Verb verb;
        return verb;
    }

    fun static Verb create(dur predelay)
    {
        Verb verb;
        predelay => verb.predelay;
        return verb;
    }

    fun static Verb create(dur predelay, dur decay)
    {
        Verb verb;
        predelay => verb.predelay;
        decay => verb.decay;
        return verb;
    }

    fun static Verb create(dur predelay, float early, float tail, float damping, float room, dur decay)
    {
        Verb verb;
        predelay => verb.predelay;
        early => verb.early;
        tail => verb.tail;
        damping => verb.damping;
        room => verb.room;
        decay => verb.decay;
        return verb;
    }
}
