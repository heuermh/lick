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

public class LogitechGamepadF310 // extends Joystick
{
    Hid hid;
    HidMsg msg;

    // cached values
    int _back;
    int _start;
    int _x;
    int _y;
    int _a;
    int _b;
    int _lb;
    int _rb;
    int _lt;
    int _rt;
    float _lastDPad;
    float _lastLeftStickX;
    float _lastLeftStickY;
    float _lastRightStickX;
    float _lastRightStickY;

    // assign custom procedures
    Procedure backUp;
    Procedure backDown;
    Procedure startUp;
    Procedure startDown;
    Procedure xUp;
    Procedure xDown;
    Procedure yUp;
    Procedure yDown;
    Procedure aUp;
    Procedure aDown;
    Procedure bUp;
    Procedure bDown;
    Procedure lbUp;
    Procedure lbDown;
    Procedure rbUp;
    Procedure rbDown;
    Procedure ltUp;
    Procedure ltDown;
    Procedure rtUp;
    Procedure rtDown;
    FloatProcedure dPad;
    FloatFloatProcedure leftStick;
    FloatFloatProcedure rightStick;

    fun int isXUp()
    {
        return !_x;
    }

    fun int isXDown()
    {
        return _x;
    }

    fun int isYUp()
    {
        return !_y;
    }

    fun int isYDown()
    {
        return _y;
    }

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

    fun int isLBUp()
    {
        return !_b;
    }

    fun int isLBDown()
    {
        return _lb;
    }

    fun int isRBUp()
    {
        return !_rb;
    }

    fun int isRBDown()
    {
        return _rb;
    }

    fun int isLTUp()
    {
        return !_lt;
    }

    fun int isLTDown()
    {
        return _lt;
    }

    fun int isRTUp()
    {
        return !_rt;
    }

    fun int isRTDown()
    {
        return _rt;
    }

    fun float getDPad()
    {
        return _lastDPad;
    }

    fun int isDPadUp()
    {
        return (_lastDPad $ int) & 1;
    }

    fun int isDPadDown()
    {
        return (_lastDPad $ int) & 4;
    }

    fun int isDPadLeft()
    {
        return (_lastDPad $ int) & 8;
    }

    fun int isDPadRight()
    {
        return (_lastDPad $ int) & 2;
    }

    fun float getLeftStickX()
    {
        return _lastLeftStickX;
    }

    fun float getLeftStickY()
    {
        return _lastLeftStickY;
    }

    fun float getRightStickX()
    {
        return _lastRightStickX;
    }

    fun float getRightStickY()
    {
        return _lastRightStickY;
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
                    if (msg.which == 0)
                    {
                        0 => _x;
                        spork ~ xUp.run();
                    }
                    else if (msg.which == 1)
                    {
                        0 => _a;
                        spork ~ aUp.run();
                    }
                    else if (msg.which == 2)
                    {
                        0 => _b;
                        spork ~ bUp.run();
                    }
                    else if (msg.which == 3)
                    {
                        0 => _y;
                        spork ~ yUp.run();
                    }
                    else if (msg.which == 4)
                    {
                        0 => _lb;
                        spork ~ lbUp.run();
                    }
                    else if (msg.which == 5)
                    {
                        0 => _rb;
                        spork ~ rbUp.run();
                    }
                    else if (msg.which == 6)
                    {
                        0 => _lt;
                        spork ~ ltUp.run();
                    }
                    else if (msg.which == 7)
                    {
                        0 => _rt;
                        spork ~ rtUp.run();
                    }
                    else if (msg.which == 8)
                    {
                        0 => _back;
                        spork ~ backUp.run();
                    }
                    else if (msg.which == 9)
                    {
                        0 => _start;
                        spork ~ startUp.run();
                    }
                }
                if (msg.isButtonDown())
                {
                    if (msg.which == 0)
                    {
                        1 => _x;
                        spork ~ xDown.run();
                    }
                    else if (msg.which == 1)
                    {
                        1 => _a;
                        spork ~ aDown.run();
                    }
                    else if (msg.which == 2)
                    {
                        1 => _b;
                        spork ~ bDown.run();
                    }
                    else if (msg.which == 3)
                    {
                        1 => _y;
                        spork ~ yDown.run();
                    }
                    else if (msg.which == 4)
                    {
                        1 => _lb;
                        spork ~ lbDown.run();
                    }
                    else if (msg.which == 5)
                    {
                        1 => _rb;
                        spork ~ rbDown.run();
                    }
                    else if (msg.which == 6)
                    {
                        1 => _lt;
                        spork ~ ltDown.run();
                    }
                    else if (msg.which == 7)
                    {
                        1 => _rt;
                        spork ~ rtDown.run();
                    }
                    else if (msg.which == 8)
                    {
                        1 => _back;
                        spork ~ backDown.run();
                    }
                    else if (msg.which == 9)
                    {
                        1 => _start;
                        spork ~ startDown.run();
                    }
                }
                if (msg.isAxisMotion())
                {
                    if (msg.which == 0)
                    {
                        msg.axisPosition => _lastLeftStickX;
                        spork ~ leftStick.run(_lastLeftStickX, _lastLeftStickY);
                    }
                    else if (msg.which == 1)
                    {
                        msg.axisPosition => _lastLeftStickY;
                        spork ~ leftStick.run(_lastLeftStickX, _lastLeftStickY);
                    }
                    else if (msg.which == 2)
                    {
                        msg.axisPosition => _lastRightStickX;
                        spork ~ rightStick.run(_lastRightStickX, _lastRightStickY);
                    }
                    else if ((msg.which == 5) || (msg.which == 3))
                    {
                        msg.axisPosition => _lastRightStickY;
                        spork ~ rightStick.run(_lastRightStickX, _lastRightStickY);
                    }
                }
                if (msg.isHatMotion())
                {
                    msg.idata => _lastDPad;
                    spork ~ dPad.run(msg.idata);
                }
            }
        }
    }
}

/**

Logitech Gamepad F310 notes

D-Pad

Up 1
Right 2
(Up Right 3)
Down 4
(Down Right 6)
Left 8
(Down Left 12)
(Up Left 9)

Left Axis

X 0
Y 1

Right Axis

X 2
Y 5

Buttons

Back 8
Start 9
X 0
Y 3
A 1
B 2
LB 4
RB 5
LT 6
RT 7

*/
