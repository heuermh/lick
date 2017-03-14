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

DigitalDelay delay;

class Toggle extends Procedure
{
    fun void run()
    {
        delay.toggle();
        <<<"running", delay.running()>>>;
    }
}

class IncreaseDelay extends Procedure
{
    fun void run()
    {
        Constrain.constraind(delay.delay() * 1.1, 0::ms, 2::second) => delay.delay;
        <<<"delay", delay.delay()>>>;
    }
}

class DecreaseDelay extends Procedure
{
    fun void run()
    {
        Constrain.constraind(delay.delay() * 0.9, 0::ms, 2::second) => delay.delay;
        <<<"delay", delay.delay()>>>;
    }
}

class IncreaseFeedback extends Procedure
{
    fun void run()
    {
        Constrain.constrainf(delay.feedback() * 1.1, 0.0, 1.0) => delay.feedback;
        <<<"feedback", delay.feedback()>>>;
    }
}

class DecreaseFeedback extends Procedure
{
    fun void run()
    {
        Constrain.constrainf(delay.feedback() * 0.9, 0.0, 1.0) => delay.feedback;
        <<<"feedback", delay.feedback()>>>;
    }
}

adc => delay => dac;

2::second => delay.max;
600::ms => delay.delay;
0.95 => delay.feedback;
0.80 => delay.mix;

Toggle toggle;
IncreaseDelay increaseDelay;
DecreaseDelay decreaseDelay;
IncreaseFeedback increaseFeedback;
DecreaseFeedback decreaseFeedback;

StompKeyboard stomp;
toggle @=> stomp.button0Down;
increaseDelay @=> stomp.button1Down;
decreaseDelay @=> stomp.button2Down;
increaseFeedback @=> stomp.button3Down;
decreaseFeedback @=> stomp.button4Down;

stomp.open(0);
