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

adc => Tremolo tremolo => DigitalDelay delay => Amp amp => Cabinet cabinet => GVerb gverb => dac;

1.0 => tremolo.mix;
0.4 => tremolo.depth;
4.0 => tremolo.rate;
tremolo.lfo(0.0, 0.8, 0.0, 0.2);

0.1 => delay.mix;
0.1 => delay.feedback;
800::ms => delay.max;
800::ms => delay.delay;

1.0 => amp.bass;
0.1 => amp.mid;
0.5 => amp.treble;

0.7 => amp.drive;
0.1 => amp.bright;
0.6 => amp.power;

0 => amp.verbose;
"4x" => amp.overName;
"stanford" => amp.tonestackName;

"twin A" => cabinet.modelName;

0.8 => gverb.dry;
0.06 => gverb.early;
0.14 => gverb.tail;
30.0 => gverb.roomsize;

class TremMod extends FloatProcedure
{
    fun void run(float f)
    {
        Constrain.constrainf(f, 0.4, 1.0) => float depth;
        Interpolate.linear(f, 0.0, 1.0, 0.1, 6.0) => float rate;
        Interpolate.linear(f, 0.0, 1.0, 0.0, 0.2) => float sqrMix;
        0.8 - sqrMix => float sinMix;

        depth => tremolo.depth;
        rate => tremolo.rate;
        tremolo.lfo(0.0, sinMix, sqrMix, 0.0);

        Interpolate.linear(f, 0.0, 1.0, 0.05, 0.15) => float delayMix;
        Interpolate.linear(f, 0.0, 1.0, 0.3, 0.98) => float delayFeedback;

        if (delay.running())
        {
            delayMix => delay.mix;
            delayFeedback => delay.feedback;
        }

        //<<<f, depth, rate, sinMix, sqrMix, delayMix, delayFeedback>>;
    }
}

TremMod tremMod;
SigmuGainFollower.create(tremMod) @=> SigmuGainFollower follower;

10::ms => follower.rate;

adc => follower => blackhole;

class Toggle extends Procedure
{
    fun void run()
    {
        delay.toggle();
        <<<"running", delay.running()>>>;
    }
}

Toggle toggle;
StompKeyboard stomp;
toggle @=> stomp.button0Down;

stomp.open(0);
