/*

    LiCK  Library for ChucK.
    Copyright (c) 2007-2025 held jointly by the individual authors.

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

@import "../sample/Sample"
@import "../sample/Reconnect"

class Clap extends Sample
{
    {
        me.dir() + "../../samples/LinnDrum/Clap.wav" => buf.read;
    }
}

class ClosedHatA extends Sample
{
    {
        me.dir() + "../../samples/LinnDrum/ClosedHatA.wav" => buf.read;
    }
}

class ClosedHatB extends Sample
{
    {
        me.dir() + "../../samples/LinnDrum/ClosedHatB.wav" => buf.read;
    }
}

class Crash extends Sample
{
    {
        me.dir() + "../../samples/LinnDrum/Crash.wav" => buf.read;
    }
}

class HighTom extends Sample
{
    {
        me.dir() + "../../samples/LinnDrum/HighTom.wav" => buf.read;
    }
}

class KickA extends Sample
{
    {
        me.dir() + "../../samples/LinnDrum/KickA.wav" => buf.read;
    }
}

class KickB extends Sample
{
    {
        me.dir() + "../../samples/LinnDrum/KickB.wav" => buf.read;
    }
}

class LowTom extends Sample
{
    {
        me.dir() + "../../samples/LinnDrum/LowTom.wav" => buf.read;
    }
}

class MediumTom extends Sample
{
    {
        me.dir() + "../../samples/LinnDrum/MediumTom.wav" => buf.read;
    }
}

class OpenHat extends Sample
{
    {
        me.dir() + "../../samples/LinnDrum/OpenHat.wav" => buf.read;
    }
}

class RideA extends Sample
{
    {
        me.dir() + "../../samples/LinnDrum/RideA.wav" => buf.read;
    }
}

class RideB extends Sample
{
    {
        me.dir() + "../../samples/LinnDrum/RideB.wav" => buf.read;
    }
}

class SnareA extends Sample
{
    {
        me.dir() + "../../samples/LinnDrum/SnareA.wav" => buf.read;
    }
}

class SnareB extends Sample
{
    {
        me.dir() + "../../samples/LinnDrum/SnareB.wav" => buf.read;
    }
}

class SnareC extends Sample
{
    {
        me.dir() + "../../samples/LinnDrum/SnareC.wav" => buf.read;
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

public class LinnDrum
{
    Clap clap;
    ClosedHatA closedHatA;
    ClosedHatB closedHatB;
    Crash crash;
    HighTom highTom;
    KickA kickA;
    KickB kickB;
    LowTom lowTom;
    MediumTom mediumTom;
    OpenHat openHat;
    RideA rideA;
    RideB rideB;
    SnareA snareA;
    SnareB snareB;
    SnareC snareC;

    fun ArrayList list()
    {
        ArrayList samples;
        samples.add(clap);
        samples.add(closedHatA);
        samples.add(closedHatB);
        samples.add(crash);
        samples.add(highTom);
        samples.add(kickA);
        samples.add(kickB);
        samples.add(lowTom);
        samples.add(mediumTom);
        samples.add(openHat);
        samples.add(rideA);
        samples.add(rideB);
        samples.add(snareA);
        samples.add(snareB);
        samples.add(snareC);
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
