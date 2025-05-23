/*

    LiCK  Library for ChucK.
    Copyright (c) 2007-2025 held jointly by the individual authors.

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

class DcOffset extends Chugen
{
    fun float tick(float in)
    {
        return (in * 2.0) - 1.0;
    }
}

class BlueBox extends Effect
{
    HalfRect halfRect;
    DcOffset dcOffset;
    PitShift pitchShift;
    Gen17 gen17;
    Gain pre;
    Gain octaveDown;
    Gain twoOctavesDown;

    1.0 => pitchShift.mix;
    0.5 => pitchShift.shift;

    [1.0, 0.5, 0.25, 0.125, 0.06, 0.03, 0.015] @=> float coefs[];
    coefs => gen17.coefs;

    1.0 => pre.gain;
    0.66 => octaveDown.gain;
    0.33 => twoOctavesDown.gain;

    inlet => halfRect => dcOffset => pre;
    pre => octaveDown => gen17;
    pre => pitchShift => twoOctavesDown => gen17;
    gen17 => wet;

    fun void moreEvens()
    {
        coefs[1] * 1.1 => coefs[1];
        coefs[3] * 1.1 => coefs[3];
        coefs[5] * 1.1 => coefs[5];
        coefs => gen17.coefs;
    }

    fun void lessEvens()
    {
        coefs[1] * 0.8 => coefs[1];
        coefs[3] * 0.8 => coefs[3];
        coefs[5] * 0.8 => coefs[5];
        coefs => gen17.coefs;
    }

    fun void moreOdds()
    {
        coefs[0] * 1.1 => coefs[0];
        coefs[2] * 1.1 => coefs[2];
        coefs[4] * 1.1 => coefs[4];
        coefs[6] * 1.1 => coefs[6];
        coefs => gen17.coefs;
    }

    fun void lessOdds()
    {
        coefs[0] * 0.8 => coefs[0];
        coefs[2] * 0.8 => coefs[2];
        coefs[4] * 0.8 => coefs[4];
        coefs[6] * 0.8 => coefs[6];
        coefs => gen17.coefs;
    }
}

BlueBox blueBox;

adc => blueBox => dac;

for (0 => int i; i < 8; i++)
{
    0.8 + i * 0.1 => float gain;
    gain => blueBox.gen17.gain;
    <<<"gain", gain>>>;
    1::minute => now;
}

<<<"done">>>;
