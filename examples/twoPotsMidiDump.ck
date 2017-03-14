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

class Dump extends IntProcedure
{
    "dump" => string name;

    fun void run(int value)
    {
        <<<now, name, value>>>;
    }
}

TwoPotsMidi twoPotsMidi;
Dump pot1;
Dump pot2;
Dump pot1Msb;
Dump pot1Lsb;
Dump pot2Msb;
Dump pot2Lsb;

"pot1" => pot1.name;
"         pot2" => pot2.name;
"                 pot1Msb" => pot1Msb.name;
"                            pot1Lsb" => pot1Lsb.name;
"                                       pot2Msb" => pot2Msb.name;
"                                                  pot2Lsb" => pot2Lsb.name;

pot1 @=> twoPotsMidi.pot1;
pot2 @=> twoPotsMidi.pot2;
pot1Msb @=> twoPotsMidi.pot1Msb;
pot1Lsb @=> twoPotsMidi.pot1Lsb;
pot2Msb @=> twoPotsMidi.pot2Msb;
pot2Lsb @=> twoPotsMidi.pot2Lsb;


twoPotsMidi.open(0);
