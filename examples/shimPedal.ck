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

adc => Shim shim => dac;

shim.stop();
0.5 => shim.mix;

class Toggle extends Procedure
{
    fun void run()
    {
        shim.toggle();
        <<<"running", shim.running()>>>;
    }
}

class DelayUp extends Procedure
{
    fun void run()
    {
        shim.delay() * 1.1 => shim.delay;
        <<<"delay", shim.delay()>>>;
    }
}

class DelayDown extends Procedure
{
    fun void run()
    {
        shim.delay() * 0.96 => shim.delay;
        <<<"delay", shim.delay()>>>;
    }
}

class FeedbackUp extends Procedure
{
    fun void run()
    {
        Constrain.constrainf(shim.feedback() * 1.1, 0.0, 1.0) => shim.feedback;
        <<<"feedback", shim.feedback()>>>;
    }
}

class FeedbackDown extends Procedure
{
    fun void run()
    {
        Constrain.constrainf(shim.feedback() * 0.96, 0.0, 1.0) => shim.feedback;
        <<<"feedback", shim.feedback()>>>;
    }
}

Toggle toggle;
DelayUp delayUp;
DelayDown delayDown;
FeedbackUp feedbackUp;
FeedbackDown feedbackDown;

StompKeyboard stomp;
toggle @=> stomp.button0Down;
delayUp @=> stomp.button1Down;
delayDown @=> stomp.button2Down;
feedbackUp @=> stomp.button3Down;
feedbackDown @=> stomp.button4Down;

stomp.open(0);
