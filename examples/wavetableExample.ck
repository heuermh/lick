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


// download waveforms from http://www.adventurekid.se/AKRT

9 => int n;
1.0/n => float w;
0.0 => float x;
Gain mixer;
ArrayList wavetable;

wavetable.size(n);
for (0 => int i; i < n; i++)
{
  SndBuf waveform;
  "samples/AKWF/AKWF_0001/AKWF_000" + (i+1) + ".wav" => string name;
  name => waveform.read;
  true => waveform.loop;
  0.0 => waveform.gain;
  waveform => mixer;
  wavetable.set(i, waveform);
}

TimeSignature.common(112) @=> TimeSignature t;

ADSR adsr;
adsr.set(t.t, t.h + 3 * t.t, 0.9, t.e);

NRev reverb;
reverb.mix(0.05);

mixer => adsr => reverb => dac;

spork ~ scan();

65.40639 => float c;
55.0 => float a;

Chords.majorTriad(c, "C") @=> Chord c_maj;
Chords.minorThirteenth(a, "A") @=> Chord a_min13;

t.w => now;
0.8 => mixer.gain;

while (true)
{
    c_maj.sample() => float f;
    <<<c_maj.symbol, f>>>;
    for (0 => int i; i < n; i++)
    {
        wavetable.get(i) $ SndBuf @=> SndBuf waveform;
        waveform.freq(f);
    }
    adsr.keyOn(1);
    t.h + t.q + t.e => now;
    adsr.keyOff(1);
    t.e => now;

    a_min13.sample() => f;
    <<<a_min13.symbol, f>>>;
    for (0 => int i; i < n; i++)
    {
        wavetable.get(i) $ SndBuf @=> SndBuf waveform;
        waveform.freq(f);
    }
    adsr.keyOn(1);
    t.h + t.q + t.e => now;
    adsr.keyOff(1);
    t.e => now;
}

fun void scan()
{
    while (true)
    {
        t.e => now;
        if (x >= 1.0)
        {
            0.0 => x;
        }
        (x * n) $ int => int current;
        current - 1 => int last;
        if (last < 0)
        {
            n - 1 => last;
        }

        wavetable.get(last) $ SndBuf @=> SndBuf lastWaveform;
        wavetable.get(current) $ SndBuf @=> SndBuf currentWaveform;
        lastWaveform.gain(0.0);
        currentWaveform.gain(1.0);

        x + w => x;
    }
}
