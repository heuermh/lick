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

// send and receive OSC messages from Monome hardware
public class Monome
{
    OscRecv client;
    OscSend engine;
    OscEvent press;
    "/40h" => string namespace;
    9090 => int clientPort;
    "localhost" => string engineHost;
    9091 => int enginePort;

    fun void connect()
    {
        clientPort => client.port;
        client.listen();
        client.event(namespace + "/press, iii") @=> press;
        spork ~ _waitForEvent();
        engine.setHost(engineHost, enginePort);
    }

    fun void _waitForEvent()
    {
        while (true)
        {
            press => now;
            while (press.nextMsg())
            {
                press.getInt() => int x;
                press.getInt() => int y;
                press.getInt() => int value;
                if (value == 0)
                {
                    buttonReleased(x, y);
                }
                else
                {
                    buttonPressed(x, y);
                }
            }
        }
    }

    fun void buttonPressed(int x, int y)
    {
        // called via e.g. /40h/press x,y,1 event
        //<<<"buttonPressed", x, y>>>;
    }

    fun void buttonReleased(int x, int y)
    {
        // called via e.g. /40h/press x,y,0 event
        //<<<"buttonReleased", x, y>>>;
    }

    fun void clear()
    {
        engine.startMsg(namespace + "/clear", "i");
        0 => engine.addInt;
    }

    fun void ledOn(int x, int y)
    {
        engine.startMsg(namespace + "/led", "iii");
        x => engine.addInt;
        y => engine.addInt;
        1 => engine.addInt;
    }

    fun void ledOff(int x, int y)
    {
        engine.startMsg(namespace + "/led", "iii");
        x => engine.addInt;
        y => engine.addInt;
        0 => engine.addInt;
    }

    fun void rowOn(int row)
    {
        engine.startMsg(namespace + "/led_row", "ii");
        row => engine.addInt;
        255 => engine.addInt;
    }

    fun void rowOff(int row)
    {
        engine.startMsg(namespace + "/led_row", "ii");
        row => engine.addInt;
        0 => engine.addInt;
    }

    fun void columnOn(int column)
    {
        engine.startMsg(namespace + "/led_col", "ii");
        column => engine.addInt;
        255 => engine.addInt;
    }

    fun void columnOff(int column)
    {
        engine.startMsg(namespace + "/led_col", "ii");
        column => engine.addInt;
        0 => engine.addInt;
    }

    fun void frameOn()
    {
        engine.startMsg(namespace + "/frame", "iiiiiiii");
        255 => engine.addInt;
        255 => engine.addInt;
        255 => engine.addInt;
        255 => engine.addInt;
        255 => engine.addInt;
        255 => engine.addInt;
        255 => engine.addInt;
        255 => engine.addInt;
    }

    fun void frameOff()
    {
        engine.startMsg(namespace + "/frame", "iiiiiiii");
        0 => engine.addInt;
        0 => engine.addInt;
        0 => engine.addInt;
        0 => engine.addInt;
        0 => engine.addInt;
        0 => engine.addInt;
        0 => engine.addInt;
        0 => engine.addInt;
    }
}
