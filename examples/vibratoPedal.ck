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

adc => Vibrato vibrato => dac;

0.9 => vibrato.mix;

vibrato.stop();

class Toggle extends Procedure
{
    fun void run()
    {
        vibrato.toggle();
        <<<"running", vibrato.running()>>>;
    }
}

class IncreaseRate extends Procedure
{
    fun void run()
    {
        Constrain.constrainf(vibrato.rate() * 1.1, 2.0, 8.0) => vibrato.rate;
        <<<"rate", vibrato.rate()>>>;
    }
}

class DecreaseRate extends Procedure
{
    fun void run()
    {
        Constrain.constrainf(vibrato.rate() * 0.9, 2.0, 8.0) => vibrato.rate;
        <<<"rate", vibrato.rate()>>>;
    }
}

class IncreaseVibratoRate extends Procedure
{
    fun void run()
    {
        vibrato.vibratoRate() * 1.1 => vibrato.vibratoRate;
        <<<"vibrato rate", vibrato.vibratoRate()>>>;
    }
}

class DecreaseVibratoRate extends Procedure
{
    fun void run()
    {
        vibrato.vibratoRate() * 0.9 => vibrato.vibratoRate;
        <<<"vibrato rate", vibrato.vibratoRate()>>>;
    }
}

Toggle toggle;
IncreaseRate increaseRate;
DecreaseRate decreaseRate;
IncreaseVibratoRate increaseVibratoRate;
DecreaseVibratoRate decreaseVibratoRate;

StompKeyboard stomp;
toggle @=> stomp.button0Down;
increaseRate @=> stomp.button1Down;
decreaseRate @=> stomp.button2Down;
increaseVibratoRate @=> stomp.button3Down;
decreaseVibratoRate @=> stomp.button4Down;

stomp.open(0);
