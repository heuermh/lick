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

class DumpButtonUp extends IntProcedure
{
    fun void run(int value)
    {
        <<<"up", value>>>;
    }
}

class DumpButtonDown extends IntProcedure
{
    fun void run(int value)
    {
        <<<"down", value>>>;
    }
}
class DumpAxisMotion extends FloatFloatProcedure
{
    fun void run(float value0, float value1)
    {
        <<<"axis", value0, value1>>>;
    }
}
class DumpHatMotion extends FloatFloatProcedure
{
    fun void run(float value0, float value1)
    {
        <<<"hat", value0, value1>>>;
    }
}

DumpButtonUp buttonUp;
DumpButtonDown buttonDown;
DumpAxisMotion axisMotion;
DumpHatMotion hatMotion;

Joystick joystick;
buttonUp @=> joystick.buttonUp;
buttonDown @=> joystick.buttonDown;
axisMotion @=> joystick.axisMotion;
hatMotion @=> joystick.hatMotion;

joystick.open(0);
1::minute => now;
