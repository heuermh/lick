/*

    LiCK  Library for ChucK.
    Copyright (c) 2007-2011 held jointly by the individual authors.

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

    fun void handle(OscEvent event)
    {
        event.getFloat() => float value0;
        event.getFloat() => float value1;

        floatProcedure.run(value0);
        floatFloatProcedure.run(value0, value1);
    }
}

class Curve extends Control
{
    "/curve" => address;
    FloatProcedure floatProcedure;
    FloatFloatProcedure floatFloatProcedure;

    fun void handle(OscEvent event)
    {
        event.getFloat() => float value0;
        event.getFloat() => float value1;

        floatProcedure.run(value0);
        floatFloatProcedure.run(value0, value1);
    }
}

class Collision extends Control
{
    "/collision" => address;
    FloatProcedure floatProcedure;
    FloatFloatProcedure floatFloatProcedure;

    fun void handle(OscEvent event)
    {
        event.getFloat() => float value0;
        event.getFloat() => float value1;

        floatProcedure.run(value0);
        floatFloatProcedure.run(value0, value1);
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

    fun void connect()
    {
        port => server.port;
        server.listen();
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

    /*
    // /cursor cursor_id cursor_xPos cursor_yPos ?
    fun void addCursor(float cursorId, FloatFloatFloatProcedure procedure)
    {
        Cursor cursor;
        cursorId => cursor.id;
        "fff" => cursor.values;
        server @=> cursor.server;
        procedure @=> cursor.intIntIntProcedure;
        cursor.connect();
    }

    // /cursor cursor_id cursor_xPos cursor_yPos ? ?
    fun void addCursor(int cursorId, IntIntIntIntProcedure procedure)
    {
        Cursor cursor;
        cursorId => cursor.id;
        "iiii" => cursor.values;
        server @=> cursor.server;
        procedure @=> cursor.intIntIntIntProcedure;
        cursor.connect();
    }
    // todo:  are cursor_time, cursor_time_percent, cursor_value_x, cursor_value_y, cursor_angle, cursor_nb_loop ints or floats?
    */

    // /curve curve_id curve_xPos
    fun void addCurve(float curveId, FloatProcedure procedure)
    {
        Curve curve;
        curveId => curve.id;
        "ff" => curve.values;
        server @=> curve.server;
        procedure @=> curve.floatProcedure;
        curve.connect();
    }

    // /curve curve_id curve_xPos curve_yPos
    fun void addCurve(float curveId, FloatFloatProcedure procedure)
    {
        Curve curve;
        curveId => curve.id;
        "fff" => curve.values;
        server @=> curve.server;
        procedure @=> curve.floatFloatProcedure;
        curve.connect();
    }

    // /collision collision_curve_id collision_xPos
    fun void addCollision(float collisionId, FloatProcedure procedure)
    {
        Collision collision;
        collisionId => collision.id;
        "ff" => collision.values;
        server @=> collision.server;
        procedure @=> collision.floatProcedure;
        collision.connect();
    }

    // /collision collision_curve_id collision_xPos collision_yPos
    fun void addCollision(float collisionId, FloatFloatProcedure procedure)
    {
        Collision collision;
        collisionId => collision.id;
        "fff" => collision.values;
        server @=> collision.server;
        procedure @=> collision.floatFloatProcedure;
        collision.connect();
    }
    // todo:  are collision_value_x, collision_value_y ints or floats?

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