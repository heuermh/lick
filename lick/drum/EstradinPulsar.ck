/*

    LiCK  Library for ChucK.
    Copyright (c) 2007-2024 held jointly by the individual authors.

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

class Clap extends Sample
{
    {
        "samples/EstradinPulsar/Clap.wav" => buf.read;
    }
}

class ClosedHat extends Sample
{
    {
        "samples/EstradinPulsar/ClosedHat.wav" => buf.read;
    }
}

class Crash extends Sample
{
    {
        "samples/EstradinPulsar/Crash.wav" => buf.read;
    }
}

class HighTom extends Sample
{
    {
        "samples/EstradinPulsar/HighTom.wav" => buf.read;
    }
}

class Kick extends Sample
{
    {
        "samples/EstradinPulsar/Kick.wav" => buf.read;
    }
}

class LowTom extends Sample
{
    {
        "samples/EstradinPulsar/LowTom.wav" => buf.read;
    }
}

class MiddleTom extends Sample
{
    {
        "samples/EstradinPulsar/MiddleTom.wav" => buf.read;
    }
}

class Snare extends Sample
{
    {
        "samples/EstradinPulsar/Snare.wav" => buf.read;
    }
}

class PlaySample extends UnaryProcedure
{
    int velocity;

    fun void run(Object value)
    {
        value $ Sample @=> Sample sample;
        sample.asIntProcedure().run(velocity);
        500::ms => now;
    }
}

public class EstradinPulsar
{
    Clap clap;
    ClosedHat closedHat;
    Crash crash;
    HighTom highTom;
    Kick kick;
    LowTom lowTom;
    MiddleTom middleTom;
    Snare snare;

    fun ArrayList list()
    {
        ArrayList samples;
        samples.add(clap);
        samples.add(closedHat);
        samples.add(crash);
        samples.add(highTom);
        samples.add(kick);
        samples.add(lowTom);
        samples.add(middleTom);
        samples.add(snare);
        return samples;
    }

    fun void demo()
    {
        list() @=> ArrayList samples;

        PlaySample playSample;
        32 => playSample.velocity;
        samples.forEach(playSample);

        64 => playSample.velocity;
        samples.forEach(playSample);

        127 => playSample.velocity;
        samples.forEach(playSample);
    }

    fun void reconnect(UGen ugen)
    {
        list() @=> ArrayList samples;
        Reconnect.reconnect(samples, ugen);
    }
}
