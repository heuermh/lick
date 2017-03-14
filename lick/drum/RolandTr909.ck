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

class Clap extends Sample
{
    {
        "samples/RolandTr909/Clap.wav" => buf.read;
    }
}

class ClosedHatA extends Sample
{
    {
        "samples/RolandTr909/ClosedHatA.wav" => buf.read;
    }
}

class ClosedHatB extends Sample
{
    {
        "samples/RolandTr909/ClosedHatB.wav" => buf.read;
    }
}

class Crash extends Sample
{
    {
        "samples/RolandTr909/Crash.wav" => buf.read;
    }
}

class HighTomA extends Sample
{
    {
        "samples/RolandTr909/HighTomA.wav" => buf.read;
    }
}

class HighTomB extends Sample
{
    {
        "samples/RolandTr909/HighTomB.wav" => buf.read;
    }
}

class KickA extends Sample
{
    {
        "samples/RolandTr909/KickA.wav" => buf.read;
    }
}

class KickB extends Sample
{
    {
        "samples/RolandTr909/KickB.wav" => buf.read;
    }
}

class LowTomA extends Sample
{
    {
        "samples/RolandTr909/LowTomA.wav" => buf.read;
    }
}

class LowTomB extends Sample
{
    {
        "samples/RolandTr909/LowTomB.wav" => buf.read;
    }
}

class MiddleTomA extends Sample
{
    {
        "samples/RolandTr909/MiddleTomA.wav" => buf.read;
    }
}

class MiddleTomB extends Sample
{
    {
        "samples/RolandTr909/MiddleTomB.wav" => buf.read;
    }
}

class OpenHat extends Sample
{
    {
        "samples/RolandTr909/OpenHat.wav" => buf.read;
    }
}

class Ride extends Sample
{
    {
        "samples/RolandTr909/Ride.wav" => buf.read;
    }
}

class Rim extends Sample
{
    {
        "samples/RolandTr909/Rim.wav" => buf.read;
    }
}

class SnareA extends Sample
{
    {
        "samples/RolandTr909/SnareA.wav" => buf.read;
    }
}

class SnareB extends Sample
{
    {
        "samples/RolandTr909/SnareB.wav" => buf.read;
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

public class RolandTr909
{
    Clap clap;
    ClosedHatA closedHatA;
    ClosedHatB closedHatB;
    Crash crash;
    HighTomA highTomA;
    HighTomB highTomB;
    KickA kickA;
    KickB kickB;
    LowTomA lowTomA;
    LowTomB lowTomB;
    MiddleTomA middleTomA;
    MiddleTomB middleTomB;
    OpenHat openHat;
    Ride ride;
    Rim rim;
    SnareA snareA;
    SnareB snareB;

    fun void demo()
    {
        ArrayList samples;
        samples.add(clap);
        samples.add(closedHatA);
        samples.add(closedHatB);
        samples.add(crash);
        samples.add(highTomA);
        samples.add(highTomB);
        samples.add(kickA);
        samples.add(kickB);
        samples.add(lowTomA);
        samples.add(lowTomB);
        samples.add(middleTomA);
        samples.add(middleTomB);
        samples.add(openHat);
        samples.add(ride);
        samples.add(rim);
        samples.add(snareA);
        samples.add(snareB);

        PlaySample playSample;
        32 => playSample.velocity;
        samples.forEach(playSample);

        64 => playSample.velocity;
        samples.forEach(playSample);

        127 => playSample.velocity;
        samples.forEach(playSample);
    }
}
