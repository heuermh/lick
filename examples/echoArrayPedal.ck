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

EchoArray echoArray;

0.8 => echoArray.mix;

echoArray.stop();

class Toggle extends Procedure
{
    fun void run()
    {
        echoArray.toggle();
        <<<"running", echoArray.running()>>>;
    }
}

class ToggleEcho1 extends Procedure
{
    fun void run()
    {
        echoArray.toggleEcho1();
        <<<"toggle echo1", echoArray._echo1State>>>;
    }
}

class ToggleEcho2 extends Procedure
{
    fun void run()
    {
        echoArray.toggleEcho2();
        <<<"toggle echo2", echoArray._echo2State>>>;
    }
}

class ToggleEcho3 extends Procedure
{
    fun void run()
    {
        echoArray.toggleEcho3();
        <<<"toggle echo3", echoArray._echo3State>>>;
    }
}

class ToggleEcho4 extends Procedure
{
    fun void run()
    {
        echoArray.toggleEcho4();
        <<<"toggle echo4", echoArray._echo4State>>>;
    }
}

class IncreaseDelay extends Procedure
{
    fun void run()
    {
        Constrain.constraind(echoArray.delay() * 1.1, 30::ms, 600::ms) => echoArray.delay;
        <<<"delay", echoArray.delay()>>>;
    }
}

class DecreaseDelay extends Procedure
{
    fun void run()
    {
        Constrain.constraind(echoArray.delay() * 0.9, 30::ms, 600::ms) => echoArray.delay;
        <<<"delay", echoArray.delay()>>>;
    }
}

class IncreaseFeedback extends Procedure
{
    fun void run()
    {
        Constrain.constrainf(echoArray.feedback() * 1.1, 0.0, 1.0) => echoArray.feedback;
        <<<"feedback", echoArray.feedback()>>>;
    }
}

class DecreaseFeedback extends Procedure
{
    fun void run()
    {
        Constrain.constrainf(echoArray.feedback() * 0.9, 0.0, 1.0) => echoArray.feedback;
        <<<"feedback", echoArray.feedback()>>>;
    }
}

adc => echoArray => dac;

Toggle toggle;
ToggleEcho1 toggleEcho1;
ToggleEcho2 toggleEcho2;
ToggleEcho3 toggleEcho3;
ToggleEcho4 toggleEcho4;
IncreaseDelay increaseDelay;
DecreaseDelay decreaseDelay;
IncreaseFeedback increaseFeedback;
DecreaseFeedback decreaseFeedback;

StompKeyboard stomp;
toggle @=> stomp.button0Down;
toggleEcho1 @=> stomp.button1Down;
toggleEcho2 @=> stomp.button2Down;
toggleEcho3 @=> stomp.button3Down;
toggleEcho4 @=> stomp.button4Down;
//increaseDelay @=> stomp.button5Down;
//decreaseDelay @=> stomp.button6Down;
//increaseFeedback @=> stomp.button7Down;
//decreaseFeedback @=> stomp.button8Down;

stomp.open(0);
