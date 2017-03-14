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

class Pattern extends IntIntProcedure
{
    IntIntProcedure procedure;
    IntIntProcedure noteOnProcedure;
    IntIntProcedure noteOffProcedure;

    fun void run(int pitch, int velocity)
    {
        procedure.run(pitch, velocity);

        if (velocity)
        {
            noteOnProcedure.run(pitch, velocity);
        }
        else
        {
            noteOffProcedure.run(pitch, velocity);
        }
    }
}

public class EuclidMidi
{
    MidiIn min;
    MidiMsg msg;
    Pattern default;
    ArrayList patterns;

    {
        patterns.size(125);
        patterns.assign(default);
    }

    fun void addPattern(int control, IntIntProcedure procedure)
    {
        Pattern pattern;
        procedure @=> pattern.procedure;
        patterns.set(control, pattern);
    }

    fun void addPattern(int control, IntIntProcedure noteOnProcedure, IntIntProcedure noteOffProcedure)
    {
        Pattern pattern;
        noteOnProcedure @=> pattern.noteOnProcedure;
        noteOffProcedure @=> pattern.noteOffProcedure;
        patterns.set(control, pattern);
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
                msg.data2 => int pitch;
                msg.data3 => int velocity;

                patterns.get(control) $ Pattern @=> Pattern pattern;
                spork ~ pattern.run(pitch, velocity);
            }
        }
    }
}
