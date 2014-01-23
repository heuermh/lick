/*

    LiCK  Library for ChucK.
    Copyright (c) 2007-2014 held jointly by the individual authors.
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

adc => NoiseGate noiseGate => Tremolo tremolo => Amp amp => Cabinet cabinet => GVerb gverb => dac;

-38.0 => noiseGate.open;
-55.0 => noiseGate.close;
"imperial" => noiseGate.mainsName;

0.4 => tremolo.depth;
4.0 => tremolo.rate;
0.9 => tremolo.sinMix;
0.0 => tremolo.triMix;
0.1 => tremolo.sqrMix;

1.0 => amp.bass;
0.1 => amp.mid;
0.5 => amp.treble;

0.7 => amp.drive;
0.1 => amp.bright;
0.6 => amp.power;

"4x" => amp.overName;
"stanford" => amp.tonestackName;

"twin A" => cabinet.modelName;

0.9 => gverb.dry;
0.02 => gverb.early;
0.07 => gverb.tail;
30.0 => gverb.roomsize;

class TremMod extends FloatProcedure
{
    fun void run(float f)
    {
        Math.max(0.4, f) => float depth;
        //Interpolate.linear(f, 0.0, 1.0, 0.5, 8.0) => float rate;
        //Math.max(0.1, f) => float sqrMix;
        //1.0 - sqrMix => float sinMix;

        depth => tremolo.depth;
        //rate => tremolo.rate;
        //sinMix => tremolo.sinMix;
        //sqrMix => tremolo.sqrMix;
    }
}

TremMod tremMod;
SigmuGainFollower.create(tremMod) @=> SigmuGainFollower follower;

500::ms => follower.rate;

adc => follower => blackhole;

while (true)
{
    1::minute => now;
}