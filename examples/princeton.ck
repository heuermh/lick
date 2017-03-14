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

adc => NoiseGate noiseGate => Tremolo tremolo => AnalogDelay delay => Amp amp => Cabinet cabinet => GVerb gverb => dac;

-38.0 => noiseGate.open;
-55.0 => noiseGate.close;
"imperial" => noiseGate.mainsName;

4.0 => tremolo.rate;
0.9 => tremolo.depth;
tremolo.lfo(0.0, 0.6, 0.1, 0.3);

0.2 => delay.mix;
0.4 => delay.feedback;
400::ms => delay.max;
400::ms => delay.delay;

1.0 => amp.bass;
0.1 => amp.mid;
0.5 => amp.treble;

0.7 => amp.drive;
0.1 => amp.bright;
0.6 => amp.power;

"8x" => amp.overName;
"stanford" => amp.tonestackName;

"twin A" => cabinet.modelName;

0.9 => gverb.dry;
0.02 => gverb.early;
0.07 => gverb.tail;
30.0 => gverb.roomsize;

while (true)
{
    1::minute => now;
}
