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

// receive MIDI from the Alesis QX25 hardware
public class AlesisQX25
{
    MidiIn min;
    MidiMsg msg;

    // cached values
    int _lastPitchBend[2];
    int _lastModulation;
    int _lastRotary[9];
    int _lastKey[125];
    int _lastSlider;
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
    IntProcedure pad1;
    IntProcedure pad2;
    IntProcedure pad3;
    IntProcedure pad4;
    Procedure loop;
    Procedure rewind;
    Procedure fastForward;
    Procedure stop;
    Procedure play;
    Procedure record;
    IntProcedure slider;
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

    fun int getSlider()
    {
        return _lastSlider;
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
                        if (note == 60)
                        {
                            spork ~ pad1.run(velocity);
                        }
                        else if (note == 61)
                        {
                            spork ~ pad2.run(velocity);
                        }
                        else if (note == 62)
                        {
                            spork ~ pad3.run(velocity);
                        }
                        else if (note == 63)
                        {
                            spork ~ pad4.run(velocity);
                        }
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
                    else if (note == 16) // k3
                    {
                        velocity => _lastRotary[3];
                        spork ~ rotary3.run(velocity);
                    }
                    else if (note == 17) // k4
                    {
                        velocity => _lastRotary[4];
                        spork ~ rotary4.run(velocity);
                    }
                    else if (note == 18) // k5
                    {
                        velocity => _lastRotary[5];
                        spork ~ rotary5.run(velocity);
                    }
                    else if (note == 19) // k6
                    {
                        velocity => _lastRotary[6];
                        spork ~ rotary6.run(velocity);
                    }
                    else if (note == 20) // k7
                    {
                        velocity => _lastRotary[7];
                        spork ~ rotary7.run(velocity);
                    }
                    else if (note == 21) // k8
                    {
                        velocity => _lastRotary[8];
                        spork ~ rotary8.run(velocity);
                    }
                    else if (note == 22) // slider
                    {
                        velocity => _lastSlider;
                        spork ~ slider.run(velocity);
                    }
                    else if (note == 119) // loop
                    {
                        if (velocity == 127)
                        {
                            spork ~ loop.run();
                        }
                    }
                    else if (note == 118) // rewind
                    {
                        if (velocity == 127)
                        {
                            spork ~ rewind.run();
                        }
                    }
                    else if (note == 117) // fast forward
                    {
                        if (velocity == 127)
                        {
                            spork ~ fastForward.run();
                        }
                    }
                    else if (note == 114) // stop
                    {
                        if (velocity == 127)
                        {
                            spork ~ stop.run();
                        }
                    }
                    else if (note == 115) // play
                    {
                        if (velocity == 127)
                        {
                            spork ~ play.run();
                        }
                    }
                    else if (note == 116) // record
                    {
                        if (velocity == 127)
                        {
                            spork ~ record.run();
                        }
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

/**

   Alesis QX25 Notes

Keys:

Key on

144, key (0 - 120), velocity

Key off

128, key (0 - 120), velocity

Aftertouch

208, value, 13


Rotary:

K1
CC14

K2
CC15

K3
CC16

K4
CC17

K5
CC18

K6
CC19

K7
CC20

K8
CC21

Pads:

P1
C4 note on/off  60

P2
C#4 note on/off  61

P3
D4 note on/off  62

P4
D#4 note on/off  63

Transport:

1 loop
CC119 127 followed by CC119 0

2 rewind
CC118 127 followed by CC118 0

3 fast forward
CC117 127 followed by CC117 0

A stop
CC114 127 followed by CC114 0

B play
CC115 127 followed by CC115 0

C record
CC116 127 followed by CC116 0

Slider:

S1
CC22

Mod wheel:

CC1

Pitch wheel:

Sustain pedal:

*/
