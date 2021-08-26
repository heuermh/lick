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

adc => Pass pass => dac;

pass.stop();
0.8 => pass.mix;

class Toggle extends Procedure
{
    fun void run()
    {
        pass.toggle();
        <<<"running", pass.running()>>>;
    }
}

class RateUp extends Procedure
{
    fun void run()
    {
        pass.rate() * 1.1 => pass.rate;
        <<<"rate", pass.rate()>>>;
    }
}

class RateDown extends Procedure
{
    fun void run()
    {
        pass.rate() * 0.96 => pass.rate;
        <<<"rate", pass.rate()>>>;
    }
}

class DepthUp extends Procedure
{
    fun void run()
    {
        pass.depth() * 1.1 => pass.depth;
        <<<"depth", pass.depth()>>>;
    }
}

class DepthDown extends Procedure
{
    fun void run()
    {
        pass.depth() * 0.96 => pass.depth;
        <<<"depth", pass.depth()>>>;
    }
}

class FreqUp extends Procedure
{
    fun void run()
    {
        pass._freq * 1.1 => pass.freq;
        <<<"freq", pass._freq>>>;
    }
}

class FreqDown extends Procedure
{
    fun void run()
    {
        pass._freq * 0.96 => pass.freq;
        <<<"freq", pass._freq>>>;
    }
}

Toggle toggle;
RateUp rateUp;
RateDown rateDown;
DepthUp depthUp;
DepthDown depthDown;
FreqUp freqUp;
FreqDown freqDown;

StompKeyboard stomp;
toggle @=> stomp.button0Down;
rateUp @=> stomp.button1Down;
rateDown @=> stomp.button2Down;
depthUp @=> stomp.button3Down;
depthDown @=> stomp.button4Down;
freqUp @=> stomp.button5Down;
//freqDown @=> stomp.button6Down;

stomp.open(0);
