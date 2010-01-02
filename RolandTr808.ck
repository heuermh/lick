/*

    LiCK  Library for ChucK.
    Copyright (c) 2007-2010 held jointly by the individual authors.

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

class Sample extends IntProcedure
{
    1.0 => float maxGain;

    SndBuf buf => dac;
    {
        0.0 => buf.gain;
    }

    fun void run(int value)
    {
        0 => buf.pos;
        (value / 127.0) * maxGain => buf.gain;
        1.0 => buf.rate;
    }
}

class Clap extends Sample
{
    {
        "samples/RolandTr808/Clap.wav" => buf.read;
    }
}

class Claves extends Sample
{
    {
        "samples/RolandTr808/Claves.wav" => buf.read;
    }
}

class ClosedHat extends Sample
{
    {
        "samples/RolandTr808/ClosedHat.wav" => buf.read;
    }
}

class CowBell extends Sample
{
    {
        "samples/RolandTr808/CowBell.wav" => buf.read;
    }
}

class Crash extends Sample
{
    {
        "samples/RolandTr808/Crash.wav" => buf.read;
    }
}

class HighConga extends Sample
{
    {
        "samples/RolandTr808/HighConga.wav" => buf.read;
    }
}

class HighTom extends Sample
{
    {
        "samples/RolandTr808/HighTom.wav" => buf.read;
    }
}

class Kick extends Sample
{
    {
        "samples/RolandTr808/Kick.wav" => buf.read;
    }
}

class LowConga extends Sample
{
    {
        "samples/RolandTr808/LowConga.wav" => buf.read;
    }
}

class LowTom extends Sample
{
    {
        "samples/RolandTr808/LowTom.wav" => buf.read;
    }
}

class Maracas extends Sample
{
    {
        "samples/RolandTr808/Maracas.wav" => buf.read;
    }
}

class MiddleConga extends Sample
{
    {
        "samples/RolandTr808/MiddleConga.wav" => buf.read;
    }
}

class MiddleTom extends Sample
{
    {
        "samples/RolandTr808/MiddleTom.wav" => buf.read;
    }
}

class OpenHat extends Sample
{
    {
        "samples/RolandTr808/OpenHat.wav" => buf.read;
    }
}

class Rim extends Sample
{
    {
        "samples/RolandTr808/Rim.wav" => buf.read;
    }
}

class Snare extends Sample
{
    {
        "samples/RolandTr808/Snare.wav" => buf.read;
    }
}

class PlaySample extends UnaryProcedure
{
    int velocity;

    fun void run(Object value)
    {
        value $ IntProcedure @=> IntProcedure procedure;
        procedure.run(velocity);
        500::ms => now;
    }
}

public class RolandTr808
{
    Clap clap;
    Claves claves;
    ClosedHat closedHat;
    CowBell cowBell;
    Crash crash;
    HighConga highConga;
    HighTom highTom;
    Kick kick;
    LowConga lowConga;
    LowTom lowTom;
    Maracas maracas;
    MiddleConga middleConga;
    MiddleTom middleTom;
    OpenHat openHat;
    Rim rim;
    Snare snare;

    fun void demo()
    {
        ArrayList samples;
        samples.add(clap);
        samples.add(claves);
        samples.add(closedHat);
        samples.add(cowBell);
        samples.add(crash);
        samples.add(highConga);
        samples.add(highTom);
        samples.add(kick);
        samples.add(lowConga);
        samples.add(lowTom);
        samples.add(maracas);
        samples.add(middleConga);
        samples.add(middleTom);
        samples.add(openHat);
        samples.add(rim);
        samples.add(snare);

        PlaySample playSample;
        32 => playSample.velocity;
        samples.forEach(playSample);

        64 => playSample.velocity;
        samples.forEach(playSample);

        127 => playSample.velocity;
        samples.forEach(playSample);
    }
}