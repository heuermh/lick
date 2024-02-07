/*

    LiCK  Library for ChucK.
    Copyright (c) 2007-2024 held jointly by the individual authors.

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

adc => Reverse reverse => dac;

reverse.stop();
0.8 => reverse.mix;

class Toggle extends Procedure
{
    fun void run()
    {
        reverse.toggle();
        <<<"running", reverse.running()>>>;
    }
}

class DelayUp extends Procedure
{
    fun void run()
    {
        reverse.delay() * 1.1 => reverse.delay;
        <<<"delay", reverse.delay()>>>;
    }
}

class DelayDown extends Procedure
{
    fun void run()
    {
        reverse.delay() * 0.96 => reverse.delay;
        <<<"delay", reverse.delay()>>>;
    }
}

class StrideUp extends Procedure
{
    fun void run()
    {
        reverse.stride() + 1 => reverse.stride;
        <<<"stride", reverse.stride()>>>;
    }
}

class StrideDown extends Procedure
{
    fun void run()
    {
        reverse.stride() - 1 => reverse.stride;
        <<<"stride", reverse.stride()>>>;
    }
}

Toggle toggle;
DelayUp delayUp;
DelayDown delayDown;
StrideUp strideUp;
StrideDown strideDown;

StompKeyboard stomp;
toggle @=> stomp.button0Down;
delayUp @=> stomp.button1Down;
delayDown @=> stomp.button2Down;
strideUp @=> stomp.button3Down;
strideDown @=> stomp.button4Down;

stomp.open(0);
