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

//
// more like a bit crusher than anything else
//   needs interpolation
//

class BucketBrigadeDelay extends Effect
{
    inlet => LPF pre => BucketBrigade bb => Gain boost => LPF post => wet;
    post => Gain feedback => inlet;

    1.2 => boost.gain;
    0.8 => feedback.gain;
    16000.0 => pre.freq;
    8000.0 => post.freq;

    fun dur clockRate()
    {
        return bb.clockRate();
    }

    fun dur clockRate(dur d)
    {
        d => bb.clockRate;
        return d;
    }
}

adc => BucketBrigadeDelay bbd => dac;

0.8 => bbd.mix;

<<<"ready">>>;
for (4 => int i; i < 97; i++)
{
    10::second => now;
    i * 1::samp => bbd.clockRate;
    <<<"clockRate", bbd.clockRate()>>>;
}

<<<"ok">>>;
1::minute => now;
<<<"done">>>;