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

// receive MIDI from the M-Audio Ozone hardware
public class Ozone // may work for other MIDI keyboards, see notes below
{
    MidiIn min;
    MidiMsg msg;

    // cached values
    int _lastPitchBend[2];
    int _lastModulation;
    int _lastRotary[9];
    int _lastKey[125];
    int _lastSustainPedal;

    // assign custom procedures
    IntIntProcedure pitchBend;
    IntProcedure modulation;
    IntProcedure rotary1;
    IntProcedure rotary2;
    IntProcedure rotary3;
    IntProcedure rotary4;
    IntProcedure rotary5;
    IntProcedure rotary6;
    IntProcedure rotary7;
    IntProcedure rotary8;
    IntIntProcedure keyOn;
    IntProcedure keyOff;
    Procedure sustainPedalOn;
    Procedure sustainPedalOff;

    fun int[] getPitchBend()
    {
        return _lastPitchBend;
    }

    fun int getModulation()
    {
        return _lastModulation;
    }

    fun int getRotary1()
    {
        return _lastRotary[1];
    }

    fun int getRotary2()
    {
        return _lastRotary[2];
    }

    fun int getRotary3()
    {
        return _lastRotary[3];
    }

    fun int getRotary4()
    {
        return _lastRotary[4];
    }

    fun int getRotary5()
    {
        return _lastRotary[5];
    }

    fun int getRotary6()
    {
        return _lastRotary[6];
    }

    fun int getRotary7()
    {
        return _lastRotary[7];
    }

    fun int getRotary8()
    {
        return _lastRotary[8];
    }

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

    fun int isSustainPedalOn()
    {
        return _lastSustainPedal;
    }

    fun int isSustainPedalOff()
    {
        return !_lastSustainPedal;
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

                // see notes below
                if (control == 144)
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
                    }
                }
                else if (control == 224)
                {
                    note => _lastPitchBend[0];
                    velocity => _lastPitchBend[1];
                    spork ~ pitchBend.run(note, velocity);
                }
                else if (control == 176)
                {
                    if (note == 1)
                    {
                        velocity => _lastModulation;
                        spork ~ modulation.run(velocity);
                    }
                    else if (note == 74)
                    {
                        velocity => _lastRotary[1];
                        spork ~ rotary1.run(velocity);
                    }
                    else if (note == 71)
                    {
                        velocity => _lastRotary[2];
                        spork ~ rotary2.run(velocity);
                    }
                    else if (note == 81)
                    {
                        velocity => _lastRotary[3];
                        spork ~ rotary3.run(velocity);
                    }
                    else if (note == 91)
                    {
                        velocity => _lastRotary[4];
                        spork ~ rotary4.run(velocity);
                    }
                    else if (note == 16)
                    {
                        velocity => _lastRotary[5];
                        spork ~ rotary5.run(velocity);
                    }
                    else if (note == 80)
                    {
                        velocity => _lastRotary[6];
                        spork ~ rotary6.run(velocity);
                    }
                    else if (note == 19)
                    {
                        velocity => _lastRotary[7];
                        spork ~ rotary7.run(velocity);
                    }
                    else if (note == 2)
                    {
                        velocity => _lastRotary[8];
                        spork ~ rotary8.run(velocity);
                    }
                    else if (note == 64)
                    {
                        if (velocity == 127)
                        {
                            true => _lastSustainPedal;
                            spork ~ sustainPedalOn.run();
                        }
                        else if (velocity == 0)
                        {
                            false => _lastSustainPedal;
                            spork ~ sustainPedalOff.run();
                        }
                    }
                }
            }
        }
    }
}

/**

   M-Audio Ozone Notes

Keys
144, key (0 - 120), velocity

Pitch wheel
224, (124 - 0 twice) down (0 - 124 twice) up, (0 - 64) down (64 - 124) up

Modulation wheel
176, 1, value

Rotary 1
176, 74, value

Rotary 2
176, 71, value

Rotary 3
176, 81, value

Rotary 4
176, 91, value

Rotary 5
176, 16, value

Rotary 6
176, 80, value

Rotary 7
176, 19, value

Rotary 8
176, 2, value

Sustain Pedal
176, 64, 127 click on
176, 64, 0 click off

*/
