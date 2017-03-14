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

TimeSignature.common(160) @=> TimeSignature t;

SinOsc sin => ADSR adsr => Dist dist => SinTrem trem => JCRev rev => dac;
0.6 => sin.gain;
adsr.keyOff();
adsr.set(t.t, t.s, 0.8, t.s);
6.0 => float tremRate;
0.05 => float revMix;
trem.rate(tremRate);
trem.depth(0.2);
rev.mix(revMix);

class Play extends FloatProcedure
{
    fun void run(float value)
    {
        value => sin.freq;
        adsr.keyOn();
        t.e => now;
        adsr.keyOff();
    }
}

fun void effect()
{
    while (true)
    {
        t.d => now;
        tremRate * 1.05 => tremRate;
        revMix + 0.012 => revMix;
        trem.rate(tremRate);
        rev.mix(revMix);
    }
}

261.6256 => float c;
440.0 => float a;

Play play;
Scales.major(c, "C") @=> Scale c_major;
Scales.majorBlues(c, "C") @=> Scale c_majorBlues;
Scales.majorPentatonic(c, "C") @=> Scale c_majorPentatonic;
Scales.minor(a, "A") @=> Scale a_minor;
Scales.minorBlues(a, "A") @=> Scale a_minorBlues;
Scales.minorPentatonic(a, "A") @=> Scale a_minorPentatonic;

t.w => now;

LoopBuilder loopBuilder;
loopBuilder.append(Arpeggiators.upDown(c_major, play, t.s), 2);
loopBuilder.append(Arpeggiators.upDown(c_majorBlues, play, t.s), 1);
loopBuilder.append(Arpeggiators.upDown(c_majorPentatonic, play, t.s), 1);
loopBuilder.append(Arpeggiators.upDown(a_minor, play, t.s), 1);
loopBuilder.append(Arpeggiators.upDown(a_minorBlues, play, t.s), 1);
loopBuilder.append(Arpeggiators.upDown(a_minorPentatonic, play, t.s), 1);

spork ~ effect();

Loops.loop(loopBuilder.build(), 2).run();

t.d => now;

<<<"done">>>;
