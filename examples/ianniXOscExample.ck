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

class Dump extends Procedure
{
    string name;

    fun void run()
    {
        <<<name>>>;
    }
}
class DumpX extends FloatProcedure
{
    string name;

    fun void run(float x)
    {
        <<<name,x>>>;
    }
}
class DumpXY extends FloatFloatProcedure
{
    string name;

    fun void run(float x, float y)
    {
        <<<name,x,y>>>;
    }
}

Dump triggerOn;
"triggerOn" => triggerOn.name;

Dump triggerOff;
"triggerOff" => triggerOff.name;

DumpX cursorX;
"cursor" => cursorX.name;

DumpXY cursorXY;
"cursor" => cursorXY.name;

DumpXY triggerXY;
"trigger" => triggerXY.name;

IanniXOsc ianniX;
//ianniX.addCursor(3, cursorX);
ianniX.addCursor(3, cursorXY);
ianniX.addTrigger(1, triggerOn, triggerOff);
//ianniX.addTrigger(1, triggerXY, triggerXY);

ianniX.connect();
<<<"ready">>>;

1::hour => now;
