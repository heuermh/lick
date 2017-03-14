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

class Msg extends Procedure
{
    string msg;

    fun void run()
    {
        <<<msg>>>;
    }
}

class MsgFloatFloat extends FloatFloatProcedure
{
    string msg;
    
    fun void run(float x, float y)
    {
        <<<msg, x, y>>>;
    }
}

Msg select;  "select" => select.msg;
Msg start;  "start" => start.msg;
Msg a;  "a" => a.msg;
Msg b;  "b" => b.msg;
MsgFloatFloat dPad;  "dPad" => dPad.msg;

Nes nes;

select @=> nes.selectDown;
start @=> nes.startDown;
a @=> nes.aDown;
b @=> nes.bDown;
dPad @=> nes.dPad;

nes.open(0);

<<<"ready">>>;
