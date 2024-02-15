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
        "samples/RolandTr707/Clap.wav" => buf.read;
    }
}

class ClosedHatA extends Sample
{
    {
        "samples/RolandTr707/ClosedHatA.wav" => buf.read;
    }
}

class ClosedHatB extends Sample
{
    {
        "samples/RolandTr707/ClosedHatB.wav" => buf.read;
    }
}

class Cowbell extends Sample
{
    {
        "samples/RolandTr707/Cowbell.wav" => buf.read;
    }
}

class Crash extends Sample
{
    {
        "samples/RolandTr707/Crash.wav" => buf.read;
    }
}

class HighTom extends Sample
{
    {
        "samples/RolandTr707/HighTom.wav" => buf.read;
    }
}

class KickA extends Sample
{
    {
        "samples/RolandTr707/KickA.wav" => buf.read;
    }
}

class KickB extends Sample
{
    {
        "samples/RolandTr707/KickB.wav" => buf.read;
    }
}

class LowTom extends Sample
{
    {
        "samples/RolandTr707/LowTom.wav" => buf.read;
    }
}

class MiddleTom extends Sample
{
    {
        "samples/RolandTr707/MiddleTom.wav" => buf.read;
    }
}

class OpenHat extends Sample
{
    {
        "samples/RolandTr707/OpenHat.wav" => buf.read;
    }
}

class Ride extends Sample
{
    {
        "samples/RolandTr707/Ride.wav" => buf.read;
    }
}

class Rim extends Sample
{
    {
        "samples/RolandTr707/Rim.wav" => buf.read;
    }
}

class SnareA extends Sample
{
    {
        "samples/RolandTr707/SnareA.wav" => buf.read;
    }
}

class SnareB extends Sample
{
    {
        "samples/RolandTr707/SnareB.wav" => buf.read;
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

public class RolandTr707
{
    Clap clap;
    ClosedHatA closedHatA;
    ClosedHatB closedHatB;
    Cowbell cowbell;
    Crash crash;
    HighTom highTom;
    KickA kickA;
    KickB kickB;
    LowTom lowTom;
    MiddleTom middleTom;
    OpenHat openHat;
    Ride ride;
    Rim rim;
    SnareA snareA;
    SnareB snareB;

    fun ArrayList list()
    {
        ArrayList samples;
        samples.add(clap);
        samples.add(closedHatA);
        samples.add(closedHatB);
        samples.add(cowbell);
        samples.add(crash);
        samples.add(highTom);
        samples.add(kickA);
        samples.add(kickB);
        samples.add(lowTom);
        samples.add(middleTom);
        samples.add(openHat);
        samples.add(ride);
        samples.add(rim);
        samples.add(snareA);
        samples.add(snareB);
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
