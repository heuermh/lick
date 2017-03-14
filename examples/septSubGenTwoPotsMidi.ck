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

1::second => now;

SeptSubGen sept;
sept.outputL => dac.left;
sept.outputR => dac.right;

0.8 => sept.outputL.gain;
0.8 => sept.outputR.gain;

55.0 => sept.freq;
0.0 => sept.freqSpread;
0.0 => sept.phase;
0.0 => sept.phaseSpread;

-0.7 => sept.gen1.pan.pan;
0.7 => sept.gen2.pan.pan;

1400::ms => sept.gen3.delay.delayL.max;
1400::ms => sept.gen3.delay.delayR.max;
0::ms => sept.gen3.delay.delayL.delay;
0::ms => sept.gen3.delay.delayR.delay;

1400::ms => sept.gen4.delay.delayL.max;
1400::ms => sept.gen4.delay.delayR.max;
0::ms => sept.gen4.delay.delayL.delay;
0::ms => sept.gen4.delay.delayR.delay;

0.0 => sept.gen3.delay.feedbackL.gain;
0.0 => sept.gen3.delay.feedbackR.gain;
0.0 => sept.gen4.delay.feedbackL.gain;
0.0 => sept.gen4.delay.feedbackR.gain;

0.72 => sept.gen0.sinOsc.gain;
0.04 => sept.gen0.sqrOsc.gain;
0.12 => sept.gen0.triOsc.gain;
0.12 => sept.gen0.sawOsc.gain;
0.72 => sept.gen1.sinOsc.gain;
0.04 => sept.gen1.sqrOsc.gain;
0.12 => sept.gen1.triOsc.gain;
0.12 => sept.gen1.sawOsc.gain;
0.72 => sept.gen2.sinOsc.gain;
0.04 => sept.gen2.sqrOsc.gain;
0.12 => sept.gen2.triOsc.gain;
0.12 => sept.gen2.sawOsc.gain;
0.72 => sept.gen3.sinOsc.gain;
0.04 => sept.gen3.sqrOsc.gain;
0.12 => sept.gen3.triOsc.gain;
0.12 => sept.gen3.sawOsc.gain;
0.72 => sept.gen4.sinOsc.gain;
0.04 => sept.gen4.sqrOsc.gain;
0.12 => sept.gen4.triOsc.gain;
0.12 => sept.gen4.sawOsc.gain;
0.72 => sept.gen5.sinOsc.gain;
0.04 => sept.gen5.sqrOsc.gain;
0.12 => sept.gen5.triOsc.gain;
0.12 => sept.gen5.sawOsc.gain;
0.72 => sept.gen6.sinOsc.gain;
0.04 => sept.gen6.sqrOsc.gain;
0.12 => sept.gen6.triOsc.gain;
0.12 => sept.gen6.sawOsc.gain;

27.5 => float a;
Scales.minor(a, "A") @=> Scale scale;

class Freq extends IntProcedure
{
    fun void run(int value)
    {
        scale.intervals.get(value) $ Interval @=> Interval interval;
        interval.evaluate(scale.root) => sept.freq;
        <<<scale.description, value, sept.freq()>>>;
    }
}

class Spread extends IntProcedure
{
    fun void run(int value)
    {
        0.01 * value => sept.freqSpread;
        <<<"                     spread", value, sept.freqSpread()>>>;
    }
}

class Delay extends IntProcedure
{
    fun void run(int value)
    {
        200::ms * value => sept.gen3.delay.delayL.delay;
        200::ms * value => sept.gen3.delay.delayR.delay;
        200::ms * value => sept.gen4.delay.delayL.delay;
        200::ms * value => sept.gen4.delay.delayR.delay;
        <<<"                                          delay", value, (200 * value), "ms">>>;
    }
}

class Feedback extends IntProcedure
{
    fun void run(int value)
    {
        value/128.0 => sept.gen3.delay.feedbackL.gain;
        value/128.0 => sept.gen3.delay.feedbackR.gain;
        value/128.0 => sept.gen4.delay.feedbackL.gain;
        value/128.0 => sept.gen4.delay.feedbackR.gain;
        <<<"                                                          feedback", value, (value/128.0)>>>;
    }
}

TwoPotsMidi twoPotsMidi;
Freq pot1Msb;
Spread pot1Lsb;
Delay pot2Msb;
Feedback pot2Lsb;
pot1Msb @=> twoPotsMidi.pot1Msb;
pot1Lsb @=> twoPotsMidi.pot1Lsb;
pot2Msb @=> twoPotsMidi.pot2Msb;
pot2Lsb @=> twoPotsMidi.pot2Lsb;

twoPotsMidi.open(0);
