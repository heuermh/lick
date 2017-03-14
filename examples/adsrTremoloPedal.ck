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

AdsrTremolo adsrTremolo;

adsrTremolo.stop();
1.0 => adsrTremolo.mix;
6::ms => adsrTremolo.attack;
24::ms => adsrTremolo.decay;
0.9 => adsrTremolo.sustain;
30::ms => adsrTremolo.release;
16.666 => adsrTremolo.rate;

class Toggle extends Procedure
{
    fun void run()
    {
        adsrTremolo.toggle();
        <<<"running", adsrTremolo.running()>>>;
    }
}

class IncreaseRate extends Procedure
{
    fun void run()
    {
        Constrain.constrainf(adsrTremolo.rate() * 1.1, 0.0001, 2000.0) => adsrTremolo.rate;
        <<<"rate", adsrTremolo.rate()>>>;
    }
}

class DecreaseRate extends Procedure
{
    fun void run()
    {
        Constrain.constrainf(adsrTremolo.rate() * 0.9, 0.0001, 2000.0) => adsrTremolo.rate;
        <<<"rate", adsrTremolo.rate()>>>;
    }
}

class ScaleUp extends Procedure
{
    fun void run()
    {
        adsrTremolo.scale(1.05);
        <<<"adsr", adsrTremolo.attack(), adsrTremolo.decay(), adsrTremolo.sustain(), adsrTremolo.release()>>>;
    }
}

class ScaleDown extends Procedure
{
    fun void run()
    {
        adsrTremolo.scale(0.95);
        <<<"adsr", adsrTremolo.attack(), adsrTremolo.decay(), adsrTremolo.sustain(), adsrTremolo.release()>>>;
    }
}

adc => adsrTremolo => dac;

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
