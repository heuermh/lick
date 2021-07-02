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

// cascading reverb, dry --> short --> medium --> long

public class Cascade extends Effect {

   GVerb short;
   GVerb medium;
   GVerb long;
   HPF hpf;
   LPF lpf;

   inlet => short => medium => long => hpf => lpf => wet;

   {
        //0.0 => short.dry;
        1.2::second => short.revtime;

        //0.0 => medium.dry;
        2.5::second => medium.revtime;

        //0.0 => long.dry;
        30::second => long.revtime;

        40.0 => hpf.freq;
        40000.0 => lpf.freq;
     }
}