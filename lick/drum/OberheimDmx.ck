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
        "samples/OberheimDmx/Clap.wav" => buf.read;
    }
}

class ClosedHat extends Sample
{
    {
        "samples/OberheimDmx/ClosedHat.wav" => buf.read;
    }
}

class Crash extends Sample
{
    {
        "samples/OberheimDmx/Crash.wav" => buf.read;
    }
}

class HighTom extends Sample
{
    {
        "samples/OberheimDmx/HighTom.wav" => buf.read;
    }
}

class KickA extends Sample
{
    {
        "samples/OberheimDmx/KickA.wav" => buf.read;
    }
}

class KickB extends Sample
{
    {
        "samples/OberheimDmx/KickB.wav" => buf.read;
    }
}

class KickC extends Sample
{
    {
        "samples/OberheimDmx/KickC.wav" => buf.read;
    }
}

class LowTom extends Sample
{
    {
        "samples/OberheimDmx/LowTom.wav" => buf.read;
    }
}

class MiddleTom extends Sample
{
    {
        "samples/OberheimDmx/MiddleTom.wav" => buf.read;
    }
}

class OpenHat extends Sample
{
    {
        "samples/OberheimDmx/OpenHat.wav" => buf.read;
    }
}

class Ride extends Sample
{
    {
        "samples/OberheimDmx/Ride.wav" => buf.read;
    }
}

class Rim extends Sample
{
    {
        "samples/OberheimDmx/Rim.wav" => buf.read;
    }
}

class Shaker extends Sample
{
    {
        "samples/OberheimDmx/Shaker.wav" => buf.read;
    }
}

class Snare extends Sample
{
    {
        "samples/OberheimDmx/Snare.wav" => buf.read;
    }
}

class Tamborine extends Sample
{
    {
        "samples/OberheimDmx/Tamborine.wav" => buf.read;
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

public class OberheimDmx
{
    Clap clap;
    ClosedHat closedHat;
    Crash crash;
    HighTom highTom;
    KickA kickA;
    KickB kickB;
    KickC kickC;
    LowTom lowTom;
    MiddleTom middleTom;
    OpenHat openHat;
    Ride ride;
    Rim rim;
    Shaker shaker;
    Snare snare;
    Tamborine tamborine;

    fun void demo()
    {
        ArrayList samples;
        samples.add(clap);
        samples.add(closedHat);
        samples.add(crash);
        samples.add(highTom);
        samples.add(kickA);
        samples.add(kickB);
        samples.add(kickC);
        samples.add(lowTom);
        samples.add(middleTom);
        samples.add(openHat);
        samples.add(ride);
        samples.add(rim);
        samples.add(shaker);
        samples.add(snare);
        samples.add(tamborine);

        PlaySample playSample;
        32 => playSample.velocity;
        samples.forEach(playSample);

        64 => playSample.velocity;
        samples.forEach(playSample);

        127 => playSample.velocity;
        samples.forEach(playSample);
    }
}
