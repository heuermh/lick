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

CrossOver3 crossOver;

// CrossOver3 is not an effect, in and out1/out2/out3 must be chucked explicitly
//   or use CrossOver3.create(adc, 880.0, 440.0, 1.0, delay1, delay2, delay3);

adc => crossOver.in;
crossOver.out1 => DigitalDelay delay1 => dac;
crossOver.out2 => DigitalDelay delay2 => dac;
crossOver.out3 => DigitalDelay delay3 => dac;

880.0 => crossOver.freq1;
88.0 => crossOver.spread1;
440.0 => crossOver.freq2;
44.0 => crossOver.spread2;
1.0 => crossOver.Q;

600::ms => delay1.max;
600::ms => delay1.delay;
0.8 => delay1.feedback;

800::ms => delay2.max;
800::ms => delay2.delay;
0.6 => delay2.feedback;

1400::ms => delay3.max;
1400::ms => delay3.delay;
0.6 => delay3.feedback;

<<<"ready">>>;
1::minute => now;
