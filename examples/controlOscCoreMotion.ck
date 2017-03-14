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

ControlOscServer controlOsc;

class Accelerometer extends FloatFloatFloatProcedure
{
    fun void run(float x, float y, float z)
    {
        <<<"/accelerometer", x, y, z>>>;
    }
}

// /gyro is actually core motion
class CoreMotion extends FloatFloatFloatProcedure
{
    fun void run(float pitch, float roll, float yaw)
    {
        <<<"/gyro", pitch, roll, yaw>>>;
    }
}
    
Accelerometer accelerometer;
CoreMotion coreMotion;

controlOsc.addAccelerometer("/accelerometer", accelerometer);
controlOsc.addCoreMotion("/gyro", coreMotion);
<<<"connecting...">>>;
controlOsc.connect();

while (true)
{
    10::second => now;
    <<<"heartbeat">>>;
}
