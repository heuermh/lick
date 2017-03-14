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

adc => Gain dry => dac;
adc => Gen17 gen17 => Gain wet => dac;

[1.0, 0.5, 0.25, 0.125, 0.06, 0.03, 0.015] @=> float coefs[];

0.0 => dry.gain;
1.0 => wet.gain;
coefs => gen17.coefs;

class MoreEvens extends Procedure
{
    fun void run()
    {
        coefs[1] * 1.1 => coefs[1];
        coefs[3] * 1.1 => coefs[3];
        coefs[5] * 1.1 => coefs[5];
        coefs => gen17.coefs;
    }
}

class LessEvens extends Procedure
{
    fun void run()
    {
        coefs[1] * 0.8 => coefs[1];
        coefs[3] * 0.8 => coefs[3];
        coefs[5] * 0.8 => coefs[5];
        coefs => gen17.coefs;
    }
}

class MoreOdds extends Procedure
{
    fun void run()
    {
        coefs[0] * 1.1 => coefs[0];
        coefs[2] * 1.1 => coefs[2];
        coefs[4] * 1.1 => coefs[4];
        coefs[6] * 1.1 => coefs[6];
        coefs => gen17.coefs;
    }
}

class LessOdds extends Procedure
{
    fun void run()
    {
        coefs[0] * 0.8 => coefs[0];
        coefs[2] * 0.8 => coefs[2];
        coefs[4] * 0.8 => coefs[4];
        coefs[6] * 0.8 => coefs[6];
        coefs => gen17.coefs;
    }
}

class Toggle extends Procedure
{
    true => int running;

    fun void run()
    {
        if (running)
        {
            1.0 => dry.gain;
            0.0 => wet.gain;
            false => running;
        }
        else
        {
            0.0 => dry.gain;
            1.0 => wet.gain;
            true => running;
        }
        <<<"running", running>>>;
    }
}

Toggle toggle;
MoreEvens moreEvens;
LessEvens lessEvens;
MoreOdds moreOdds;
LessOdds lessOdds;

StompKeyboard stomp;
toggle @=> stomp.button0Down;
moreEvens @=> stomp.button1Down;
lessEvens @=> stomp.button2Down;
moreOdds @=> stomp.button3Down;
lessOdds @=> stomp.button4Down;

stomp.open(0);
