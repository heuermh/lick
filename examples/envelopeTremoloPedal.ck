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

EnvelopeTremolo envelopeTremolo;

envelopeTremolo.stop();
30::ms => envelopeTremolo.duration;
16.666 => envelopeTremolo.rate;

class Toggle extends Procedure
{
    fun void run()
    {
        envelopeTremolo.toggle();
        <<<"running", envelopeTremolo.running()>>>;
    }
}

class IncreaseRate extends Procedure
{
    fun void run()
    {
        Constrain.constrainf(envelopeTremolo.rate() * 1.1, 0.0001, 2000.0) => envelopeTremolo.rate;
        <<<"rate", envelopeTremolo.rate()>>>;
    }
}

class DecreaseRate extends Procedure
{
    fun void run()
    {
        Constrain.constrainf(envelopeTremolo.rate() * 0.9, 0.0001, 2000.0) => envelopeTremolo.rate;
        <<<"rate", envelopeTremolo.rate()>>>;
    }
}

class ScaleUp extends Procedure
{
    fun void run()
    {
        envelopeTremolo.scale(1.05);
        <<<"duration", envelopeTremolo.duration()>>>;
    }
}

class ScaleDown extends Procedure
{
    fun void run()
    {
        envelopeTremolo.scale(0.95);
        <<<"duration", envelopeTremolo.duration()>>>;
    }
}

adc => envelopeTremolo => dac;

Toggle toggle;
IncreaseRate increaseRate;
DecreaseRate decreaseRate;
ScaleUp scaleUp;
ScaleDown scaleDown;

StompKeyboard stomp;
toggle @=> stomp.button0Down;
increaseRate @=> stomp.button1Down;
decreaseRate @=> stomp.button2Down;
scaleUp @=> stomp.button3Down;
scaleDown @=> stomp.button4Down;

<<<"ready">>>;
stomp.open(0);
