/*

    LiCK  Library for ChucK.
    Copyright (c) 2007-2024 held jointly by the individual authors.

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

adc => Prime prime => dac;

prime.stop();
0.8 => prime.mix;

class Toggle extends Procedure
{
    fun void run()
    {
        prime.toggle();
        <<<"running", prime.running()>>>;
    }
}

class DelayUp extends Procedure
{
    fun void run()
    {
        (prime.delay() / 1::ms) $ int => int last;
        prime.higher((last * 1.1) $ int) => int higher;
        <<<"last", last, "higher", higher>>>;
    }
}

class DelayDown extends Procedure
{
    fun void run()
    {
        (prime.delay() / 1::ms) $ int => int last;
        prime.lower((last * 0.96) $ int) => int lower;
        <<<"last", last, "lower", lower>>>;
    }
}

Toggle toggle;
DelayUp delayUp;
DelayDown delayDown;

StompKeyboard stomp;
toggle @=> stomp.button0Down;
delayUp @=> stomp.button1Down;
delayDown @=> stomp.button2Down;

stomp.open(0);
