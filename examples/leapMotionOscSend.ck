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

// simulate OSC data sent by LeapMotion

OscSend send;
send.setHost("localhost", 6449);

<<<"sending on port", 6449>>>;

[100.0, 100.0, 100.0] @=> float h0[];
[100.0, 100.0, 100.0] @=> float h1[];

[100.0, 100.0, 100.0] @=> float f00[];
[100.0, 100.0, 100.0] @=> float f01[];
[100.0, 100.0, 100.0] @=> float f02[];
[100.0, 100.0, 100.0] @=> float f03[];
[100.0, 100.0, 100.0] @=> float f04[];

[100.0, 100.0, 100.0] @=> float f10[];
[100.0, 100.0, 100.0] @=> float f11[];
[100.0, 100.0, 100.0] @=> float f12[];
[100.0, 100.0, 100.0] @=> float f13[];
[100.0, 100.0, 100.0] @=> float f14[];

fun void sendHands()
{
    sendHand("/hand0", 0, h0);
    sendHand("/hand1", 1, h1);
}

fun void sendHand(string name, int id, float position[])
{
    send.startMsg(name, "iifff");
    send.addInt(id);
    send.addInt(0);
    send.addFloat(position[0]);
    send.addFloat(position[1]);
    send.addFloat(position[2]);
}

fun void sendFingers()
{
    sendFinger("/finger0-0", 0, 0, f00);
    sendFinger("/finger0-1", 0, 1, f01);
    sendFinger("/finger0-2", 0, 2, f02);
    sendFinger("/finger0-3", 0, 3, f03);
    sendFinger("/finger0-4", 0, 4, f04);

    sendFinger("/finger1-0", 1, 0, f10);
    sendFinger("/finger1-1", 1, 1, f11);
    sendFinger("/finger1-2", 1, 2, f12);
    sendFinger("/finger1-3", 1, 3, f13);
    sendFinger("/finger1-4", 1, 4, f14);
}

fun void sendFinger(string name, int handId, int fingerId, float position[])
{
    send.startMsg(name, "iifff");
    send.addInt(handId);
    send.addInt(fingerId);
    send.addFloat(position[0]);
    send.addFloat(position[1]);
    send.addFloat(position[2]);
}

fun void sendActive()
{
    send.startMsg("/active", "iiii");
    send.addInt(2);
    send.addInt(10);
    send.addInt(0);
    send.addInt(0);
}

fun void updateCoords()
{
    Math.random2f(-25.0, 25.0) => float dx;
    Math.random2f(-33.0, 33.0) => float dy;
    Math.random2f(-42.0, 42.0) => float dz;

    updateCoord(h0, dx, dy, dz);
    updateCoord(h1, -dx, -dy, -dz);

    updateCoord(f00, dx, dy, dz);
    updateCoord(f01, dy, dx, dz);
    updateCoord(f02, dz, dx, dy);
    updateCoord(f03, dx, dz, dy);
    updateCoord(f04, dz, dy, dx);

    updateCoord(f10, -dx, -dy, -dz);
    updateCoord(f11, -dy, -dx, -dz);
    updateCoord(f12, -dz, -dx, -dy);
    updateCoord(f13, -dx, -dz, -dy);
    updateCoord(f14, -dz, -dy, -dx);
}

fun void updateCoord(float position[], float dx, float dy, float dz)
{
    Constrain.constrainf(position[0] + dx, 0.0, 200.0) => position[0];
    Constrain.constrainf(position[1] + dy, 0.0, 200.0) => position[1];
    Constrain.constrainf(position[2] + dz, 0.0, 200.0) => position[2];
}

while (true)
{
    <<<"   tick", now>>>;
    sendHands();
    sendFingers();
    sendActive();

    updateCoords();
    20::ms => now;
}

