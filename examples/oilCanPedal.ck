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

OilCan oilCan;

class Toggle extends Procedure
{
    fun void run()
    {
        oilCan.toggle();
        <<<"toggle", oilCan.running()>>>;
    }
}

class IncreaseTiming extends Procedure
{
    fun void run()
    {
        Constrain.constrainf(oilCan.timing() * 1.1, 1.0, 5.0) => oilCan.timing;
        <<<"timing", oilCan.timing()>>>;
    }
}

class DecreaseTiming extends Procedure
{
    fun void run()
    {
        Constrain.constrainf(oilCan.timing() * 0.9, 1.0, 5.0) => oilCan.timing;
        <<<"timing", oilCan.timing()>>>;
    }
}

class IncreaseBalance extends Procedure
{
    fun void run()
    {
        Constrain.constrainf(oilCan.balance() * 1.1, 0.0, 1.0) => oilCan.balance;
        <<<"balance", oilCan.balance()>>>;
    }
}

class DecreaseBalance extends Procedure
{
    fun void run()
    {
        Constrain.constrainf(oilCan.balance() * 0.9, 0.0, 1.0) => oilCan.balance;
        <<<"balance", oilCan.balance()>>>;
    }
}

class IncreaseBlend extends Procedure
{
    fun void run()
    {
        Constrain.constrainf(oilCan.blend() * 1.1, 0.0, 1.0) => oilCan.blend;
        <<<"blend", oilCan.blend()>>>;
    }
}

class DecreaseBlend extends Procedure
{
    fun void run()
    {
        Constrain.constrainf(oilCan.blend() * 0.9, 0.0, 1.0) => oilCan.blend;
        <<<"blend", oilCan.blend()>>>;
    }
}

class IncreaseReverb extends Procedure
{
    fun void run()
    {
        Constrain.constrainf(oilCan.reverb() * 1.1, 0.0, 1.0) => oilCan.reverb;
        <<<"reverb", oilCan.reverb()>>>;
    }
}

class DecreaseReverb extends Procedure
{
    fun void run()
    {
        Constrain.constrainf(oilCan.reverb() * 0.9, 0.0, 1.0) => oilCan.reverb;
        <<<"reverb", oilCan.reverb()>>>;
    }
}

class IncreaseWidth extends Procedure
{
    fun void run()
    {
        Constrain.constrainf(oilCan.width() * 1.1, 0.0, 1.0) => oilCan.width;
        <<<"width", oilCan.width()>>>;
    }
}

class DecreaseWidth extends Procedure
{
    fun void run()
    {
        Constrain.constrainf(oilCan.width() * 0.9, 0.0, 1.0) => oilCan.width;
        <<<"width", oilCan.width()>>>;
    }
}

adc => oilCan => dac;

Toggle toggle;
IncreaseTiming increaseTiming;
DecreaseTiming decreaseTiming;
IncreaseBalance increaseBalance;
DecreaseBalance decreaseBalance;
IncreaseBlend increaseBlend;
DecreaseBlend decreaseBlend;
IncreaseReverb increaseReverb;
DecreaseReverb decreaseReverb;
IncreaseWidth increaseWidth;
DecreaseWidth decreaseWidth;

StompKeyboard stomp;
toggle @=> stomp.button0Down;
increaseTiming @=> stomp.button1Down;
decreaseTiming @=> stomp.button2Down;
//increaseBalance @=> stomp.button1Down;
//decreaseBalance @=> stomp.button2Down;
//increaseBlend @=> stomp.button1Down;
//decreaseBlend @=> stomp.button2Down;
increaseReverb @=> stomp.button3Down;
decreaseReverb @=> stomp.button4Down;
//increaseWidth @=> stomp.button1Down;
//decreaseWidth @=> stomp.button2Down;

<<<"ready">>>;
stomp.open(0);
