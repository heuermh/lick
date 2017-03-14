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

Chew chew;

chew.stop();
1.0 => chew.mix;
0.1 => chew.topDepth;
0.1 => chew.bottomDepth;
440.0 => chew.topRate;
440.0 => chew.bottomRate;

class Toggle extends Procedure
{
    fun void run()
    {
        chew.toggle();
        <<<"running", chew.running()>>>;
    }
}

class IncreaseDepth extends Procedure
{
    fun void run()
    {
        Constrain.constrainf(chew.topDepth() * 1.1, 0.0, 0.8) => chew.topDepth;
        Constrain.constrainf(chew.bottomDepth() * 1.1, 0.0, 0.8) => chew.bottomDepth;
        <<<"depth", chew.topDepth()>>>;
    }
}

class DecreaseDepth extends Procedure
{
    fun void run()
    {
        Constrain.constrainf(chew.topDepth() * 0.9, 0.0, 0.8) => chew.topDepth;
        Constrain.constrainf(chew.bottomDepth() * 0.9, 0.0, 0.8) => chew.bottomDepth;
        <<<"depth", chew.topDepth()>>>;
    }
}

class IncreaseRate extends Procedure
{
    fun void run()
    {
        Constrain.constrainf(chew.topRate() * 1.1, 0.0, 100000.0) => chew.topRate;
        Constrain.constrainf(chew.bottomRate() * 1.1, 0.0, 100000.0) => chew.bottomRate;
        <<<"rate", chew.topRate()>>>;
    }
}

class DecreaseRate extends Procedure
{
    fun void run()
    {
        Constrain.constrainf(chew.topRate() * 0.9, 0.0, 100000.0) => chew.topRate;
        Constrain.constrainf(chew.bottomRate() * 0.9, 0.0, 100000.0) => chew.bottomRate;
        <<<"rate", chew.topRate()>>>;
    }
}

adc => chew => dac;

Toggle toggle;
IncreaseDepth increaseDepth;
DecreaseDepth decreaseDepth;
IncreaseRate increaseRate;
DecreaseRate decreaseRate;

StompKeyboard stomp;
toggle @=> stomp.button0Down;
increaseDepth @=> stomp.button1Down;
decreaseDepth @=> stomp.button2Down;
increaseRate @=> stomp.button3Down;
decreaseRate @=> stomp.button4Down;

<<<"ready">>>;
stomp.open(0);
