/*

    LiCK  Library for ChucK.
    Copyright (c) 2007-2015 held jointly by the individual authors.

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
293.67 => float d;

Play play;
Chords.majorTriad(c, "C") @=> Chord c_maj;
Chords.minorTriad(a, "A") @=> Chord a_min;
Chords.dominantEleventh(d, "D") @=> Chord d_11;
Chords.minorThirteenth(d, "D") @=> Chord d_min13;

2::second => now;

Arpeggiators.up(c_maj, play) @=> Arpeggiator upC;
Arpeggiators.down(c_maj, play) @=> Arpeggiator downC;
Arpeggiators.upDown(c_maj, play) @=> Arpeggiator upDownC;
Arpeggiators.downUp(c_maj, play) @=> Arpeggiator downUpC;

Arpeggiators.up(a_min, play) @=> Arpeggiator upAm;
Arpeggiators.down(a_min, play) @=> Arpeggiator downAm;
Arpeggiators.upDown(a_min, play) @=> Arpeggiator upDownAm;
Arpeggiators.downUp(a_min, play) @=> Arpeggiator downUpAm;

Arpeggiators.upDown(d_11, play) @=> Arpeggiator upDownD11;
Arpeggiators.upDown(d_min13, play) @=> Arpeggiator upDownDmin13;

LoopBuilder loopBuilder;
loopBuilder.append(upC, 4);
loopBuilder.append(upAm, 4);
loopBuilder.append(200.0::ms);
loopBuilder.append(downC, 4);
loopBuilder.append(downAm, 4);
loopBuilder.append(200.0::ms);
loopBuilder.append(upDownC, 2);
loopBuilder.append(upDownAm, 2);
loopBuilder.append(200.0::ms);
loopBuilder.append(downUpC, 2);
loopBuilder.append(downUpAm, 2);
loopBuilder.append(200.0::ms);
loopBuilder.append(upDownD11);
loopBuilder.append(upDownDmin13);
loopBuilder.append(200.0::ms);

Loops.loop(loopBuilder.build(), 2).run();

<<<"done">>>;
