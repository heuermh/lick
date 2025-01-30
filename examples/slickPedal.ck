/*

    LiCK  Library for ChucK.
    Copyright (c) 2007-2025 held jointly by the individual authors.

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

@import "../lick/device/StompKeyboard"
@import "../lick/effect/Slick"

adc => Slick slick => dac;

slick.stop();
0.8 => slick.mix;

class Toggle extends Procedure
{
    fun void run()
    {
        slick.toggle();
        <<<"running", slick.running()>>>;
    }
}

class DelayUp extends Procedure
{
    fun void run()
    {
        slick.delay() * 1.1 => slick.delay;
        <<<"delay", slick.delay()>>>;
    }
}

class DelayDown extends Procedure
{
    fun void run()
    {
        slick.delay() * 0.96 => slick.delay;
        <<<"delay", slick.delay()>>>;
    }
}

class FeedbackUp extends Procedure
{
    fun void run()
    {
        slick.feedback() * 1.1 => slick.feedback;
        <<<"feedback", slick.feedback()>>>;
    }
}

class FeedbackDown extends Procedure
{
    fun void run()
    {
        slick.feedback() * 0.96 => slick.feedback;
        <<<"feedback", slick.feedback()>>>;
    }
}

class RateUp extends Procedure
{
    fun void run()
    {
        slick.rate() * 1.1 => slick.rate;
        <<<"rate", slick.rate()>>>;
    }
}

class RateDown extends Procedure
{
    fun void run()
    {
        slick.rate() * 0.96 => slick.rate;
        <<<"rate", slick.rate()>>>;
    }
}

class FreqUp extends Procedure
{
    fun void run()
    {
        slick.freq() * 1.1 => slick.freq;
        <<<"freq", slick.freq()>>>;
    }
}

class FreqDown extends Procedure
{
    fun void run()
    {
        slick.freq() * 0.96 => slick.freq;
        <<<"freq", slick.freq()>>>;
    }
}

class DepthUp extends Procedure
{
    fun void run()
    {
        slick.depth() * 1.1 => slick.depth;
        <<<"depth", slick.depth()>>>;
    }
}

class DepthDown extends Procedure
{
    fun void run()
    {
        slick.depth() * 0.96 => slick.depth;
        <<<"depth", slick.depth()>>>;
    }
}

Toggle toggle;
DelayUp delayUp;
DelayDown delayDown;
FeedbackUp feedbackUp;
FeedbackDown feedbackDown;
RateUp rateUp;
RateDown rateDown;
FreqUp freqUp;
FreqDown freqDown;
DepthUp depthUp;
DepthDown depthDown;

StompKeyboard stomp;
toggle @=> stomp.button0Down;
delayUp @=> stomp.button1Down;
delayDown @=> stomp.button2Down;
//feedbackUp @=> stomp.button3Down;
//feedbackDown @=> stomp.button4Down;
//rateUp @=> stomp.button3Down;
//rateDown @=> stomp.button4Down;
freqUp @=> stomp.button3Down;
freqDown @=> stomp.button4Down;
//depthUp @=> stomp.button3Down;
//depthDown @=> stomp.button4Down;

stomp.open(0);
