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

public class Cooper extends Effect
{
    Gain _shortPre;
    Delay _short;
    LPF _shortFilter;
    Delay _shortReflect;
    LPF _shortReflectFilter;
    Gain _shortPost;
    Gain _shortFeedback;

    Gain _longPre;
    Delay _long;
    LPF _longFilter;
    Delay _longReflect;
    LPF _longReflectFilter;
    Gain _longPost;
    Gain _longFeedback;

    inlet => _shortPre;
    _shortPre => _short => _shortFilter => _shortPost;
    _shortPre => _shortReflect => _shortReflectFilter => _shortPost;
    _shortPost => _shortFeedback => _shortPre;
    _shortPost => wet;

    inlet => _longPre;
    _longPre => _long => _longFilter => _longPost;
    _longPre => _longReflect => _longReflectFilter => _longPost;
    _longPost => _longFeedback => _longPre;
    _longPost => wet;

   {
        14::ms => _short.max;
        14::ms => _short.delay;
        10000.0 => _shortFilter.freq;
        0.3 => _shortReflect.gain;
        28::ms => _shortReflect.max;
        28::ms => _shortReflect.delay;
        2000.0 => _shortReflectFilter.freq;
        0.0 => _shortFeedback.gain;

        16::ms => _long.max;
        16::ms => _long.delay;
        10000.0 => _longFilter.freq;
        0.3 => _longReflect.gain;
        32::ms => _longReflect.max;
        32::ms => _longReflect.delay;
        2000.0 => _longReflectFilter.freq;
        0.0 => _longFeedback.gain;
    }


    fun float short()
    {
        return _short.gain();
    }

    fun float short(float f)
    {
        f => _short.gain;
        f * 0.3 => _shortReflect.gain;
        return f;
    }

    fun float shortFeedback()
    {
        return _shortFeedback.gain();
    }

    fun float shortFeedback(float f)
    {
        f => _shortFeedback.gain;
        return f;
    }

    fun float long()
    {
        return _long.gain();
    }

    fun float long(float f)
    {
        f => _long.gain;
        f * 0.3 => _longReflect.gain;
        return f;
    }

    fun float longFeedback()
    {
        return _longFeedback.gain();
    }

    fun float longFeedback(float f)
    {
        f => _longFeedback.gain;
        return f;
    }

    fun static Cooper create()
    {
        Cooper cooper;
        return cooper;
    }

    fun static Cooper create(float short, float long)
    {
        Cooper cooper;
        short => cooper.short;
        long => cooper.long;
        return cooper;
    }

    fun static Cooper create(float short, float shortFeedback, float long, float longFeedback)
    {
        Cooper cooper;
        short => cooper.short;
        shortFeedback => cooper.shortFeedback;
        long => cooper.long;
        longFeedback => cooper.longFeedback;
        return cooper;
    }
}
