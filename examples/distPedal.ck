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

/*
                                                   5
  >-- in --+-- Gain dry --------------------------------+-- out -->
           |                                            |
           +-- Dist => Gain dist0 ----------------------+ 0
           |                                            |
           +-- Dist => ... => Gain dist1 ---------------+ 1
           |                                            |
           +-- Dist => ... => Gain dist2 ---------------+ 2
           |                                            |
           +-- Dist => ... => Gain dist3 ---------------+ 3
           |                                            |
           +-- Dist => ... => Gain dist4 ---------------+ 4

*/

adc => Gain in;
Gain out => dac;

in => Gain dry;
in => Dist d1 => Dist d2 => Dist d3 => Gain dist0;
in => AtanDist atanDist => Gain dist1;
in => TanhDist tanhDist => Gain dist2;
in => FrostburnDist fd => Gain dist3;
in => Clip clip => AtanDist d4 => Gain dist4;

clip.range(0.3);

1.0 => in.gain;
1.0 => dry.gain;
1.0 => out.gain;
0.0 => dist0.gain;
0.0 => dist1.gain;
0.0 => dist2.gain;
0.0 => dist3.gain;
0.0 => dist4.gain;

dry => out;
dist0 => out;
dist1 => out;
dist2 => out;
dist3 => out;
dist4 => out;

class Dry extends Procedure
{
    fun void run()
    {
        1.0 => dry.gain;
        0.0 => dist0.gain;
        0.0 => dist1.gain;
        0.0 => dist2.gain;
        0.0 => dist3.gain;
        0.0 => dist4.gain;
        <<<"dry", dry.gain()>>>;
    }
}

class Dist0 extends Procedure
{
    fun void run()
    {
        0.0 => dry.gain;
        1.0 => dist0.gain;
        0.0 => dist1.gain;
        0.0 => dist2.gain;
        0.0 => dist3.gain;
        0.0 => dist4.gain;
        <<<"dist0", dist0.gain()>>>;
    }
}

class Dist1 extends Procedure
{
    fun void run()
    {
        0.0 => dry.gain;
        0.0 => dist0.gain;
        1.0 => dist1.gain;
        0.0 => dist2.gain;
        0.0 => dist3.gain;
        0.0 => dist4.gain;
        <<<"dist1", dist1.gain()>>>;
    }
}

class Dist2 extends Procedure
{
    fun void run()
    {
        0.0 => dry.gain;
        0.0 => dist0.gain;
        0.0 => dist1.gain;
        1.0 => dist2.gain;
        0.0 => dist3.gain;
        0.0 => dist4.gain;
        <<<"dist2", dist2.gain()>>>;
    }
}

class Dist3 extends Procedure
{
    fun void run()
    {
        0.0 => dry.gain;
        0.0 => dist0.gain;
        0.0 => dist1.gain;
        0.0 => dist2.gain;
        1.0 => dist3.gain;
        0.0 => dist4.gain;
        <<<"dist3", dist3.gain()>>>;
    }
}

class Dist4 extends Procedure
{
    fun void run()
    {
        0.0 => dry.gain;
        0.0 => dist0.gain;
        0.0 => dist1.gain;
        0.0 => dist2.gain;
        0.0 => dist3.gain;
        1.0 => dist4.gain;
        <<<"dist4", dist4.gain()>>>;
    }
}

Dist0 _dist0;
Dist1 _dist1;
Dist2 _dist2;
Dist3 _dist3;
Dist4 _dist4;
Dry _dry;

StompKeyboard stomp;
_dist0 @=> stomp.button0Down;
_dist1 @=> stomp.button1Down;
_dist2 @=> stomp.button2Down;
_dist3 @=> stomp.button3Down;
_dist4 @=> stomp.button4Down;
_dry @=> stomp.button5Down;

stomp.open(0);
