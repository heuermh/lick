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
                handle(event);
            }
        }
    }

    fun void handle(OscEvent event)
    {
        // empty
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

class Button extends Control
{
    FloatProcedure @ procedure;

    fun void handle(OscEvent event)
    {
        event.getFloat() => float value;
        procedure.run(value);
    }
}

class Compass extends Control
{
    FloatProcedure @ procedure;

    fun void handle(OscEvent event)
    {
        event.getFloat() => float value;
        procedure.run(value);
    }
}

class CoreMotion extends Control
{
    FloatFloatFloatProcedure @ procedure;

    fun void handle(OscEvent event)
    {
        // first three params are for gyro
        event.getFloat() => float ignore0;
        event.getFloat() => float ignore1;
        event.getFloat() => float ignore2;
        event.getFloat() => float pitch;
        event.getFloat() => float roll;
        event.getFloat() => float yaw;
        procedure.run(pitch, roll, yaw);
    }
}

class Gyro extends Control
{
    FloatFloatFloatProcedure @ procedure;

    fun void handle(OscEvent event)
    {
        event.getFloat() => float xRotationRate;
        event.getFloat() => float yRotationRate;
        event.getFloat() => float zRotationRate;
        // next three params are for core motion
        procedure.run(xRotationRate, yRotationRate, zRotationRate);
    }
}

class Knob extends Control
{
    FloatProcedure @ procedure;

    fun void handle(OscEvent event)
    {
        event.getFloat() => float value;
        procedure.run(value);
    }
}

class MultiButton extends Control
{
    8 => int width;
    8 => int height;
    ArrayList events;
    IntFloatProcedure @ indexProcedure;
    IntIntFloatProcedure @ xyProcedure;

    fun void connect()
    {
        for (0 => int x; x < width; x++)
        {
            for (0 => int y; y < height; y++)
            {
                server.event(address + "/" + x + y * width + ", " + values) @=> OscEvent event;
                events.add(event);
                spork ~ _waitForEvent(event);
            }
        }
    }

    fun void handle(OscEvent event)
    {
        events.indexOf(event) => int index;
        event.getFloat() => float value;
        indexProcedure.run(index, value);
        index % width => int x;
        index / width => int y;
        xyProcedure.run(x, y, value);
    }
}

class MultiSlider extends Control
{
    8 => int width;
    8 => int height;
    ArrayList events;
    IntFloatProcedure @ indexProcedure;
    IntIntFloatProcedure @ xyProcedure;

    fun void connect()
    {
        for (0 => int x; x < width; x++)
        {
            for (0 => int y; y < height; y++)
            {
                server.event(address + "/" + x + y * width + ", " + values) @=> OscEvent event;
                events.add(event);
                spork ~ _waitForEvent(event);
            }
        }
    }

    fun void handle(OscEvent event)
    {
        events.indexOf(event) => int index;
        event.getFloat() => float value;
        indexProcedure.run(index, value);
        index % width => int x;
        index / width => int y;
        xyProcedure.run(x, y, value);
    }
}

class MultiTouchXY extends Control
{
    8 => int touches;
    ArrayList events;
    IntFloatFloatProcedure @ procedure;

    fun void connect()
    {
        for (0 => int touch; touch < touches; touch++)
        {
            server.event(address + "/" + touch + ", " + values) @=> OscEvent event;
            events.add(event);
            spork ~ _waitForEvent(event);
        }
    }

    fun void handle(OscEvent event)
    {
        events.indexOf(event) => int touch;
        event.getFloat() => float x;
        event.getFloat() => float y;
        procedure.run(touch, x, y);
    }
}

class Slider extends Control
{
    FloatProcedure @ procedure;

    fun void handle(OscEvent event)
    {
        event.getFloat() => float value;
        procedure.run(value);
    }
}

public class ControlOscServer
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
        <<<"osc send ", clientHost, clientPort, address, value>>>;
    }

    fun void _send(string clientHost, int clientPort, string address, float value0, float value1)
    {
        client.setHost(clientHost, clientPort);
        client.startMsg(address, "ff");
        value0 => client.addFloat;
        value1 => client.addFloat;
        <<<"osc send ", clientHost, clientPort, address, value0, value1>>>;
    }

    fun void _send(string clientHost, int clientPort, string address, string value)
    {
        client.setHost(clientHost, clientPort);
        client.startMsg(address, "s");
        value => client.addString;
        <<<"osc send ", clientHost, clientPort, address, value>>>;
    }

    fun void label(string clientHost, int clientPort, string address, string value)
    {
        _send(clientHost, clientPort, address, value);
    }

    fun void button(string clientHost, int clientPort, string address, float value)
    {
        _send(clientHost, clientPort, address, value);
    }

    fun void knob(string clientHost, int clientPort, string address, float value)
    {
        _send(clientHost, clientPort, address, value);
    }

    fun void slider(string clientHost, int clientPort, string address, float value)
    {
        _send(clientHost, clientPort, address, value);
    }

    fun void addAccelerometer(string address, FloatFloatFloatProcedure procedure)
    {
        Accelerometer accelerometer;
        address => accelerometer.address;
        "fff" => accelerometer.values;
        server @=> accelerometer.server;
        procedure @=> accelerometer.procedure;
        accelerometer.connect();
    }

    fun void addButton(string address, FloatProcedure procedure)
    {
        Button button;
        address => button.address;
        "f" => button.values;
        server @=> button.server;
        procedure @=> button.procedure;
        button.connect();
    }

    fun void addCompass(string address, FloatProcedure procedure)
    {
        Compass compass;
        address => compass.address;
        "f" => compass.values;
        server @=> compass.server;
        procedure @=> compass.procedure;
        compass.connect();
    }

    fun void addCoreMotion(string address, FloatFloatFloatProcedure procedure)
    {
        CoreMotion coreMotion;
        address => coreMotion.address;
        "ffffff" => coreMotion.values;
        server @=> coreMotion.server;
        procedure @=> coreMotion.procedure;
        coreMotion.connect();
    }

    fun void addGyro(string address, FloatFloatFloatProcedure procedure)
    {
        Gyro gyro;
        address => gyro.address;
        "ffffff" => gyro.values;
        server @=> gyro.server;
        procedure @=> gyro.procedure;
        gyro.connect();
    }

    fun void addKnob(string address, FloatProcedure procedure)
    {
        Knob knob;
        address => knob.address;
        "f" => knob.values;
        server @=> knob.server;
        procedure @=> knob.procedure;
        knob.connect();
    }

    fun void addMultiButton(string address, int width, int height, IntFloatProcedure procedure)
    {
        MultiButton multiButton;
        address => multiButton.address;
        "f" => multiButton.values;
        width => multiButton.width;
        height => multiButton.height;
        server @=> multiButton.server;
        procedure @=> multiButton.indexProcedure;
        multiButton.connect();
    }

    fun void addMultiButton(string address, int width, int height, IntIntFloatProcedure procedure)
    {
        MultiButton multiButton;
        address => multiButton.address;
        "f" => multiButton.values;
        width => multiButton.width;
        height => multiButton.height;
        server @=> multiButton.server;
        procedure @=> multiButton.xyProcedure;
        multiButton.connect();
    }

    fun void addMultiSlider(string address, int width, int height, IntFloatProcedure procedure)
    {
        MultiSlider multiSlider;
        address => multiSlider.address;
        "f" => multiSlider.values;
        width => multiSlider.width;
        height => multiSlider.height;
        server @=> multiSlider.server;
        procedure @=> multiSlider.indexProcedure;
        multiSlider.connect();
    }

    fun void addMultiSlider(string address, int width, int height, IntIntFloatProcedure procedure)
    {
        MultiSlider multiSlider;
        address => multiSlider.address;
        "f" => multiSlider.values;
        width => multiSlider.width;
        height => multiSlider.height;
        server @=> multiSlider.server;
        procedure @=> multiSlider.xyProcedure;
        multiSlider.connect();
    }

    fun void addMultiTouchXY(string address, int touches, IntFloatFloatProcedure procedure)
    {
        MultiTouchXY multiTouchXY;
        address => multiTouchXY.address;
        "ff" => multiTouchXY.values;
        touches => multiTouchXY.touches;
        server @=> multiTouchXY.server;
        procedure @=> multiTouchXY.procedure;
        multiTouchXY.connect();
    }

    fun void addSlider(string address, FloatProcedure procedure)
    {
        Slider slider;
        address => slider.address;
        "f" => slider.values;
        server @=> slider.server;
        procedure @=> slider.procedure;
        slider.connect();
    }
}
