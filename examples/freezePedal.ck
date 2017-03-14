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

Freeze.create() @=> Freeze freeze;
0.4 => freeze.mix;

adc => freeze => dac;

class Toggle extends Procedure
{
    fun void run()
    {
        freeze.toggle();
        <<<"toggle", freeze.running()>>>;
    }
}

class FreezeOn extends Procedure
{
    fun void run()
    {
        freeze.freeze();
        <<<"freeze attack ", freeze.attack(), "decay ", freeze.decay(), "spread ", freeze.spread()>>>;
    }
}

class FreezeOff extends Procedure
{
    fun void run()
    {
        freeze.thaw();
        <<<"thaw">>>;
    }
}

class Fast extends Procedure
{
    fun void run()
    {
        10::ms => freeze.attack;
        400::ms => freeze.decay;
        <<<"fast mode">>>;
    }
}

class Slow extends Procedure
{
    fun void run()
    {
        200::ms => freeze.attack;
        1::second => freeze.decay;
        <<<"slow mode">>>;
    }
}

class ReallySlow extends Procedure
{
    fun void run()
    {
        800::ms => freeze.attack;
        3200::ms => freeze.decay;
        <<<"really slow mode">>>;
    }
}

Toggle toggle;
FreezeOn freezeOn;
FreezeOff freezeOff;
Fast fast;
Slow slow;
ReallySlow reallySlow;

StompKeyboard stomp;
toggle @=> stomp.button0Down;
freezeOn @=> stomp.button1Down;
freezeOff @=> stomp.button2Down;  // would be better if keyboard was momentary
fast @=> stomp.button3Down;
slow @=> stomp.button4Down;
reallySlow @=> stomp.button5Down;

stomp.open(0);
