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

adc => Currant currant => dac;

1.0 => currant.mix;

class Toggle extends Procedure
{
    fun void run()
    {
        currant.toggle();
        <<<"running", currant.running()>>>;
    }
}

class IncreaseRate extends Procedure
{
    fun void run()
    {
        currant.rate() * 1.1 => currant.rate;
        <<<"lfo freq", currant.rate()>>>;
    }
}

class DecreaseRate extends Procedure
{
    fun void run()
    {
        currant.rate() * 0.9 => currant.rate;
        <<<"lfo freq", currant.rate()>>>;
    }
}

class IncreaseCutoff extends Procedure
{
    fun void run()
    {
        Constrain.constrainf(currant.cutoff() * 1.1, 10.0, 100000.0) => currant.cutoff;
        <<<"cutoff", currant.cutoff()>>>;
    }
}

class DecreaseCutoff extends Procedure
{
    fun void run()
    {
        Constrain.constrainf(currant.cutoff() * 0.9, 10.0, 100000.0) => currant.cutoff;
        <<<"cutoff", currant.cutoff()>>>;
    }
}

Toggle toggle;
IncreaseRate increaseRate;
DecreaseRate decreaseRate;
IncreaseCutoff increaseCutoff;
DecreaseCutoff decreaseCutoff;

StompKeyboard stomp;
toggle @=> stomp.button0Down;
increaseRate @=> stomp.button1Down;
decreaseRate @=> stomp.button2Down;
increaseCutoff @=> stomp.button3Down;
decreaseCutoff @=> stomp.button4Down;

stomp.open(0);
