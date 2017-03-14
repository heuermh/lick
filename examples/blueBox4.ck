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

class DcOffset extends Chugen
{
    fun float tick(float in)
    {
        return (in * 2.0) - 1.0;
    }
}

class BlueBox4 extends Effect
{
    HalfRect halfRect;
    DcOffset dcOffset;
    RubberBand rubberBand;
    Gain pre;
    Gain post;
    Gain octaveDown;
    Gain twoOctavesDown;

    1.0 => rubberBad.mix;
    -1.0 => rubberBand.octave;

    1.0 => pre.gain;
    1.0 => post.gain;
    0.66 => octaveDown.gain;
    0.33 => twoOctavesDown.gain;

    inlet => halfRect => dcOffset => pre;
    pre => octaveDown => post;
    pre => pitchShift => twoOctavesDown => post;
    post => wet;
}

adc => BlueBox4 blueBox => dac;

while (true)
{
    1::minute => now;
}
