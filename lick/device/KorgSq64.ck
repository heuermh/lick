/*

    LiCK  Library for ChucK.
    Copyright (c) 2007-2022 held jointly by the individual authors.

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

public class KorgSq64
{
    MidiIn min;
    MidiMsg msg;

    // cached values
    int _lastKey[125];

    // assign custom procedures
    Procedure clock;
    IntIntProcedure keyOn;
    IntProcedure keyOff;

    // D sub-tracks
    IntProcedure d1;
    IntProcedure d2;
    IntProcedure d3;
    IntProcedure d4;
    IntProcedure d5;
    IntProcedure d6;
    IntProcedure d7;
    IntProcedure d8;
    IntProcedure d9;
    IntProcedure d10;
    IntProcedure d11;
    IntProcedure d12;
    IntProcedure d13;
    IntProcedure d14;
    IntProcedure d15;
    IntProcedure d16;

    fun int isKeyOn(int key)
    {
        return (_lastKey[key] > 0);
    }

    fun int isKeyOff(int key)
    {
        return (_lastKey[key] == 0);
    }

    fun int getVelocity(int key)
    {
        return _lastKey[key];
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

                //<<<control, note, velocity>>>;

                if (control == 153) // key on for D sub-tracks
                {
                    if (velocity == 0)
                    {
                        0 => _lastKey[note];
                        spork ~ keyOff.run(note);
                    }
                    else
                    {
                        velocity => _lastKey[note];
                        spork ~ keyOn.run(note, velocity);

                        if (note == 35)
                        {
                            d1.run(velocity);
                        }
                        else if (note == 36)
                        {
                            d2.run(velocity);
                        }
                        else if (note == 37)
                        {
                            d3.run(velocity);
                        }
                        else if (note == 38)
                        {
                            d4.run(velocity);
                        }
                        else if (note == 39)
                        {
                            d5.run(velocity);
                        }
                        else if (note == 40)
                        {
                            d6.run(velocity);
                        }
                        else if (note == 41)
                        {
                            d7.run(velocity);
                        }
                        else if (note == 42)
                        {
                            d8.run(velocity);
                        }
                        else if (note == 43)
                        {
                            d9.run(velocity);
                        }
                        else if (note == 44)
                        {
                            d10.run(velocity);
                        }
                        else if (note == 45)
                        {
                            d11.run(velocity);
                        }
                        else if (note == 46)
                        {
                            d12.run(velocity);
                        }
                        else if (note == 47)
                        {
                            d13.run(velocity);
                        }
                        else if (note == 48)
                        {
                            d14.run(velocity);
                        }
                        else if (note == 49)
                        {
                            d15.run(velocity);
                        }
                        else if (note == 50)
                        {
                            d16.run(velocity);
                        }
                    }
                }
                else if (control == 137) // key off for D sub-tracks
                {
                    0 => _lastKey[note];
                    spork ~ keyOff.run(note);
                }
                else if (control == 248) // clock
                {
                    spork ~ clock.run();
                }
            }
        }
    }
}

/*

For D sub-tracks 1-16:
Key on 153
Key off 137
Notes 35 - 50, inclusive

 */