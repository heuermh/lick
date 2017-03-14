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

adc => Drop drop => dac;

class Toggle extends Procedure
{
    fun void run()
    {
        drop.toggle();
        <<<"running", drop.running()>>>;
    }
}

class DropOctave extends Procedure
{
    fun void run()
    {
        Intervals.octave().desc() => drop.interval;
        drop.drop();
    }
}

class DropPerfectFifth extends Procedure
{
    fun void run()
    {
        Intervals.perfectFifth().desc() => drop.interval;
        drop.drop();
    }
}

class DropMajorThird extends Procedure
{
    fun void run()
    {
        Intervals.majorThird().desc() => drop.interval;
        drop.drop();
    }
}

class DropMinorSecond extends Procedure
{
    fun void run()
    {
        Intervals.minorSecond().desc() => drop.interval;
        drop.drop();
    }
}

Toggle toggle;
DropOctave dropOctave;
DropPerfectFifth dropPerfectFifth;
DropMajorThird dropMajorThird;
DropMinorSecond dropMinorSecond;

StompKeyboard stomp;
toggle @=> stomp.button0Down;
dropOctave @=> stomp.button1Down;
dropPerfectFifth @=> stomp.button2Down;
dropMajorThird @=> stomp.button3Down;
dropMinorSecond @=> stomp.button4Down;

stomp.open(0);
