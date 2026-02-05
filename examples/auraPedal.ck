/*

    LiCK  Library for ChucK.
    Copyright (c) 2007-2026 held jointly by the individual authors.

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

Aura aura;

class Toggle extends Procedure
{
    fun void run()
    {
        aura.toggle();
        <<<"running", aura.running()>>>;
    }
}

class IncreaseRate extends Procedure
{
    fun void run()
    {
        aura.rate() * 1.1 => aura.rate;
        <<<"aura rate", aura.rate()>>>;
    }
}

class DecreaseRate extends Procedure
{
    fun void run()
    {
        aura.rate() * 0.9 => aura.rate;
        <<<"aura rate", aura.rate()>>>;
    }
}

adc => aura => dac;

1.0 => aura.mix;

Toggle toggle;
IncreaseRate increaseRate;
DecreaseRate decreaseRate;
StompKeyboard stomp;

toggle @=> stomp.button0Down;
increaseRate @=> stomp.button1Down;
decreaseRate @=> stomp.button2Down;

stomp.open(0);
