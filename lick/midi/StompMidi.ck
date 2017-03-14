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

// receive MIDI from the Stomp Teensy hardware
public class StompMidi
{
    MidiIn min;
    MidiMsg msg;

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

    fun int open(int device)
    {
        min.open(device);

        while (true)
        {
            min => now;
            while (min.recv(msg))
            {
                msg.data1 => int control;
                msg.data2 => int controlChange;
                msg.data3 => int value;

                // see notes below
                if (control == 176)
                {
                    if (value == 0)
                    {
                        if (controlChange == 1)
                        {
                            spork ~ button0Up.run();
                        }
                        else if (controlChange == 2)
                        {
                            spork ~ button1Up.run();
                        }
                        else if (controlChange == 3)
                        {
                            spork ~ button2Up.run();
                        }
                        else if (controlChange == 4)
                        {
                            spork ~ button3Up.run();
                        }
                        else if (controlChange == 5)
                        {
                            spork ~ button4Up.run();
                        }
                        else if (controlChange == 6)
                        {
                            spork ~ button5Up.run();
                        }
                    }
                    else
                    {
                        if (controlChange == 1)
                        {
                            spork ~ button0Down.run();
                        }
                        else if (controlChange == 2)
                        {
                            spork ~ button1Down.run();
                        }
                        else if (controlChange == 3)
                        {
                            spork ~ button2Down.run();
                        }
                        else if (controlChange == 4)
                        {
                            spork ~ button3Down.run();
                        }
                        else if (controlChange == 5)
                        {
                            spork ~ button4Down.run();
                        }
                        else if (controlChange == 6)
                        {
                            spork ~ button5Down.run();
                        }
                    }
                }
            }
        }
    }
}

/*

  default stomp midi mapping

  button0  cc1  176, 1, 65 for on, 0 for off
  button1  cc2  176, 2, 65 for on, 0 for off
  button2  cc3  176, 3, 65 for on, 0 for off
  button3  cc4  176, 4, 65 for on, 0 for off
  button4  cc5  176, 5, 65 for on, 0 for off
  button5  cc6  176, 6, 65 for on, 0 for off

*/
