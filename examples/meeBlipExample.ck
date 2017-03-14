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

MeeBlip meeBlip;
meeBlip.open(0);

meeBlip.fmOn();
meeBlip.oscASawtoothWave();
meeBlip.oscANoiseOff();
meeBlip.oscBOn();
meeBlip.oscBOctaveNormal();
meeBlip.oscBSquareWave();

meeBlip.antiAliasOn();
meeBlip.distortionOn();
meeBlip.pwmSweepPulse();
meeBlip.envelopeSustainOn();
meeBlip.filterModeLow();

meeBlip.lfoOn();
meeBlip.lfoRandomOn();
meeBlip.lfoTriangleWave();
meeBlip.lfoDestinationFilter();

meeBlip.filterResonance(0.2);
meeBlip.filterCutoff(0.8);
meeBlip.lfoFreq(0.1);
meeBlip.lfoLevel(0.8);
meeBlip.filterEnvelope(0.3);
meeBlip.portamento(0.0);
meeBlip.pulseWidthRate(0.8);
meeBlip.pwmRate(0.6);
meeBlip.oscDetune(0.1);
meeBlip.filterDecay(0.4);
meeBlip.filterAttack(0.1);
meeBlip.ampDecay(0.8);
meeBlip.ampAttack(0.4);

<<<"setup done">>>;

2::second => now;

// midi-style
meeBlip.noteOn(45, 101);
600::ms => now;
meeBlip.noteOff(45, 0);

meeBlip.noteOn(57, 127);
1200::ms => now;
meeBlip.noteOff(45, 0);

800::ms => now;

// stk-style
meeBlip.freq(220.0);
meeBlip.noteOn(0.8);
600::ms => now;
meeBlip.noteOff(0.0);

meeBlip.freq(440.0);
meeBlip.noteOn(1.0);
1200::ms => now;
meeBlip.noteOff(0.0);

<<<"done">>>;
