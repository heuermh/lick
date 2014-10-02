/*

    LiCK  Library for ChucK.
    Copyright (c) 2007-2014 held jointly by the individual authors.

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

adc => Disaster2 disaster => Princeton princeton => dac;

0.8 => disaster.mixA;
0.8 => disaster.mixB;

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

ToggleA toggleA;
ToggleB toggleB;
ToggleBypass toggleBypass;

StompKeyboard stomp;
toggleA @=> stomp.button0Down;
toggleB @=> stomp.button1Down;
toggleBypass @=> stomp.button2Down;

stomp.open(0);