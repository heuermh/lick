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

// receive MIDI from the Roland A-49 hardware
public class RolandA49
{
    MidiIn min;
    MidiMsg msg;

    // cached values
    int _lastPitchBend[2];
    int _lastModulation;
    int _lastRotary[2];
    int _lastKey[125];
    int _lastSustainPedal;

    // assign custom procedures
    IntIntProcedure pitchBend;
    IntProcedure modulation;
    IntProcedure rotary1;
    IntProcedure rotary2;
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
                else if (control == 128)
                {
                    0 => _lastKey[note];
                    spork ~ keyOff.run(note);
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
                    else if (note == 14) // k1
                    {
                        velocity => _lastRotary[1];
                        spork ~ rotary1.run(velocity);
                    }
                    else if (note == 15) // k2
                    {
                        velocity => _lastRotary[2];
                        spork ~ rotary2.run(velocity);
                    }
                    else if (note == 64) // sustain pedal
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
