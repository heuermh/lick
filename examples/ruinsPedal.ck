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

@import "../lick/effect/Ruins"
@import "../lick/device/StompKeyboard"

adc => Ruins ruins => dac;

0.8 => ruins.mix;

class Toggle extends Procedure
{
    fun void run()
    {
        ruins.toggle();
        <<<"toggle", ruins.running()>>>;
    }
}

class RateUp extends Procedure
{
    fun void run()
    {
        ruins.rate() * 1.1 => ruins.rate;
        <<<"rate", ruins.rate()>>>;
    }
}

class RateDown extends Procedure
{
    fun void run()
    {
        ruins.rate() * 0.96 => ruins.rate;
        <<<"rate", ruins.rate()>>>;
    }
}

class DepthUp extends Procedure
{
    fun void run()
    {
        ruins.depth() * 1.1 => ruins.depth;
        <<<"depth", ruins.depth()>>>;
    }
}

class DepthDown extends Procedure
{
    fun void run()
    {
        ruins.depth() * 0.96 => ruins.depth;
        <<<"depth", ruins.depth()>>>;
    }
}

Toggle toggle;
RateUp rateUp;
RateDown rateDown;
DepthUp depthUp;
DepthDown depthDown;

StompKeyboard stomp;
toggle @=> stomp.button0Down;
rateUp @=> stomp.button1Down;
rateDown @=> stomp.button2Down;
depthUp @=> stomp.button3Down;
depthDown @=> stomp.button4Down;

stomp.open(0);
