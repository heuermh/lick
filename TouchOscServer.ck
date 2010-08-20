/*

    LiCK  Library for ChucK.
    Copyright (c) 2007-2010 held jointly by the individual authors.

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
    OscEvent @ event;

    fun void connect()
    {
        server.event(address + ", " + values) @=> event;
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
        // empty
    }
}

class Ping extends Control
{
    Procedure @ procedure;

    fun void handle(OscEvent event)
    {
        procedure.run();
    }
}

class Accelerometer extends Control
{
    FloatFloatFloatProcedure @ procedure;

    fun void handle(OscEvent event)
    {
        event.getFloat() => float x;
        event.getFloat() => float y;
        event.getFloat() => float z;
        procedure.run(x, y, z);
    }
}

class PushButton extends Control
{
    FloatProcedure @ procedure;

    fun void handle(OscEvent event)
    {
        event.getFloat() => float value;
        procedure.run(value);
    }
}

class ToggleButton extends Control
{
    FloatProcedure @ procedure;

    fun void handle(OscEvent event)
    {
        event.getFloat() => float value;
        procedure.run(value);
    }
}

class XYPad extends Control
{
    FloatFloatProcedure @ procedure;

    fun void handle(OscEvent event)
    {
        event.getFloat() => float x;
        event.getFloat() => float y;
        procedure.run(x, y);
    }
}

class FaderV extends Control
{
    FloatProcedure @ procedure;

    fun void handle(OscEvent event)
    {
        event.getFloat() => float value;
        procedure.run(value);
    }
}

class FaderH extends Control
{
    FloatProcedure @ procedure;

    fun void handle(OscEvent event)
    {
        event.getFloat() => float value;
        procedure.run(value);
    }
}

class RotaryV extends Control
{
    FloatProcedure @ procedure;

    fun void handle(OscEvent event)
    {
        event.getFloat() => float value;
        procedure.run(value);
    }
}

class RotaryH extends Control
{
    FloatProcedure @ procedure;

    fun void handle(OscEvent event)
    {
        event.getFloat() => float value;
        procedure.run(value);
    }
}

class MultiToggle extends Control
{
    // use implementation from mac, with ArrayList instead of OscEvent[][]
}

class MultiFaderV extends Control
{
}

class MultiFaderH extends Control
{
}

public class TouchOscServer
{
    OscSend client;
    OscRecv server;
    8000 => int port;

    fun void connect()
    {
        port => server.port;
        server.listen();
    }

    fun void _send(string clientHost, int clientPort, string address, float value)
    {
        client.setHost(clientHost, clientPort);
        client.startMsg(address, "f");
        value => client.addFloat;
    }

    fun void _sendColor(string clientHost, int clientPort, string address, string color)
    {
        client.setHost(clientHost, clientPort);
        client.startMsg(address + "/color", "s");
        color => client.addString;
    }

    fun void led(string clientHost, int clientPort, string address, float value)
    {
        _send(clientHost, clientPort, address, value);
    }

    fun void ledColor(string clientHost, int clientPort, string address, string color)
    {
        _sendColor(clientHost, clientPort, address, color);
    }

    fun void pushButton(string clientHost, int clientPort, string address, float value)
    {
        _send(clientHost, clientPort, address, value);
    }

    fun void pushButtonColor(string clientHost, int clientPort, string address, string color)
    {
        _sendColor(clientHost, clientPort, address, color);
    }

    fun void toggleButton(string clientHost, int clientPort, string address, float value)
    {
        _send(clientHost, clientPort, address, value);
    }

    fun void toggleButtonColor(string clientHost, int clientPort, string address, string color)
    {
        _sendColor(clientHost, clientPort, address, color);
    }

    fun void xyPad(string clientHost, int clientPort, string address, float x, float y)
    {
        client.setHost(clientHost, clientPort);
        client.startMsg(address, "ff");
        x => client.addFloat;
        y => client.addFloat;
    }

    fun void xyPadColor(string clientHost, int clientPort, string address, string color)
    {
        _sendColor(clientHost, clientPort, address, color);
    }

    fun void fader(string clientHost, int clientPort, string address, float value)
    {
        _send(clientHost, clientPort, address, value);
    }

    fun void faderColor(string clientHost, int clientPort, string address, string color)
    {
        _sendColor(clientHost, clientPort, address, color);
    }

    fun void rotary(string clientHost, int clientPort, string address, float value)
    {
        _send(clientHost, clientPort, address, value);
    }

    fun void rotaryColor(string clientHost, int clientPort, string address, string color)
    {
        _sendColor(clientHost, clientPort, address, color);
    }

    fun void multiToggleColor(string clientHost, int clientPort, string address, string color)
    {
        _sendColor(clientHost, clientPort, address, color);
    }

    fun void multiFaderColor(string clientHost, int clientPort, string address, string color)
    {
        _sendColor(clientHost, clientPort, address, color);
    }

    fun void addPing(Procedure procedure)
    {
        Ping ping;
        "/ping" => ping.address;
        "" => ping.values;
        server @=> ping.server;
        procedure @=> ping.procedure;
        ping.connect();
    }

    fun void addAccelerometer(FloatFloatFloatProcedure procedure)
    {
        Accelerometer accelerometer;
        "/accxyz" => accelerometer.address;
        "fff" => accelerometer.values;
        server @=> accelerometer.server;
        procedure @=> accelerometer.procedure;
        accelerometer.connect();
    }

    fun void addPushButton(string address, FloatProcedure procedure)
    {
        PushButton pushButton;
        address => pushButton.address;
        ", f" => pushButton.values;
        server @=> pushButton.server;
        procedure @=> pushButton.procedure;
        pushButton.connect();
    }

    fun void addToggleButton(string address, FloatProcedure procedure)
    {
        ToggleButton toggleButton;
        address => toggleButton.address;
        ", f" => toggleButton.values;
        server @=> toggleButton.server;
        procedure @=> toggleButton.procedure;
        toggleButton.connect();
    }

    fun void addXYPad(string address, FloatFloatProcedure procedure)
    {
        XYPad xyPad;
        address => xyPad.address;
        ", ff" => xyPad.values;
        server @=> xyPad.server;
        procedure @=> xyPad.procedure;
        xyPad.connect();
    }

    fun void addFaderV(string address, FloatProcedure procedure)
    {
        FaderV faderV;
        address => faderV.address;
        ", f" => faderV.values;
        server @=> faderV.server;
        procedure @=> faderV.procedure;
        faderV.connect();
    }

    fun void addFaderH(string address, FloatProcedure procedure)
    {
        FaderH faderH;
        address => faderH.address;
        ", f" => faderH.values;
        server @=> faderH.server;
        procedure @=> faderH.procedure;
        faderH.connect();
    }

    fun void addRotaryV(string address, FloatProcedure procedure)
    {
        RotaryV rotaryV;
        address => rotaryV.address;
        ", f" => rotaryV.values;
        server @=> rotaryV.server;
        procedure @=> rotaryV.procedure;
        rotaryV.connect();
    }

    fun void addRotaryH(string address, FloatProcedure procedure)
    {
        RotaryH rotaryH;
        address => rotaryH.address;
        ", f" => rotaryH.values;
        server @=> rotaryH.server;
        procedure @=> rotaryH.procedure;
        rotaryH.connect();
    }

    fun void addMultiToggle(string address)
    {
    }

    fun void addMultiFaderV(string address)
    {
    }

    fun void addMultiFaderH(string address)
    {
    }
}
