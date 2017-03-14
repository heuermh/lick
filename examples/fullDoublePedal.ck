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

FullDouble fullDouble;

class Toggle extends Procedure
{
    fun void run()
    {
        fullDouble.toggle();
        <<<"running", fullDouble.running()>>>;
    }
}

class Short extends Procedure
{
    fun void run()
    {
        fullDouble.short();
        <<<"short">>>;
    }
}

class Long extends Procedure
{
    fun void run()
    {
        fullDouble.long();
        <<<"long">>>;
    }
}

class Slam extends Procedure
{
    fun void run()
    {
        fullDouble.slam();
        <<<"slam!">>>;
    }
}

adc => fullDouble => dac;

0.5 => fullDouble.mix;

Toggle toggle;
Short short;
Long long;
Slam slam;

StompKeyboard stomp;

toggle @=> stomp.button0Down;
short @=> stomp.button1Down;
long @=> stomp.button2Down;
slam @=> stomp.button3Down;

stomp.open(0);
