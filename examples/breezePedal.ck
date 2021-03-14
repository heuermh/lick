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

adc => Breeze breeze => dac;

breeze.stop();
0.8 => breeze.mix;

class Toggle extends Procedure
{
    fun void run()
    {
        breeze.toggle();
        <<<"running", breeze.running()>>>;
    }
}

class DelayUp extends Procedure
{
    fun void run()
    {
        breeze.delay() * 1.1 => breeze.delay;
        <<<"delay", breeze.delay()>>>;
    }
}

class DelayDown extends Procedure
{
    fun void run()
    {
        breeze.delay() * 0.96 => breeze.delay;
        <<<"delay", breeze.delay()>>>;
    }
}

class ShiftUp extends Procedure
{
    fun void run()
    {
        breeze.shift() * 1.1 => breeze.shift;
        <<<"shift", breeze.shift()>>>;
    }
}

class ShiftDown extends Procedure
{
    fun void run()
    {
        breeze.shift() * 0.96 => breeze.shift;
        <<<"shift", breeze.shift()>>>;
    }
}

class FeedbackShiftUp extends Procedure
{
    fun void run()
    {
        breeze.feedbackShift() * 1.1 => breeze.feedbackShift;
        <<<"feedbackShift", breeze.feedbackShift()>>>;
    }
}

class FeedbackShiftDown extends Procedure
{
    fun void run()
    {
        breeze.feedbackShift() * 0.96 => breeze.feedbackShift;
        <<<"feedbackShift", breeze.feedbackShift()>>>;
    }
}

Toggle toggle;
DelayUp delayUp;
DelayDown delayDown;
ShiftUp shiftUp;
ShiftDown shiftDown;
FeedbackShiftUp feedbackShiftUp;
FeedbackShiftDown feedbackShiftDown;

StompKeyboard stomp;
toggle @=> stomp.button0Down;
delayUp @=> stomp.button1Down;
delayDown @=> stomp.button2Down;
shiftUp @=> stomp.button3Down;
shiftDown @=> stomp.button4Down;
feedbackShiftUp @=> stomp.button5Down;
feedbackShiftDown @=> stomp.button6Down;

stomp.open(0);
