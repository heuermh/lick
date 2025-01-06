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

// cascading reverb, dry --> short --> medium --> long

public class Cascade extends Effect {

   Verb short;
   Verb medium;
   Verb long;
   HPF hpf;
   LPF lpf;

   inlet => short => medium => long => hpf => lpf => wet;

   {
        1.0 => short.mix;
        1.2::second => short.decay;

        1.0 => medium.mix;
        2.5::second => medium.decay;

        1.0 => long.mix;
        30::second => long.decay;

        40.0 => hpf.freq;
        40000.0 => lpf.freq;
     }
}