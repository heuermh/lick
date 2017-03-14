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

class Dump extends IntIntIntIntProcedure
{
    string name;

    fun void run(int note, int control, int pitch, int velocity)
    {
        <<<name,"note",note,"control",control,"pitch",pitch,"velocity",velocity>>>;
    }
}

Dump dump0;
"/pattern0" => dump0.name;

Dump dump1;
"/pattern1" => dump1.name;

EuclidOsc euclid;
euclid.addPattern("/pattern0", dump0);
euclid.addPattern("/pattern1", dump1);

euclid.connect();
<<<"ready">>>;

1::hour => now;
