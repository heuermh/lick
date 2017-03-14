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

// first open a network MIDI session to Animoog app on iPad/iPhone
AnimoogMidi animoog;
animoog.open(0);

<<<"setting up . . .">>>;

animoog.lpFilter();
animoog.filterDrive(0.8);
animoog.filterFreq(0.8);
animoog.filterEnv(0.2);
animoog.filterRes(0.3);

animoog.orbitSyncOn();
animoog.orbitRate(0.8);
animoog.orbitX(0.2);
animoog.orbitY(0.3);

animoog.pathSyncOn();
animoog.pathRate(0.2);
animoog.loopingPathMode();

animoog.thickCrush(0.5);
animoog.thickDrive(0.8);
animoog.thickDetune(0.1);
animoog.thickUnison2();

animoog.delaySyncOn();
animoog.delayTime(1.0);
animoog.delayFeedback(0.8);
animoog.delayMix(0.4);

animoog.volume(1.0);
animoog.cor(1.0);
animoog.glide(1.0);

animoog.ampADSR(0.2, 0.8, 1.0, 0.0);
animoog.filterADSR(0.4, 0.9, 0.9, 0.2);
animoog.modADSR(0.3, 0.4, 0.4, 0.2);

animoog.lfoSyncOn();
animoog.lfoRate(0.2);
animoog.lfoShapeRamp();
animoog.lfoKeyTriggerOff();

animoog.originX(0.5);
animoog.originY(0.5);

<<<"setup done">>>;


2::second => now;

261.6256 => float c;
440.0 => float a;

Chords.majorTriad(c, "C") @=> Chord c_maj;
Chords.minorThirteenth(a, "A") @=> Chord a_min13;

while (true)
{
    <<<c_maj.symbol>>>;

    animoog.freq(c_maj.sample());
    animoog.noteOn(0.8);
    600::ms => now;
    animoog.noteOff(0.0);

    200::ms => now;

    animoog.freq(c_maj.sample());
    animoog.noteOn(0.8);
    1200::ms => now;
    animoog.noteOff(0.0);

    200::ms => now;
    <<<a_min13.symbol>>>;

    animoog.freq(a_min13.sample());
    animoog.noteOn(0.8);
    600::ms => now;
    animoog.noteOff(0.0);

    200::ms => now;

    animoog.freq(a_min13.sample());
    animoog.noteOn(0.8);
    1200::ms => now;
    animoog.noteOff(0.0);

    400::ms => now;

    animoog.originX(Std.rand2f(0.4, 0.6));
    animoog.originY(Std.rand2f(0.4, 0.6));
}
