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

public class StompKeyboard
{
    Hid hid;
    HidMsg msg;

    Procedure button0Up;
    Procedure button0Down;
    Procedure button1Up;
    Procedure button1Down;
    Procedure button2Up;
    Procedure button2Down;
    Procedure button3Up;
    Procedure button3Down;
    Procedure button4Up;
    Procedure button4Down;
    Procedure button5Up;
    Procedure button5Down;

    fun void open(int device)
    {
        hid.openKeyboard(device);

        while (true)
        {
            hid => now;
            while (hid.recv(msg))
            {
                if (msg.isButtonUp())
                {
                    if (39 == msg.which)
                    {
                        spork ~ button0Up.run();
                    }
                    else if (30 == msg.which)
                    {
                        spork ~ button1Up.run();
                    }
                    else if (31 == msg.which)
                    {
                        spork ~ button2Up.run();
                    }
                    else if (32 == msg.which)
                    {
                        spork ~ button3Up.run();
                    }
                    else if (33 == msg.which)
                    {
                        spork ~ button4Up.run();
                    }
                    else if (34 == msg.which)
                    {
                        spork ~ button5Up.run();
                    }
                }
                if (msg.isButtonDown())
                {
                    if (39 == msg.which)
                    {
                        spork ~ button0Down.run();
                    }
                    else if (30 == msg.which)
                    {
                        spork ~ button1Down.run();
                    }
                    else if (31 == msg.which)
                    {
                        spork ~ button2Down.run();
                    }
                    else if (32 == msg.which)
                    {
                        spork ~ button3Down.run();
                    }
                    else if (33 == msg.which)
                    {
                        spork ~ button4Down.run();
                    }
                    else if (34 == msg.which)
                    {
                        spork ~ button5Down.run();
                    }
                }
            }
        }
    }
}

/*

  default stomp key mapping

  button0  "0"  39
  button1  "1"  30
  button2  "2"  31
  button3  "3"  32
  button4  "4"  33
  button5  "5"  34

*/
