me.exit();
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

@import "../lick/snare/Dmch"


Dmch dmch => dac;

for (0 => int i; i < 32; i++)
{
    Math.random2f(0.5f, 1.0f) => dmch.drumMix;
    1.0f - dmch.drumMix() => dmch.noiseMix;

    Math.random2f(100.0f, 200.0f) => dmch.freq;
    Math.random2f(20.0, 120.0f) => dmch.freqDepth;

    100::ms + (Math.random2f(0.0f, 100.0f) * 1::ms) => dmch.drumDecay;
    40::ms + (Math.random2f(0.0f, 100.0f) * 1::ms) => dmch.noiseDecay;
    20::ms + (Math.random2f(0.0f, 40.0f) * 1::ms) => dmch.freqDecay;

    3400.0f + (Math.random2f(-2200.0f, 3000.0f)) => dmch.noiseCutoff;
    Math.random2f(4.0f, 6.0f) => dmch.noiseResonance;

    Math.random2f(0.6, 1.1) => dmch.accent;

    <<<"freq", dmch.freq(), "freqDepth", dmch.freqDepth(), "accent", dmch.accent(), "drumMix", dmch.drumMix(), "noiseMix", dmch.noiseMix(), "drumDecay", dmch.drumDecay(), "noiseDecay", dmch.noiseDecay(), "freqDecay", dmch.freqDecay(), "noiseCutoff", dmch.noiseCutoff(), "noiseResonance", dmch.noiseResonance()>>>;

    dmch.play();
    440.0::ms => now;
}
<<<"done">>>;
