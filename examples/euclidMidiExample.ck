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

class Dump extends IntIntProcedure
{
    string name;

    fun void run(int pitch, int velocity)
    {
        <<<name,"pitch",pitch,"velocity",velocity>>>;
    }
}

Dump keyOn22;
"keyOn22" => keyOn22.name;

Dump keyOff22;
"keyOff22" => keyOff22.name;

Dump keyOn23;
"keyOn23" => keyOn23.name;

Dump keyOff23;
"keyOff23" => keyOff23.name;

EuclidMidi euclid;
euclid.addPattern(22, keyOn22, keyOff22);
euclid.addPattern(23, keyOn23, keyOff23);

euclid.open(0);
