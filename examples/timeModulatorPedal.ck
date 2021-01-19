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

adc => TimeModulator tm => dac;

class Toggle extends Procedure
{
    fun void run()
    {
        tm.toggle();
        <<<"toggle ", tm.running()>>>;
    }
}

class IncreaseRate extends Procedure
{
    fun void run()
    {
        tm.rate() * 1.5 => tm.rate;
        <<<"rate ", tm.rate()>>>;
    }
}

class DecreaseRate extends Procedure
{
    fun void run()
    {
        tm.rate() * 0.75 => tm.rate;
        <<<"rate ", tm.rate()>>>;
    }
}

class IncreaseDepth extends Procedure
{
    fun void run()
    {
        tm.depth() * 1.5 => tm.depth;
        <<<"depth ", tm.depth()>>>;
    }
}

class DecreaseDepth extends Procedure
{
    fun void run()
    {
        tm.depth() * 0.75 => tm.depth;
        <<<"depth ", tm.depth()>>>;
    }
}

Toggle toggle;
IncreaseRate increaseRate;
DecreaseRate decreaseRate;
IncreaseDepth increaseDepth;
DecreaseDepth decreaseDepth;

StompKeyboard stomp;
toggle @=> stomp.button0Down;
increaseRate @=> stomp.button1Down;
decreaseRate @=> stomp.button2Down;
increaseDepth @=> stomp.button3Down;
decreaseDepth @=> stomp.button4Down;

stomp.open(0);
