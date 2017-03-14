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

// generic USB NES controller
public class Nes
{
    Hid hid;
    HidMsg msg;

    // cached values
    int _select;
    int _start;
    int _a;
    int _b;
    float _lastDPadX;
    float _lastDPadY;

    // assign custom procedures
    Procedure selectUp;
    Procedure selectDown;
    Procedure startUp;
    Procedure startDown;
    Procedure aUp;
    Procedure aDown;
    Procedure bUp;
    Procedure bDown;
    FloatFloatProcedure dPad;

    fun int isAUp()
    {
        return !_a;
    }

    fun int isADown()
    {
        return _a;
    }

    fun int isBUp()
    {
        return !_b;
    }

    fun int isBDown()
    {
        return _b;
    }

    fun float getDPadX()
    {
        return _lastDPadX;
    }

    fun float getDPadY()
    {
        return _lastDPadY;
    }

    fun int isDPadUp()
    {
        return _lastDPadY < 0.0;
    }

    fun int isDPadDown()
    {
        return _lastDPadY > 0.0;
    }

    fun int isDPadLeft()
    {
        return _lastDPadX < 0.0;
    }

    fun int isDPadRight()
    {
        return _lastDPadY > 0.0;
    }

    fun void open(int device)
    {
        hid.openJoystick(device);

        while (true)
        {
            hid => now;
            while (hid.recv(msg))
            {
                if (msg.isButtonUp())
                {
                    if (msg.which == 1)
                    {
                        0 => _a;
                        spork ~ aUp.run();
                    }
                    else if (msg.which == 2)
                    {
                        0 => _b;
                        spork ~ bUp.run();
                    }
                    else if (msg.which == 8)
                    {
                        0 => _select;
                        spork ~ selectUp.run();
                    }
                    else if (msg.which == 9)
                    {
                        0 => _start;
                        spork ~ startUp.run();
                    }
                }
                if (msg.isButtonDown())
                {
                    if (msg.which == 1)
                    {
                        1 => _a;
                        spork ~ aDown.run();
                    }
                    else if (msg.which == 2)
                    {
                        1 => _b;
                        spork ~ bDown.run();
                    }
                    else if (msg.which == 8)
                    {
                        1 => _select;
                        spork ~ selectDown.run();
                    }
                    else if (msg.which == 9)
                    {
                        1 => _start;
                        spork ~ startDown.run();
                    }
                }
                if (msg.isAxisMotion())
                {
                    msg.axisPosition => float p;
                    if (Math.fabs(p) < 0.1)
                    {
                        0.0 => p;
                    }
                    if (msg.which == 3)
                    {
                        p => _lastDPadX;
                        spork ~ dPad.run(_lastDPadX, _lastDPadY);
                    }
                    else if (msg.which == 4)
                    {
                        p => _lastDPadY;
                        spork ~ dPad.run(_lastDPadX, _lastDPadY);
                    }
                }
            }
        }
    }
}

/**

NES controller notes

D-Pad

Axis motion

Up 4 -1.0
Right 3 1.0
Down 4 1.0
Left 3 -1.0

Buttons

Select 8
Start 9
A 1
B 2

*/
