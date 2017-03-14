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

Tremolo tremolo;
1.0 => float depth;
1.0 => float rate;

BeeThree bt;
220.0 => bt.freq;

ADSR adsr;
adsr.set(10::ms, 500::ms, 0.9, 50::ms);

bt => adsr => tremolo => dac;

bt.noteOn(1.0);
500::ms => now;

tremolo.sawLfo();
<<<"saw">>>;
loop();

tremolo.sinLfo();
<<<"sin">>>;
loop();

tremolo.sqrLfo();
<<<"sqr">>>;
loop();

tremolo.triLfo();
<<<"tri">>>;
loop();

tremolo.sampleHoldLfo();
<<<"s/h">>>;
loop();

tremolo.smoothSampleHoldLfo();
<<<"smooth s/h">>>;
loop();

tremolo.lfo(0.2, 0.3, 0.1, 0.2, 0.1, 0.1);
<<<"mix">>>;
loop();

<<<"done">>>;

fun void loop()
{
    2.0 => rate;
    for (0 => int i; i < 4; i++)
    {
        rate => tremolo.rate;
        for (0 => int j; j < 10; j++)
        {
            (j+1)/10.0 => depth;
            depth => tremolo.depth;

            <<<"tremolo rate", rate, "depth", depth>>>;
            adsr.keyOn(1);
            800::ms => now;
            adsr.keyOff(1);
            200::ms => now;
        }
        2.0 +=> rate;
    }
}
