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

adc => Disaster disaster => dac;

0.80 => disaster.mixA;
0.80 => disaster.mixB;
0.90 => disaster.feedbackA;
0.94 => disaster.feedbackB;
0.8 => disaster.reverb;

class ToggleA extends Procedure
{
    fun void run()
    {
        disaster.toggleA();
        <<<"      a ", disaster._aState, disaster._bState, disaster._bypassState, disaster._inputA.gain(), disaster._inputB.gain(), disaster._bypass.gain()>>>;
    }
}

class ToggleB extends Procedure
{
    fun void run()
    {
        disaster.toggleB();
        <<<"      b ", disaster._aState, disaster._bState, disaster._bypassState, disaster._inputA.gain(), disaster._inputB.gain(), disaster._bypass.gain()>>>;
    }
}

class ToggleBypass extends Procedure
{
    fun void run()
    {
        disaster.toggleBypass();
        <<<"bypass  ", disaster._aState, disaster._bState, disaster._bypassState, disaster._inputA.gain(), disaster._inputB.gain(), disaster._bypass.gain()>>>;
    }
}

class ToggleModulation extends Procedure
{
    0 => int state;

    fun void run()
    {
        if (state)
        {
            0.001 => disaster.depth;
            0 => state;
            <<<"mod off">>>;
        }
        else
        {
            0.4 => disaster.depth;
            1 => state;
            <<<"mod on">>>;
        }
    }
}

class ToggleBleed extends Procedure
{
    0 => int state;

    fun void run()
    {
        if (state)
        {
            0.9 => disaster.bleed;
            0 => state;
            <<<"bleed off">>>;
        }
        else
        {
            0.0 => disaster.bleed;
            1 => state;
            <<<"bleed on">>>;
        }
    }
}

ToggleA toggleA;
ToggleB toggleB;
ToggleBypass toggleBypass;
ToggleModulation toggleModulation;
ToggleBleed toggleBleed;

StompKeyboard stomp;
toggleA @=> stomp.button0Down;
toggleB @=> stomp.button1Down;
toggleBypass @=> stomp.button2Down;
toggleModulation @=> stomp.button3Down;
toggleBleed @=> stomp.button4Down;

stomp.open(0);
