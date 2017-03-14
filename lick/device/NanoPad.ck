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

// receive MIDI from the NanoPad hardware
public class NanoPad
{
    MidiIn min;
    MidiMsg msg;

    // cached values
    int _lastX;
    int _lastY;

    // assign a custom int procedure to each button press
    IntProcedure button1;
    IntProcedure button2;
    IntProcedure button3;
    IntProcedure button4;
    IntProcedure button5;
    IntProcedure button6;
    IntProcedure button7;
    IntProcedure button8;
    IntProcedure button9;
    IntProcedure button10;
    IntProcedure button11;
    IntProcedure button12;
    // assign a custom int int procedure to XY pad changes
    IntIntProcedure xy;

    fun int getX()
    {
        return _lastX;
    }

    fun int getY()
    {
        return _lastY;
    }

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

                // only fire on note on
                if (control == 144)
                {
                    // default notes in scene 1, see below
                    if (note == 39)
                    {
                        spork ~ button1.run(velocity);
                    }
                    if (note == 48)
                    {
                       spork ~ button2.run(velocity);
                    }
                    if (note == 45)
                    {
                        spork ~ button3.run(velocity);
                    }
                    if (note == 43)
                    {
                        spork ~ button4.run(velocity);
                    }
                    if (note == 51)
                    {
                        spork ~ button5.run(velocity);
                    }
                    if (note == 49)
                    {
                        spork ~ button6.run(velocity);
                    }
                    if (note == 36)
                    {
                        spork ~ button7.run(velocity);
                    }
                    if (note == 38)
                    {
                        spork ~ button8.run(velocity);
                    }
                    if (note == 40)
                    {
                        spork ~ button9.run(velocity);
                    }
                    if (note == 42)
                    {
                        spork ~ button10.run(velocity);
                    }
                    if (note == 44)
                    {
                        spork ~ button11.run(velocity);
                    }
                    if (note == 46)
                    {
                        spork ~ button12.run(velocity);
                    }
                }
                if (control == 224)
                {
                    if (note == velocity)
                    {
                        note => _lastX;
                        spork ~ xy.run(_lastX, _lastY);
                    }
                }
                if (control == 176)
                {
                    velocity => _lastY;
                    spork ~ xy.run(_lastX, _lastY);
                }
            }
        }
    }
}

/*

Notes:

Default, Scene 1
nanoPAD button, midi data2

1, 39
2, 48
3, 45
4, 43
5, 51
6, 49
7, 36
8, 38
9, 40
10, 42
11, 44
12, 46

Note ons are 144, ..., velocity
Note offs are 128, ..., 64

XY pad

changes in X are rec'd as
224, X, X

changes in Y are rec'd as
176, 1, Y

sometimes 224, 0, 64 is seen

*/
