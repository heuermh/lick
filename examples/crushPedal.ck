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

Crush crush;

5 => int bits;
12 => int downsample;

bits => crush.bits;
downsample => crush.downsample;

class Toggle extends Procedure
{
    fun void run()
    {
        crush.toggle();
        <<<"running", crush.running()>>>;
    }
}

class MoreBits extends Procedure
{
    fun void run()
    {
        Constrain.constrain(bits + 1, 2, 32) => bits;
        bits => crush.bits;
        <<<"bits", bits>>>;
    }
}

class LessBits extends Procedure
{
    fun void run()
    {
        Constrain.constrain(bits - 1, 2, 32) => bits;
        bits => crush.bits;
        <<<"bits", bits>>>;
    }
}

class MoreDownsample extends Procedure
{
    fun void run()
    {
        Constrain.constrain(downsample + 1, 2, 32) => downsample;
        downsample => crush.downsample;
        <<<"downsample", downsample>>>;
    }
}

class LessDownsample extends Procedure
{
    fun void run()
    {
        Constrain.constrain(downsample - 1, 2, 32) => downsample;
        downsample => crush.downsample;
        <<<"downsample", downsample>>>;
    }
}

adc => crush => dac;

1.0 => crush.mix;

Toggle toggle;
MoreBits moreBits;
LessBits lessBits;
MoreDownsample moreDownsample;
LessDownsample lessDownsample;
StompKeyboard stomp;

toggle @=> stomp.button0Down;
moreBits @=> stomp.button1Down;
lessBits @=> stomp.button2Down;
moreDownsample @=> stomp.button3Down;
lessDownsample @=> stomp.button4Down;

stomp.open(0);
