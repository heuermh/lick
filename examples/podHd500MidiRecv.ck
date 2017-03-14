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
    string name;

    fun void run(int i)
    {
        <<<name, i>>>;
    }
}
class Heard extends Procedure
{
    string name;

    fun void run()
    {
        <<<name>>>;
    }
}

// oh for constructors . . .

Dump exp1;
"exp1" => exp1.name;

Dump exp2;
"exp2" => exp2.name;

Heard fs1;
"fs1" => fs1.name;

Heard fs2;
"fs2" => fs2.name;

Heard fs3;
"fs3" => fs3.name;

Heard fs4;
"fs4" => fs4.name;


PodHd500 podHd500;
exp1 @=> podHd500.exp1;
exp2 @=> podHd500.exp2;
fs1 @=> podHd500.fs1On;
fs2 @=> podHd500.fs2On;
fs3 @=> podHd500.fs3On;
fs4 @=> podHd500.fs4On;

podHd500.open(0);
