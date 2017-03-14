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

//
// more like a bit crusher than anything else
//   needs interpolation
//

class BucketBrigadeDelay extends Effect
{

    /*

       in --> pre ---> antialias ------> emphasis -----> bb ---> deemphasis ------> harmonic ---> post ---> out
               ^        filter      lift 600Hz to 6kHz        cut 600Hz to 6kHz      filter        |
               |     4kHz or 10kHz                                                4kHz or 10kHz    |
               |                                                                                   |
               +--- feedback <---------------------------------------------------------------------+

     */
    /*
    inlet => Gain pre => LPF antialias => Gain emphasis => HPF emphasisHpf => LPF emphasisLpf => BucketBrigade bb;
    bb => LPF deemphasisLpf => HPF deemphasisHpf => Gain deemphasis => LPF harmonic => Gain post => wet;
    post => Gain feedback => inlet;
    */

    inlet => Gain pre => LPF antialias => BucketBrigade bb => LPF harmonic => Gain post => wet;
    post => Gain feedback => pre;

    1.0 => pre.gain;
    4000.0 => antialias.freq;

    /*
    // would be nice to use a bandpass filter here
    1.4 => emphasis.gain;
    600.0 => emphasisHpf.freq;  // filter lower than 600Hz
    6000.0 => emphasisLpf.freq; // filter higher than 6kHz
    // 40% gain boost for freqs between 600Hz and 6kHz

    // ...and a band reject filter here
    600.0 => deemphasisLpf.freq;  // filter higher than 600Hz
    6000.0 => deemphasisHpf.freq; // filter lower than 6kHz
    1.4 => deemphasis.gain;
    // 40% gain boost for freqs outside 600Hz to 6kHz
    */

    4000.0 => harmonic.freq;
    1.0 => post.gain;
    0.8 => feedback.gain;

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
