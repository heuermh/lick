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

Totter totter;

class Toggle extends Procedure
{
    fun void run()
    {
        totter.toggle();
        <<<"running", totter.running()>>>;
    }
}

class IncreaseDelay extends Procedure
{
    fun void run()
    {
        Constrain.constraind(totter.delay() * 1.1, 0::ms, 2::second) => totter.delay;
        <<<"delay", totter.delay()>>>;
    }
}

class DecreaseDelay extends Procedure
{
    fun void run()
    {
        Constrain.constraind(totter.delay() * 0.9, 0::ms, 2::second) => totter.delay;
        <<<"delay", totter.delay()>>>;
    }
}

class IncreaseFeedback extends Procedure
{
    fun void run()
    {
        Constrain.constrainf(totter.feedback() * 1.1, 0.0, 1.0) => totter.feedback;
        <<<"feedback", totter.feedback()>>>;
    }
}

class DecreaseFeedback extends Procedure
{
    fun void run()
    {
        Constrain.constrainf(totter.feedback() * 0.9, 0.0, 1.0) => totter.feedback;
        <<<"feedback", totter.feedback()>>>;
    }
}

class Thirds extends Procedure
{
    fun void run()
    {
        totter.thirds();
        <<<"thirds">>>;
    }
}

class Quarters extends Procedure
{
    fun void run()
    {
        totter.quarters();
        <<<"quarters">>>;
    }
}

class Syncopate extends Procedure
{
    fun void run()
    {
        if (totter.syncopate() > 0.0)
        {
            0.33 => totter.syncopate;
        }
        else
        {
            0.0 => totter.syncopate;
        }
        <<<"syncopate", totter.syncopate()>>>;
    }
}

0.80 => totter.mix;
0.60 => totter.feedback;

adc => totter => dac;

Toggle toggle;
IncreaseDelay increaseDelay;
DecreaseDelay decreaseDelay;
IncreaseFeedback increaseFeedback;
DecreaseFeedback decreaseFeedback;
Thirds thirds;
Quarters quarters;
Syncopate syncopate;

StompKeyboard stomp;
toggle @=> stomp.button0Down;
increaseDelay @=> stomp.button1Down;
decreaseDelay @=> stomp.button2Down;
//increaseFeedback @=> stomp.button1Down;
//decreaseFeedback @=> stomp.button1Down;
thirds @=> stomp.button3Down;
quarters @=> stomp.button4Down;
syncopate @=> stomp.button5Down;

stomp.open(0);
