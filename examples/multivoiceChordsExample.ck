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

4 => int voices;

Gain gain => dac;
0.8 => gain.gain;

BeeThree bt[voices];
for (0 => int i; i < voices; i++)
{
    BeeThree voice => gain;
    voice.noteOff(1.0);
    voice @=> bt[i];
}

// sporked for each voice
class Play extends FloatProcedure
{
    0 => int voice;
    500::ms => dur length;

    fun void run(float value)
    {
        <<<"play", value, voice>>>;
        value => bt[voice].freq;
        <<<"play set freq to bt[voice]">>>;
        bt[voice].noteOn(1.0);
        <<<"bt[voice] note on">>>;
        length => now;
        <<<"bt[voice] note off">>>;
        bt[voice].noteOff(1.0);
        <<<"play done">>>;
    }
}

// play all voices
class PlayVoices extends FloatProcedure
{
    0 => int voice;
    500::ms => dur length;

    fun void run(float value)
    {
        <<<"play voices", value>>>;
        Play play;
        length => play.length;
        voice => play.voice;
        <<<"sporking play.run", value>>>;
        spork ~ play.run(value);
        voice++;
    }

    fun void finish()
    {
        <<<"play voices finish">>>;
        length => now;
        0 => voice;
    }
}

// play all the notes in a chord simultaneously
class PlayChord extends Procedure
{
    Chord @ chord;
    500::ms => dur length;
    PlayVoices playVoices;

    fun void run()
    {
        <<<"play chord, ", chord.symbol>>>;
        length => playVoices.length;
        <<<"play chord, chord.forEach">>>;
        chord.forEach(playVoices);
        <<<"play chord, finish">>>;
        playVoices.finish();
    }
}

261.6256 => float c;
440.0 => float a;

Chords.majorTriad(c, "C") @=> Chord cMaj;
Chords.minorTriad(a, "A") @=> Chord aMin;

PlayChord playCmaj;
cMaj @=> playCmaj.chord;

PlayChord playAmin;
aMin @=> playAmin.chord;

2::second => now;

Loops.loop(playCmaj, 0::ms, 180::ms, 4) @=> Procedure cLoop;
Loops.loop(playAmin, 0::ms, 180::ms, 4) @=> Procedure aLoop;
Loops.append(Loops.loop(Loops.append(cLoop, aLoop), 3), playCmaj).run();

1::second => now;
