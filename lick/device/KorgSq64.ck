/*

    LiCK  Library for ChucK.
    Copyright (c) 2007-2025 held jointly by the individual authors.

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

@import "../fn/Procedure"
@import "../fn/IntProcedure"
@import "../fn/IntIntProcedure"

class Channel
{
    string name;
    int _lastKey[125];
    IntIntProcedure keyOn;
    IntProcedure keyOff;

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

    fun static Channel create(string s)
    {
        Channel channel;
        s => channel.name;
        return channel;
    }
}

public class KorgSq64
{
    MidiIn min;
    MidiMsg msg;

    // assign custom procedures
    Procedure clock;
    Procedure stop;
    Procedure play;
    IntProcedure rotary1;
    IntProcedure rotary2;
    IntProcedure rotary3;
    IntProcedure rotary4;

    // channels
    Channel.create("A") @=> Channel a;
    Channel.create("B") @=> Channel b;
    Channel.create("C") @=> Channel c;
    Channel.create("D") @=> Channel d;

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

    fun void open(int device)
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

                if (control == 144) // key on for channel A
                {
                    if (velocity == 0)
                    {
                        0 => a._lastKey[note];
                        spork ~ a.keyOff.run(note);
                    }
                    else
                    {
                        velocity => a._lastKey[note];
                        spork ~ a.keyOn.run(note, velocity);
                    }
                }
                else if (control == 128) // key off for channel A
                {
                    0 => a._lastKey[note];
                    spork ~ a.keyOff.run(note);
                }
                else if (control == 145) // key on for channel B
                {
                    if (velocity == 0)
                    {
                        0 => b._lastKey[note];
                        spork ~ b.keyOff.run(note);
                    }
                    else
                    {
                        velocity => b._lastKey[note];
                        spork ~ b.keyOn.run(note, velocity);
                    }
                }
                else if (control == 129) // key off for channel B
                {
                    0 => b._lastKey[note];
                    spork ~ b.keyOff.run(note);
                }
                else if (control == 146) // key on for channel C
                {
                    if (velocity == 0)
                    {
                        0 => c._lastKey[note];
                        spork ~ c.keyOff.run(note);
                    }
                    else
                    {
                        velocity => c._lastKey[note];
                        spork ~ c.keyOn.run(note, velocity);
                    }
                }
                else if (control == 130) // key off for channel C
                {
                    0 => c._lastKey[note];
                    spork ~ c.keyOff.run(note);
                }
                else if (control == 153) // key on for channel D sub-tracks
                {
                    if (velocity == 0)
                    {
                        0 => d._lastKey[note];
                        spork ~ d.keyOff.run(note);
                    }
                    else
                    {
                        velocity => d._lastKey[note];
                        spork ~ d.keyOn.run(note, velocity);

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
                else if (control == 137) // key off for channel D sub-tracks
                {
                    0 => d._lastKey[note];
                    spork ~ d.keyOff.run(note);
                }
                else if (control == 176) // control mode
                {
                    if (note == 43)
                    {
                        spork ~ rotary1.run(velocity);
                    }
                    else if (note == 39)
                    {
                        spork ~ rotary2.run(velocity);
                    }
                    else if (note == 16)
                    {
                        spork ~ rotary3.run(velocity);
                    }
                    else if (note == 17)
                    {
                        spork ~ rotary4.run(velocity);
                    }
                }
                else if (control == 248) // clock
                {
                    spork ~ clock.run();
                }
                else if (control == 250) // play
                {
                    spork ~ play.run();
                }
                else if (control == 252) // stop
                {
                    spork ~ stop.run();
                }
                else
                {
                    <<<"unmapped MIDI event:", control, note, velocity>>>;
                }
            }
        }
    }
}

/*

For channel A:
Key on 144
Key off 128

For channel B:
Key on 145
Key off 129

For channel C:
Key on 146
Key off 130

For channel D sub-tracks 1-16:
Key on 153
Key off 137
Notes 35 - 50, inclusive

Play button 250 233 51
Stop button 252 233 51

Control mode knob 1 176 43
Control mode knob 2 176 39
Control mode knob 3 176 16
Control mode knob 4 176 17
 */