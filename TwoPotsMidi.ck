/*

    LiCK  Library for ChucK.
    Copyright (c) 2007-2013 held jointly by the individual authors.

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

public class TwoPotsMidi extends TwoPots
{
    MidiIn min;
    MidiMsg msg;

    0 => int pot1q1;
    0 => int pot1q2;
    0 => int pot1q3;
    0 => int pot1q4;
    0 => int pot2q1;
    0 => int pot2q2;
    0 => int pot2q3;
    0 => int pot2q4;
    5::ms => dur rate;

    fun int open(int device)
    {
        min.open(device);

        spork ~ _wait();
        spork ~ _send();
    }

    fun void _wait()
    {
        while (true)
        {
            min => now;
            while (min.recv(msg))
            {
                msg.data1 => int control;
                msg.data2 => int change;
                msg.data3 => int value;

                // if control == 173?
                if (change == 1)
                {
                    spork ~ pot1.run(value);
                }
                else if (change == 2)
                {
                    spork ~ pot2.run(value);
                }
                else if (change == 3)
                {
                    value => pot1q1;
                }
                else if (change == 4)
                {
                    value => pot1q2;
                }
                else if (change == 5)
                {
                    value => pot1q3;
                }
                else if (change == 6)
                {
                    value => pot1q4;
                }
                else if (change == 3)
                {
                    value => pot2q1;
                }
                else if (change == 4)
                {
                    value => pot2q2;
                }
                else if (change == 5)
                {
                    value => pot2q3;
                }
                else if (change == 6)
                {
                    value => pot2q4;
                }
            }
        }
    }

    fun void _send()
    {
        while (true)
        {
            rate => now;
            pot1HighRes.run(pot1q1 + pot1q2 + pot1q3 + pot1q4);
            pot2HighRes.run(pot2q1 + pot2q2 + pot2q3 + pot2q4);
        }
    }
}

/*

  Two Pots Notes

Pot 1, low res

CC1

Pot 2, low res

CC2

Pot 1, high res split

CC3
CC4
CC5
CC6

Pot 2, high res split

CC7
CC8
CC9
CC10

*/