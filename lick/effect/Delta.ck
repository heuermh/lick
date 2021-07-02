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

// multi reverb

public class Delta extends Effect {

   Gain _pre;
   Gain _post;
   GVerb _short;
   GVerb _medium;
   GVerb _long;
   HPF hpf;
   LPF lpf;

   inlet => _pre;
   _pre => _short => _post;
   _pre => _medium => _post;
   _pre => _long => _post;
   _post => hpf => lpf => wet;

   {
        //0.0 => _short.dry;
        1.2::second => _short.revtime;

        //0.0 => _medium.dry;
        2.5::second => _medium.revtime;

        //0.0 => _long.dry;
        30::second => _long.revtime;

        40.0 => hpf.freq;
        40000.0 => lpf.freq;

        0.2 => short;
        0.5 => medium;
        0.3 => long;
    }

    fun float short()
    {
        return _short.gain();
    }

    fun float short(float f)
    {
        f => _short.gain;
        return f;
    }

    fun float medium()
    {
        return _medium.gain();
    }

    fun float medium(float f)
    {
        f => _medium.gain;
        return f;
    }

    fun float long()
    {
        return _long.gain();
    }

    fun float long(float f)
    {
        f => _long.gain;
        return f;
    }
}