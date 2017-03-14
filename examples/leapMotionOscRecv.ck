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

// receive OSC data sent by Leap Motion

class Dump extends FloatFloatFloatProcedure
{
    string name;

    fun void run(float x, float y, float z)
    {
        <<<name, x, y, z>>>;
    }
}

Dump hand0;
"/hand0" => hand0.name;
Dump hand1;
"/hand1" => hand1.name;

Dump finger00;
"/finger0-0" => finger00.name;
Dump finger01;
"/finger0-1" => finger01.name;
Dump finger02;
"/finger0-2" => finger02.name;
Dump finger03;
"/finger0-3" => finger03.name;
Dump finger04;
"/finger0-4" => finger04.name;

Dump finger10;
"/finger1-0" => finger10.name;
Dump finger11;
"/finger1-1" => finger11.name;
Dump finger12;
"/finger1-2" => finger12.name;
Dump finger13;
"/finger1-3" => finger13.name;
Dump finger14;
"/finger1-4" => finger14.name;

LeapMotionOsc leapMotion;
leapMotion.addHand("/hand0", hand0);
leapMotion.addHand("/hand1", hand1);
leapMotion.addFinger("/finger0-0", finger00);
leapMotion.addFinger("/finger0-1", finger01);
leapMotion.addFinger("/finger0-2", finger02);
leapMotion.addFinger("/finger0-3", finger03);
leapMotion.addFinger("/finger0-4", finger04);
leapMotion.addFinger("/finger1-0", finger10);
leapMotion.addFinger("/finger1-1", finger11);
leapMotion.addFinger("/finger1-2", finger12);
leapMotion.addFinger("/finger1-3", finger13);
leapMotion.addFinger("/finger1-4", finger14);

leapMotion.connect();
<<<"listening on port", leapMotion.port>>>;

1::week => now;
