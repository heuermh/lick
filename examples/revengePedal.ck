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

adc => Revenge rev => dac;

1.0 => rev.mix;

// sunn-ish, open G
//12.2498573744 => rev.rate;
//23731.047242 => rev.cutoff;
//0.164274 => rev.resonance;

class Toggle extends Procedure
{
    fun void run()
    {
        rev.toggle();
        <<<"running", rev.running()>>>;
    }
}

class Shape extends Procedure
{
    0 => static int SI;
    1 => static int SQ;
    SI => int _shape;

    fun void run()
    {
        if (SI == _shape)
        {
            rev.sqr();
            SQ => _shape;
            <<<"shape", "SQ">>>;
        }
        else
        {
            rev.sin();
            SI => _shape;
            <<<"shape", "SI">>>;
        }
    }
}

class RateUp extends Procedure
{
    fun void run()
    {
        rev.rate() * 1.2 => rev.rate;
        <<<"rate", rev.rate()>>>;
    }
}

class RateDown extends Procedure
{
    fun void run()
    {
        rev.rate() * 0.96 => rev.rate;
        <<<"rate", rev.rate()>>>;
    }
}

class DepthUp extends Procedure
{
    fun void run()
    {
        Constrain.constrainf(rev.depth() * 1.2, 0.0, 1.0) => rev.depth;
        <<<"depth", rev.depth()>>>;
    }
}

class DepthDown extends Procedure
{
    fun void run()
    {
        Constrain.constrainf(rev.depth() * 0.96, 0.0, 1.0) => rev.depth;
        <<<"depth", rev.depth()>>>;
    }
}

class CutoffUp extends Procedure
{
    fun void run()
    {
        rev.cutoff() * 1.2 => rev.cutoff;
        <<<"cutoff", rev.cutoff()>>>;
    }
}

class CutoffDown extends Procedure
{
    fun void run()
    {
        rev.cutoff() * 0.96 => rev.cutoff;
        <<<"cutoff", rev.cutoff()>>>;
    }
}

class ResonanceUp extends Procedure
{
    fun void run()
    {
        Constrain.constrainf(rev.resonance() * 1.2, 0.01, 0.99) => rev.resonance;
        <<<"resonance", rev.resonance()>>>;
    }
}

class ResonanceDown extends Procedure
{
    fun void run()
    {
        Constrain.constrainf(rev.resonance() * 0.96, 0.01, 0.99) => rev.resonance;
        <<<"resonance", rev.resonance()>>>;
    }
}

Toggle toggle;
Shape shape;
RateUp rateUp;
RateDown rateDown;
DepthUp depthUp;
DepthDown depthDown;
CutoffUp cutoffUp;
CutoffDown cutoffDown;
ResonanceUp resonanceUp;
ResonanceDown resonanceDown;

StompKeyboard stomp;
toggle @=> stomp.button0Down;
//shape @=> stomp.button1Down;
//rateUp @=> stomp.button2Down;
//rateDown @=> stomp.button3Down;
//depthUp @=> stomp.button4Down;
//depthDown @=> stomp.button5Down;
cutoffUp @=> stomp.button1Down;
cutoffDown @=> stomp.button2Down;
resonanceUp @=> stomp.button3Down;
resonanceDown @=> stomp.button4Down;

stomp.open(1);
