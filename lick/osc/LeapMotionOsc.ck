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
    FloatFloatFloatProcedure @ position;

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
                handle(event);
            }
        }
    }

    fun void handle(OscEvent event)
    {
        event.getInt();
        event.getInt();
        event.getFloat() => float x;
        event.getFloat() => float y;
        event.getFloat() => float z;
        position.run(x, y, z);
    }
}

class Hand extends Control
{
    // empty
}

class Finger extends Control
{
    // empty
}

class Tool extends Control
{
    // empty
}

public class LeapMotionOsc
{
    OscRecv server;
    6449 => int port;

    0 => int _activeHands;
    0 => int _activeFingers;
    0 => int _activeTools;
    0 => int _activeOrigins;

    fun void connect()
    {
        port => server.port;
        server.listen();

        server.event("/active, iiii") @=> OscEvent event;
        spork ~ _waitForActiveEvent(event);
    }

    fun int activeHands()
    {
        return _activeHands;
    }

    fun int activeFingers()
    {
        return _activeFingers;
    }

    fun int activeTools()
    {
        return _activeTools;
    }

    fun int activeOrigins()
    {
        return _activeOrigins;
    }

    fun void addHand(string address, FloatFloatFloatProcedure position)
    {
        Hand hand;
        address => hand.address;
        "iifff" => hand.values;
        server @=> hand.server;
        position @=> hand.position;
        hand.connect();
    }

    fun void addFinger(string address, FloatFloatFloatProcedure position)
    {
        Finger finger;
        address => finger.address;
        "iifff" => finger.values;
        server @=> finger.server;
        position @=> finger.position;
        finger.connect();
    }

    fun void addTool(string address, FloatFloatFloatProcedure position)
    {
        Tool tool;
        address => tool.address;
        "iifff" => tool.values;
        server @=> tool.server;
        position @=> tool.position;
        tool.connect();
    }

    fun void _waitForActiveEvent(OscEvent event)
    {
        while (true)
        {
            event => now;
            while (event.nextMsg())
            {
                _handleActive(event);
            }
        }
    }

    fun void _handleActive(OscEvent event)
    {
        event.getInt() => _activeHands;
        event.getInt() => _activeFingers;
        event.getInt() => _activeTools;
        event.getInt() => _activeOrigins;
    }
}
