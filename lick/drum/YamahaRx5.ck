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

class Clap extends Sample
{
    {
        "samples/YamahaRx5/Clap.wav" => buf.read;
    }
}

class ClosedHatA extends Sample
{
    {
        "samples/YamahaRx5/ClosedHatA.wav" => buf.read;
    }
}

class ClosedHatB extends Sample
{
    {
        "samples/YamahaRx5/ClosedHatB.wav" => buf.read;
    }
}

class CrashA extends Sample
{
    {
        "samples/YamahaRx5/CrashA.wav" => buf.read;
    }
}

class CrashB extends Sample
{
    {
        "samples/YamahaRx5/CrashB.wav" => buf.read;
    }
}

class Kick extends Sample
{
    {
        "samples/YamahaRx5/Kick.wav" => buf.read;
    }
}

class OpenHat extends Sample
{
    {
        "samples/YamahaRx5/OpenHat.wav" => buf.read;
    }
}

class RideA extends Sample
{
    {
        "samples/YamahaRx5/RideA.wav" => buf.read;
    }
}

class RideB extends Sample
{
    {
        "samples/YamahaRx5/RideB.wav" => buf.read;
    }
}

class SnareA extends Sample
{
    {
        "samples/YamahaRx5/SnareA.wav" => buf.read;
    }
}

class SnareB extends Sample
{
    {
        "samples/YamahaRx5/SnareB.wav" => buf.read;
    }
}

class SnareC extends Sample
{
    {
        "samples/YamahaRx5/SnareC.wav" => buf.read;
    }
}

class SnareD extends Sample
{
    {
        "samples/YamahaRx5/SnareD.wav" => buf.read;
    }
}

class SnareE extends Sample
{
    {
        "samples/YamahaRx5/SnareE.wav" => buf.read;
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

public class YamahaRx5
{
    Clap clap;
    ClosedHatA closedHatA;
    ClosedHatB closedHatB;
    CrashA crashA;
    CrashB crashB;
    Kick kick;
    OpenHat openHat;
    RideA rideA;
    RideB rideB;
    SnareA snareA;
    SnareB snareB;
    SnareC snareC;
    SnareD snareD;
    SnareE snareE;

    fun ArrayList list()
    {
        ArrayList samples;
        samples.add(clap);
        samples.add(closedHatA);
        samples.add(closedHatB);
        samples.add(crashA);
        samples.add(crashB);
        samples.add(kick);
        samples.add(openHat);
        samples.add(rideA);
        samples.add(rideB);
        samples.add(snareA);
        samples.add(snareB);
        samples.add(snareC);
        samples.add(snareD);
        samples.add(snareE);
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
