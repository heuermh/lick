/*

    LiCK  Library for ChucK.
    Copyright (c) 2007-2012 held jointly by the individual authors.

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

8 => int z;
0.8 => float m;
20.0 => float freq;
Smear.create(z, m, freq) @=> Smear smear;

adc => smear.input;
0.4 => smear.dry.gain;
0.6 => smear.wet.gain;
smear.dry => dac;
smear.wet => dac;

smear.stop();

class Toggle extends Procedure
{
    fun void run()
    {
        smear.toggle();
        <<<"running",smear.running>>>;
    }
}

// todo:  might be interesting to use intervals from a scale here

class FreqUp extends Procedure
{
    fun void run()
    {
        freq + (freq / 10.0) => freq;
        <<<"freq up", smear.freq(freq)>>>;
    }
}

class FreqDown extends Procedure
{
    fun void run()
    {
        freq - (freq / 10.0) => freq;
        <<<"freq down", smear.freq(freq)>>>;
    }
}

Toggle toggle;
FreqUp freqUp;
FreqDown freqDown;
StompKeyboard stomp;
toggle @=> stomp.button0Down;
freqUp @=> stomp.button1Down;
freqDown @=> stomp.button2Down;

stomp.open(0);
