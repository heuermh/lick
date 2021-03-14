/*

    LiCK  Library for ChucK.
    Copyright (c) 2007-2021 held jointly by the individual authors.

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

Triphaser triphaser;

triphaser.high.hyperLfo();
triphaser.middle.hyperLfo();
triphaser.low.hyperLfo();

2.0 => float rate;
0.8 => float depth;
Intervals.majorThird() @=> Interval interval;

triphaser.syncLfo(rate, interval);

class Toggle extends Procedure
{
    fun void run()
    {
        triphaser.toggle();
        <<<"running", triphaser.running()>>>;
    }
}

class IncreaseDepth extends Procedure
{
    fun void run()
    {
        Constrain.constrainf(depth * 1.1, 0.0, 1.0) => depth;
        depth => triphaser.high.depth;
        depth => triphaser.middle.depth;
        depth => triphaser.low.depth;
        <<<"increaseDepth", depth>>>;
    }
}

class DecreaseDepth extends Procedure
{
    fun void run()
    {
        Constrain.constrainf(depth * 0.9, 0.0, 1.0) => depth;
        depth => triphaser.high.depth;
        depth => triphaser.middle.depth;
        depth => triphaser.low.depth;
        <<<"decreaseDepth", depth>>>;
    }
}

class IncreaseRate extends Procedure
{
    fun void run()
    {
        Constrain.constrainf(rate * 1.1, 0.001, 44100.0) => rate;
        triphaser.syncLfo(rate, interval);
        <<<"increaseRate", rate>>>;
    }
}

class DecreaseRate extends Procedure
{
    fun void run()
    {
        Constrain.constrainf(rate * 0.9, 0.001, 44100.0) => rate;
        triphaser.syncLfo(rate, interval);
        <<<"decreaseRate", rate>>>;
    }
}

class HyperLfo extends Procedure
{
    fun void run()
    {
        triphaser.high.hyperLfo();
        triphaser.middle.hyperLfo();
        triphaser.low.hyperLfo();
        <<<"hyperLfo", triphaser.low.rate()>>>;
    }
}

class SmoothSampleHoldLfo extends Procedure
{
    fun void run()
    {
        triphaser.high.smoothSampleHoldLfo();
        triphaser.middle.smoothSampleHoldLfo();
        triphaser.low.smoothSampleHoldLfo();
        <<<"smoothSampleHoldLfo", triphaser.low.rate()>>>;
    }
}

adc => triphaser => dac;

Toggle toggle;
IncreaseDepth increaseDepth;
DecreaseDepth decreaseDepth;
IncreaseRate increaseRate;
DecreaseRate decreaseRate;
HyperLfo hyperLfo;
SmoothSampleHoldLfo smoothSampleHoldLfo;

StompKeyboard stomp;
toggle @=> stomp.button0Down;
//increaseDepth @=> stomp.button1Down;
//decreaseDepth @=> stomp.button2Down;
increaseRate @=> stomp.button3Down;
decreaseRate @=> stomp.button4Down;
hyperLfo @=> stomp.button1Down;
smoothSampleHoldLfo @=> stomp.button2Down;

<<<"ready">>>;
stomp.open(0);
