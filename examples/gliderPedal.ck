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

adc => Glider glider => dac;

glider.stop();
0.8 => glider.mix;

class Toggle extends Procedure
{
    fun void run()
    {
        glider.toggle();
        <<<"running", glider.running()>>>;
    }
}

class ShortDelayUp extends Procedure
{
    fun void run()
    {
        glider.shortDelay.delay() * 1.1 => glider.shortDelay.delay;
        <<<"shortDelay", glider.shortDelay.delay()>>>;
    }
}

class ShortDelayDown extends Procedure
{
    fun void run()
    {
        glider.shortDelay.delay() * 0.96 => glider.shortDelay.delay;
        <<<"shortDelay", glider.shortDelay.delay()>>>;
    }
}

class LongDelayUp extends Procedure
{
    fun void run()
    {
        glider.longDelay.delay() * 1.1 => glider.longDelay.delay;
        <<<"longDelay", glider.longDelay.delay()>>>;
    }
}

class LongDelayDown extends Procedure
{
    fun void run()
    {
        glider.longDelay.delay() * 0.96 => glider.longDelay.delay;
        <<<"longDelay", glider.longDelay.delay()>>>;
    }
}

Toggle toggle;
ShortDelayUp shortDelayUp;
ShortDelayDown shortDelayDown;
LongDelayUp longDelayUp;
LongDelayDown longDelayDown;


StompKeyboard stomp;
toggle @=> stomp.button0Down;
shortDelayUp @=> stomp.button1Down;
shortDelayDown @=> stomp.button2Down;
longDelayUp @=> stomp.button3Down;
longDelayDown @=> stomp.button4Down;

stomp.open(0);
