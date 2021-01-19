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

Masa masa;

masa.stop();

class Toggle extends Procedure
{
    fun void run()
    {
        masa.toggle();
        <<<"running", masa.running()>>>;
    }
}

class IncreaseSpread extends Procedure
{
    fun void run()
    {
        Constrain.constrainf(masa.spread() * 1.1, 0.0, 1.0) => masa.spread;
        <<<"spread", masa.spread()>>>;
    }
}

class DecreaseSpread extends Procedure
{
    fun void run()
    {
        Constrain.constrainf(masa.spread() * 0.9, 0.0, 1.0) => masa.spread;
        <<<"spread", masa.spread()>>>;
    }
}

adc => masa => dac;

Toggle toggle;
IncreaseSpread increaseSpread;
DecreaseSpread decreaseSpread;

StompKeyboard stomp;
toggle @=> stomp.button0Down;
increaseSpread @=> stomp.button1Down;
decreaseSpread @=> stomp.button2Down;

<<<"ready">>>;
stomp.open(0);
