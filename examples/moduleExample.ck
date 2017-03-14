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

class SinModule extends Module
{
    SinOsc sin;

    {
        sin => blackhole;
    }

    fun float tick(float in, float v)
    {
        Interpolate.linear(v, -1.0, 1.0, 2.0, 8.0) => sin.freq;
        return sin.last();
    }
}

class TremoloModule extends Module
{
    SinModule gainLfo;
    SinOsc rateLfo;

    {
        1.0 => gainLfo.sin.gain;
        gainLfo => cv;

        0.25 => rateLfo.freq;
        1.0 => rateLfo.gain;
        rateLfo => gainLfo.cv;
    }

    fun float tick(float in, float v)
    {
        Interpolate.linear(v, -1.0, 1.0, 0.0, 1.0) => gain;
        return in;
    }
}

adc => TremoloModule trem => dac;
//SinOsc sin => TremoloModule trem => dac;
//0.4 => sin.gain;
//220.0 => sin.freq;
//20::second => now;
1::week => now;

<<<"done">>>;
