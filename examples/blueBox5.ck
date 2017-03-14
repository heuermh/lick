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

class OctavesDown extends FloatProcedure
{
    SqrOsc @ osc1;
    SqrOsc @ osc2;

    fun void run(float freq)
    {
        freq/2.0 => osc1.freq;
        freq/4.0 => osc2.freq;
    }
}

class BlueBox5 extends Effect
{
    SqrOsc osc1;
    SqrOsc osc2;
    Gain post;
    OctavesDown octavesDown;
    osc1 @=> octavesDown.osc1;
    osc2 @=> octavesDown.osc2;

    0.66 => osc1.gain;
    0.33 => osc2.gain;
    1.0 => post.gain;

    SigmuPitchFollower.create(octavesDown) @=> SigmuPitchFollower pitchFollower;
    256::samp => pitchFollower.rate;

    inlet => pitchFollower => blackhole;

    osc1 => post;
    osc2 => post;
    post => wet;
}

BlueBox5 blueBox;
0.33 => blueBox.mix;

adc => blueBox => dac;

while (true)
{
    1::minute => now;
}
