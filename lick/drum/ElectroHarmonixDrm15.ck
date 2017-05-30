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
        "samples/ElectroHarmonixDrm15/Clap.wav" => buf.read;
    }
}

class ClosedHatA extends Sample
{
    {
        "samples/ElectroHarmonixDrm15/ClosedHatA.wav" => buf.read;
    }
}

class ClosedHatB extends Sample
{
    {
        "samples/ElectroHarmonixDrm15/ClosedHatB.wav" => buf.read;
    }
}

class HighTom extends Sample
{
    {
        "samples/ElectroHarmonixDrm15/HighTom.wav" => buf.read;
    }
}

class KickA extends Sample
{
    {
        "samples/ElectroHarmonixDrm15/KickA.wav" => buf.read;
    }
}

class KickB extends Sample
{
    {
        "samples/ElectroHarmonixDrm15/KickB.wav" => buf.read;
    }
}

class LowTom extends Sample
{
    {
        "samples/ElectroHarmonixDrm15/LowTom.wav" => buf.read;
    }
}

class OpenHat extends Sample
{
    {
        "samples/ElectroHarmonixDrm15/OpenHat.wav" => buf.read;
    }
}

class Rim extends Sample
{
    {
        "samples/ElectroHarmonixDrm15/Rim.wav" => buf.read;
    }
}

class SnareA extends Sample
{
    {
        "samples/ElectroHarmonixDrm15/SnareA.wav" => buf.read;
    }
}

class SnareB extends Sample
{
    {
        "samples/ElectroHarmonixDrm15/SnareB.wav" => buf.read;
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

public class ElectroHarmonixDrm15
{
    Clap clap;
    ClosedHatA closedHatA;
    ClosedHatB closedHatB;
    HighTom highTom;
    KickA kickA;
    KickB kickB;
    LowTom lowTom;
    OpenHat openHat;
    Rim rim;
    SnareA snareA;
    SnareB snareB;

    fun void demo()
    {
        ArrayList samples;
        samples.add(clap);
        samples.add(closedHatA);
        samples.add(closedHatB);
        samples.add(highTom);
        samples.add(kickA);
        samples.add(kickB);
        samples.add(lowTom);
        samples.add(openHat);
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
