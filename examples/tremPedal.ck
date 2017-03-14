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

TimeSignature.common(98) @=> TimeSignature ts;

1.0 => float depth;

float rates[7];
ts.t/1::second => rates[0];
ts.s/1::second => rates[1];
ts.e/1::second => rates[2];
ts.q/1::second => rates[3];
ts.h/1::second => rates[4];
ts.w/1::second => rates[5];
ts.d/1::second => rates[6];
0 => int rateIndex;

Trem trem;
depth => trem.depth;
rates[rateIndex] => trem.rate;

fun void moreSqr()
{
    trem.moreSqr();
    <<<"more sqr", trem.sqrMix, trem.sinMix, trem.triMix>>>;
}

fun void moreSin()
{
    trem.moreSin();
    <<<"more sin", trem.sqrMix, trem.sinMix, trem.triMix>>>;
}

fun void moreTri()
{
    trem.moreTri();
    <<<"more tri", trem.sqrMix, trem.sinMix, trem.triMix>>>;
}

fun void increaseDepth()
{
    Constrain.constrainf(depth * 1.10, 0.0, 1.0) => depth;
    <<<"increase depth", depth>>>;
    depth => trem.depth;
}

fun void decreaseDepth()
{
    Constrain.constrainf(depth * 0.90, 0.0, 1.0) => depth;
    <<<"decrease depth", depth>>>;
    depth => trem.depth;
}

fun void increaseRate()
{
    Constrain.constrain(rateIndex + 1, 0, 6) => rateIndex;
    <<<"increase rate", rates[rateIndex]>>>;
    rates[rateIndex] => trem.rate;
}

fun void decreaseRate()
{
    Constrain.constrain(rateIndex - 1, 0, 6) => rateIndex;
    <<<"decrease rate", rates[rateIndex]>>>;
    rates[rateIndex] => trem.rate;
}

false => int running;

fun void toggle()
{
    if (running)
    {
        adc =< trem;
        trem =< dac;
        adc => dac;
        false => running;
    }
    else
    {
        adc =< dac;
        adc => trem => dac;
        true => running;
    }
    <<<"running", running>>>;
}

class MoreSqr extends Procedure
{
    fun void run()
    {
        moreSqr();
    }
}

class MoreSin extends Procedure
{
    fun void run()
    {
        moreSin();
    }
}

class MoreTri extends Procedure
{
    fun void run()
    {
        moreTri();
    }
}

class IncreaseDepth extends Procedure
{
    fun void run()
    {
        increaseDepth();
    }
}

class DecreaseDepth extends Procedure
{
    fun void run()
    {
        decreaseDepth();
    }
}

class IncreaseRate extends Procedure
{
    fun void run()
    {
        increaseRate();
    }
}

class DecreaseRate extends Procedure
{
    fun void run()
    {
        decreaseRate();
    }
}

class Toggle extends Procedure
{
    fun void run()
    {
        toggle();
    }
}

MoreSqr _moreSqr;
MoreSin _moreSin;
MoreTri _moreTri;
IncreaseDepth _increaseDepth;
DecreaseDepth _decreaseDepth;
IncreaseRate _increaseRate;
DecreaseRate _decreaseRate;
Toggle _toggle;

StompKeyboard stomp;
_toggle @=> stomp.button0Down;
_increaseRate @=> stomp.button1Down;
_decreaseRate @=> stomp.button2Down;
_moreSqr @=> stomp.button3Down;
_moreSin @=> stomp.button4Down;
_moreTri @=> stomp.button5Down;
// need more stomp buttons!  :)

stomp.open(0);
