/*

    LiCK  Library for ChucK.
    Copyright (c) 2007-2021 held jointly by the individual authors.

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

// receive MIDI from the Controller128 hardware
public class Controller128
{
    MidiIn min;
    MidiMsg msg;

    Procedure row0;
    Procedure row1;
    Procedure row2;
    Procedure row3;
    Procedure row4;
    Procedure row5;
    Procedure row6;
    Procedure row7;

    fun int open(int device)
    {
        min.open(device);

        while (true)
        {
            min => now;
            while (min.recv(msg))
            {
                msg.data1 => int control;
                msg.data2 => int note;
                msg.data3 => int velocity;

                // see notes below
                if (control == 144)
                {
                    if (velocity != 0)
                    {
                        if (note == 32)
                        {
                            spork ~ row1.run();
                        }
                        else if (note == 33)
                        {
                            spork ~ row2.run();
                        }
                        else if (note == 34)
                        {
                            spork ~ row3.run();
                        }
                        else if (note == 35)
                        {
                            spork ~ row4.run();
                        }
                        else if (note == 36)
                        {
                            spork ~ row5.run();
                        }
                        else if (note == 37)
                        {
                            spork ~ row6.run();
                        }
                        else if (note == 38)
                        {
                            spork ~ row7.run();
                        }
                    }
                }
            }
        }
    }
}

/*

  default controller128 midi mapping

  row0
  row1 32
  row2 33
  row3 34
  row4 35
  row5 36
  row6 37
  row7 38

*/
