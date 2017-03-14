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

TouchOscServer touchOscServer;

class PingLogger extends Procedure
{
    fun void run()
    {
        <<<"/ping">>>;
    }
}

class FloatLogger extends FloatProcedure
{
    fun void run(float value)
    {
        <<<value>>>;
    }
}

class XYPadLogger extends FloatFloatProcedure
{
    fun void run(float x, float y)
    {
        <<<x, y>>>;
    }
}

class MultiToggleLogger extends IntIntFloatProcedure
{
    fun void run(int x, int y, float value)
    {
        <<<x, y, value>>>;
    }
}

class AccelerometerLogger extends FloatFloatFloatProcedure
{
    fun void run(float x, float y, float z)
    {
        <<<"/accxyz", x, y, z>>>;
    }
}


PingLogger ping;
FloatLogger fader;
FloatLogger pushButton;
FloatLogger toggleButton;
XYPadLogger xyPad;
MultiToggleLogger multiToggle;
AccelerometerLogger accelerometer;

touchOscServer.addPing(ping);
touchOscServer.addAccelerometer(accelerometer);
//touchOscServer.addFaderH("/1/fader2", fader);  error in PDF doc?
touchOscServer.addFaderV("/1/fader1", fader);
touchOscServer.addFaderV("/1/fader2", fader);
touchOscServer.addFaderV("/1/fader3", fader);
touchOscServer.addFaderV("/1/fader4", fader);
touchOscServer.addToggleButton("/1/toggle1", toggleButton);
touchOscServer.addToggleButton("/1/toggle2", toggleButton);
touchOscServer.addToggleButton("/1/toggle3", toggleButton);
touchOscServer.addToggleButton("/1/toggle4", toggleButton);
touchOscServer.addPushButton("/2/push1", pushButton);
touchOscServer.addPushButton("/2/push2", pushButton);
touchOscServer.addPushButton("/2/push3", pushButton);
touchOscServer.addPushButton("/2/push4", pushButton);
touchOscServer.addPushButton("/2/push5", pushButton);
touchOscServer.addPushButton("/2/push6", pushButton);
touchOscServer.addPushButton("/2/push7", pushButton);
touchOscServer.addPushButton("/2/push8", pushButton);
touchOscServer.addPushButton("/2/push9", pushButton);
touchOscServer.addPushButton("/2/push10", pushButton);
touchOscServer.addPushButton("/2/push11", pushButton);
touchOscServer.addPushButton("/2/push12", pushButton);
touchOscServer.addPushButton("/2/push13", pushButton);
touchOscServer.addPushButton("/2/push14", pushButton);
touchOscServer.addPushButton("/2/push15", pushButton);
touchOscServer.addPushButton("/2/push16", pushButton);
touchOscServer.addToggleButton("/2/toggle1", toggleButton);
touchOscServer.addToggleButton("/2/toggle2", toggleButton);
touchOscServer.addToggleButton("/2/toggle3", toggleButton);
touchOscServer.addToggleButton("/2/toggle4", toggleButton);
touchOscServer.addXYPad("/3/xy", xyPad);
touchOscServer.addToggleButton("/3/toggle1", toggleButton);
touchOscServer.addToggleButton("/3/toggle2", toggleButton);
touchOscServer.addToggleButton("/3/toggle3", toggleButton);
touchOscServer.addToggleButton("/3/toggle4", toggleButton);
touchOscServer.addMultiToggle("/4/multitoggle", 8, 8, multiToggle);
touchOscServer.addToggleButton("/4/toggle1", toggleButton);
touchOscServer.addToggleButton("/4/toggle2", toggleButton);
touchOscServer.addToggleButton("/4/toggle3", toggleButton);
touchOscServer.addToggleButton("/4/toggle4", toggleButton);
touchOscServer.connect();

while (true)
{
    1::second => now;
}
