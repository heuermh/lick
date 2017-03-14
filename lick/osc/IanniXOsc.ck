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
    float id;
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
                event.getFloat() => float eventId;
                if (Std.fabs(id - eventId) < 1.0)
                {
                    handle(event); // todo:  should this also be sporked?
                }
            }
        }
    }

    fun void handle(OscEvent event)
    {
        // empty
    }
}

class Cursor extends Control
{
    "/cursor" => address;
    FloatProcedure floatProcedure;
    FloatFloatProcedure floatFloatProcedure;
    FloatFloatFloatProcedure floatFloatFloatProcedure;
    FloatFloatFloatFloatProcedure floatFloatFloatFloatProcedure;

    fun void handle(OscEvent event)
    {
        event.getFloat() => float value0;
        event.getFloat() => float value1;
        event.getFloat() => float value2;
        event.getFloat() => float value3;

        floatProcedure.run(value0);
        floatFloatProcedure.run(value0, value1);
        floatFloatFloatProcedure.run(value0, value1, value2);
        floatFloatFloatFloatProcedure.run(value0, value1, value2, value3);
    }
}

class Trigger extends Control
{
    "/trigger" => address;
    Procedure triggerOn;
    Procedure triggerOff;
    FloatProcedure floatTriggerOn;
    FloatProcedure floatTriggerOff;
    FloatFloatProcedure floatFloatTriggerOn;
    FloatFloatProcedure floatFloatTriggerOff;

    fun void handle(OscEvent event)
    {
        event.getFloat() => float triggerValue;
        event.getFloat() => float value0;
        event.getFloat() => float value1;
        if (triggerValue)
        {
            triggerOn.run();
            floatTriggerOn.run(value0);
            floatFloatTriggerOn.run(value0, value1);
        }
        else
        {
            triggerOff.run();
            floatTriggerOff.run(value0);
            floatFloatTriggerOff.run(value0, value1);
        }
    }
}

public class IanniXOsc
{
    OscSend client;
    OscRecv server;
    57120 => int port;
    1234 => int clientPort;
    "localhost" => string clientHost;
    "/iannix" => string address;

    fun void connect()
    {
        port => server.port;
        server.listen();
    }

    fun void _send(string _clientHost, int _clientPort, string _address, string _f)
    {
        client.setHost(_clientHost, _clientPort);
        client.startMsg(_address + _f, "");
    }

    fun void _send(string _clientHost, int _clientPort, string _address, string _f, string argument)
    {
        client.setHost(_clientHost, _clientPort);
        client.startMsg(_address + _f, "s");
        argument => client.addString;
    }

    fun void _send(string _clientHost, int _clientPort, string _address, string _f, float argument)
    {
        client.setHost(_clientHost, _clientPort);
        client.startMsg(_address + _f, "f");
        argument => client.addFloat;
    }

    fun void _send(string _clientHost, int _clientPort, string _address, string _f, string argument0, string argument1)
    {
        client.setHost(_clientHost, _clientPort);
        client.startMsg(_address + _f, "ss");
        argument0 => client.addString;
        argument1 => client.addString;
    }

    fun void _send(string _clientHost, int _clientPort, string _address, string _f, string argument0, float argument1)
    {
        client.setHost(_clientHost, _clientPort);
        client.startMsg(_address + _f, "sf");
        argument0 => client.addString;
        argument1 => client.addFloat;
    }

    fun void _send(string _clientHost, int _clientPort, string _address, string _f, float argument0, float argument1)
    {
        client.setHost(_clientHost, _clientPort);
        client.startMsg(_address + _f, "ff");
        argument0 => client.addFloat;
        argument1 => client.addFloat;
    }

    // /iannix/add trigger auto
    fun void add(string object)
    {
        _send(clientHost, clientPort, address, "/add", object, "auto");
    }

    // /iannix/add trigger 1
    fun void add(string object, float id)
    {
        _send(clientHost, clientPort, address, "/add", object, id);
    }

    // /iannix/fastrewind
    fun void fastrewind()
    {
        _send(clientHost, clientPort, address, "/fastrewind");
    }

    // /iannix/play
    fun void play()
    {
        _send(clientHost, clientPort, address, "/play");
    }

    // /cursor cursor_id cursor_xPos
    fun void addCursor(float cursorId, FloatProcedure procedure)
    {
        Cursor cursor;
        cursorId => cursor.id;
        "ff" => cursor.values;
        server @=> cursor.server;
        procedure @=> cursor.floatProcedure;
        cursor.connect();
    }

    // /cursor cursor_id cursor_xPos cursor_yPos
    fun void addCursor(float cursorId, FloatFloatProcedure procedure)
    {
        Cursor cursor;
        cursorId => cursor.id;
        "fff" => cursor.values;
        server @=> cursor.server;
        procedure @=> cursor.floatFloatProcedure;
        cursor.connect();
    }

    // /cursor cursor_id cursor_xPos cursor_yPos cursor_angle
    fun void addCursor(float cursorId, FloatFloatFloatProcedure procedure)
    {
        Cursor cursor;
        cursorId => cursor.id;
        "ffff" => cursor.values;
        server @=> cursor.server;
        procedure @=> cursor.floatFloatFloatProcedure;
        cursor.connect();
    }

    // /cursor cursor_id cursor_xPos cursor_yPos cursor_value_x cursor_value_y
    fun void addCursor(float cursorId, FloatFloatFloatFloatProcedure procedure)
    {
        Cursor cursor;
        cursorId => cursor.id;
        "fffff" => cursor.values;
        server @=> cursor.server;
        procedure @=> cursor.floatFloatFloatFloatProcedure;
        cursor.connect();
    }

    // /trigger trigger_id trigger_value
    fun void addTrigger(float triggerId, Procedure triggerOn, Procedure triggerOff)
    {
        Trigger trigger;
        triggerId => trigger.id;
        "ff" => trigger.values;
        server @=> trigger.server;
        triggerOn @=> trigger.triggerOn;
        triggerOff @=> trigger.triggerOff;
        trigger.connect();
    }

    // /trigger trigger_id trigger_value trigger_xPos
    fun void addTrigger(float triggerId, FloatProcedure triggerOn, FloatProcedure triggerOff)
    {
        Trigger trigger;
        triggerId => trigger.id;
        "fff" => trigger.values;
        server @=> trigger.server;
        triggerOn @=> trigger.floatTriggerOn;
        triggerOff @=> trigger.floatTriggerOff;
        trigger.connect();
    }

    // /trigger trigger_id trigger_value trigger_xPos trigger_yPos
    fun void addTrigger(float triggerId, FloatFloatProcedure triggerOn, FloatFloatProcedure triggerOff)
    {
        Trigger trigger;
        triggerId => trigger.id;
        "ffff" => trigger.values;
        server @=> trigger.server;
        triggerOn @=> trigger.floatFloatTriggerOn;
        triggerOff @=> trigger.floatFloatTriggerOff;
        trigger.connect();
    }
}
