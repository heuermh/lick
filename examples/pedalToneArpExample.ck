/*

    LiCK  Library for ChucK.
    Copyright (c) 2007-2021 held jointly by the individual authors.

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

TimeSignature.common(110) @=> TimeSignature t;

BeeThree bt => ADSR adsr => dac;
adsr.set(10::ms, 8::ms, 0.8, 60::ms);
bt.noteOff(1.0);

class Play extends FloatProcedure
{
    fun void run(float value)
    {
        value => bt.freq;
        bt.noteOn(1.0);
        adsr.keyOn();
        60::ms => now;  // will be added to rate set in arp, maybe it would be better to have on/off procedures
        adsr.keyOff();
        bt.noteOff(1.0);
    }
}

261.6256 => float c;
440.0 => float a;

Play play;
Chords.dominantThirteenth(c, "C") @=> Chord c_13;

2::second => now;

Arpeggiators.up(c_13, play, t.e) @=> Arpeggiator upC;
Arpeggiators.down(c_13, play, t.e) @=> Arpeggiator downC;
Arpeggiators.pedalToneUp(c_13, play, t.e) @=> Arpeggiator pedalToneUpC;
Arpeggiators.pedalToneDown(c_13, play, t.e) @=> Arpeggiator pedalToneDownC;
Arpeggiators.pedalToneRandom(c_13, play, t.e) @=> Arpeggiator pedalToneRandomC;

LoopBuilder loopBuilder;
loopBuilder.append(upC, 2);
loopBuilder.append(t.e);
loopBuilder.append(downC, 2);
loopBuilder.append(t.e);
loopBuilder.append(pedalToneUpC, 2);
loopBuilder.append(t.e);
loopBuilder.append(pedalToneDownC, 2);
loopBuilder.append(t.e);
loopBuilder.append(pedalToneRandomC, 2);
loopBuilder.append(t.e);

Loops.loop(loopBuilder.build(), 2).run();

<<<"done">>>;
