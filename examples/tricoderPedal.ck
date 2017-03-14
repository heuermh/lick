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

Tricoder tricoder;

tricoder.high.hyperLfo();
tricoder.middle.hyperLfo();
tricoder.low.hyperLfo();

2.0 => float rate;
0.8 => float depth;
Intervals.majorThird() @=> Interval interval;

tricoder.syncLfo(rate, interval);

class Toggle extends Procedure
{
    fun void run()
    {
        tricoder.toggle();
        <<<"running", tricoder.running()>>>;
    }
}

class IncreaseDepth extends Procedure
{
    fun void run()
    {
        Constrain.constrainf(depth * 1.1, 0.0, 1.0) => depth;
        depth => tricoder.high.depth;
        depth => tricoder.middle.depth;
        depth => tricoder.low.depth;
    }
}

class DecreaseDepth extends Procedure
{
    fun void run()
    {
        Constrain.constrainf(depth * 0.9, 0.0, 1.0) => depth;
        depth => tricoder.high.depth;
        depth => tricoder.middle.depth;
        depth => tricoder.low.depth;
    }
}

class IncreaseRate extends Procedure
{
    fun void run()
    {
        Constrain.constrainf(rate * 1.1, 0.001, 44100.0) => rate;
        tricoder.syncLfo(rate, interval);
    }
}

class DecreaseRate extends Procedure
{
    fun void run()
    {
        Constrain.constrainf(rate * 0.9, 0.001, 44100.0) => rate;
        tricoder.syncLfo(rate, interval);
    }
}

adc => tricoder => dac;

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
