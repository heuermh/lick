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

class Control
{
    string address;
    string values;
    OscRecv @ server;

    fun void connect()
    {
        server.event(address + ", " + values) @=> OscEvent event;
        spork ~ _waitForEvent(event);
    }

    fun void _waitForEvent(OscEvent event)
    {
        while (true)
        {
            event => now;
            while (event.nextMsg())
            {
                // todo:  should this also be sporked?
                handle(event);
            }
        }
    }

    fun void handle(OscEvent event)
    {
        // empty
    }
}


class Pattern extends Control
{
    "iiii" => values;
    IntProcedure noteProcedure;
    IntProcedure channelProcedure;
    IntProcedure pitchProcedure;
    IntProcedure velocityProcedure;
    IntIntProcedure noteOnPitchVelocityProcedure;
    IntIntProcedure noteOffPitchVelocityProcedure;
    IntIntIntProcedure noteOnProcedure;
    IntIntIntProcedure noteOffProcedure;
    IntIntIntIntProcedure procedure;

    fun void handle(OscEvent event)
    {
        event.getInt() => int note;
        event.getInt() => int channel;
        event.getInt() => int pitch;
        event.getInt() => int velocity;
        noteProcedure.run(note);
        channelProcedure.run(channel);
        pitchProcedure.run(pitch);
        velocityProcedure.run(velocity);
        if (note)
        {
            noteOnPitchVelocityProcedure.run(pitch, velocity);
            noteOnProcedure.run(channel, pitch, velocity);
        }
        else
        {
            noteOffPitchVelocityProcedure.run(pitch, velocity);
            noteOffProcedure.run(channel, pitch, velocity);
        }
        procedure.run(note, channel, pitch, velocity);
    }
}

public class EuclidOsc
{
    OscSend client;
    OscRecv server;
    9000 => int port;

    fun void connect()
    {
        port => server.port;
        server.listen();
    }

    fun void addPattern(string address, IntIntIntIntProcedure procedure)
    {
        Pattern pattern;
        address => pattern.address;
        server @=> pattern.server;
        procedure @=> pattern.procedure;
        pattern.connect();
    }

    fun void addPattern(string address, IntIntIntProcedure noteOnProcedure, IntIntIntProcedure noteOffProcedure)
    {
        Pattern pattern;
        address => pattern.address;
        server @=> pattern.server;
        noteOnProcedure @=> pattern.noteOnProcedure;
        noteOffProcedure @=> pattern.noteOffProcedure;
        pattern.connect();
    }

    fun void addPattern(string address, IntIntProcedure noteOnPitchVelocityProcedure, IntIntProcedure noteOffPitchVelocityProcedure)
    {
        Pattern pattern;
        address => pattern.address;
        server @=> pattern.server;
        noteOnPitchVelocityProcedure @=> pattern.noteOnPitchVelocityProcedure;
        noteOffPitchVelocityProcedure @=> pattern.noteOffPitchVelocityProcedure;
        pattern.connect();
    }

    fun void addPattern(string address, IntProcedure noteProcedure, IntProcedure channelProcedure, IntProcedure pitchProcedure, IntProcedure velocityProcedure)
    {
        Pattern pattern;
        address => pattern.address;
        server @=> pattern.server;
        noteProcedure @=> pattern.noteProcedure;
        channelProcedure @=> pattern.channelProcedure;
        pitchProcedure @=> pattern.pitchProcedure;
        velocityProcedure @=> pattern.velocityProcedure;
        pattern.connect();
    }
}
