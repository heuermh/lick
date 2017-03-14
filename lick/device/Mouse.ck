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

public class Mouse
{
    Hid hid;
    HidMsg msg;
    float mouseX;
    float mouseY;
    float wheelX;
    float wheelY;
    IntProcedure buttonUp;
    IntProcedure buttonDown;
    Procedure leftButtonUp;
    Procedure leftButtonDown;
    Procedure middleButtonUp;
    Procedure middleButtonDown;
    Procedure rightButtonUp;
    Procedure rightButtonDown;
    FloatFloatProcedure mouseMotion;
    FloatFloatProcedure wheelMotion;

    fun void open(int device)
    {
        hid.openMouse(device);

        while (true)
        {
            hid => now;
            while (hid.recv(msg))
            {
                if (msg.isButtonUp())
                {
                    spork ~ buttonUp.run(msg.which);
                    if (msg.which == 0)
                    {
                        spork ~ leftButtonUp.run();
                    }
                    else if (msg.which == 1)
                    {
                        spork ~ middleButtonUp.run();
                    }
                    else if (msg.which == 2)
                    {
                        spork ~ rightButtonUp.run();
                    }
                }
                if (msg.isButtonDown())
                {
                    spork ~ buttonDown.run(msg.which);
                    if (msg.which == 0)
                    {
                        spork ~ leftButtonDown.run();
                    }
                    else if (msg.which == 1)
                    {
                        spork ~ middleButtonDown.run();
                    }
                    else if (msg.which == 2)
                    {
                        spork ~ rightButtonDown.run();
                    }
                }
                if (msg.isMouseMotion())
                {
                    mouseX + msg.deltaX => mouseX;
                    mouseY + msg.deltaY => mouseY;
                    spork ~ mouseMotion.run(msg.deltaX, msg.deltaY);
                }
                if (msg.isWheelMotion())
                {
                    wheelX + msg.deltaX => wheelX;
                    wheelY + msg.deltaY => wheelY;
                    spork ~ wheelMotion.run(msg.deltaX, msg.deltaY);
                }
            }
        }
    }
}
