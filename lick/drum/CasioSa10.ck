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

class Crash extends Sample
{
    {
        "samples/CasioSa10/Crash.wav" => buf.read;
    }
}

class HighConga extends Sample
{
    {
        "samples/CasioSa10/HighConga.wav" => buf.read;
    }
}

class HighCowBell extends Sample
{
    {
        "samples/CasioSa10/HighCowBell.wav" => buf.read;
    }
}

class HighTom extends Sample
{
    {
        "samples/CasioSa10/HighTom.wav" => buf.read;
    }
}

class Kick extends Sample
{
    {
        "samples/CasioSa10/Kick.wav" => buf.read;
    }
}

class LowConga extends Sample
{
    {
        "samples/CasioSa10/LowConga.wav" => buf.read;
    }
}

class LowCowBell extends Sample
{
    {
        "samples/CasioSa10/LowCowBell.wav" => buf.read;
    }
}

class LowTom extends Sample
{
    {
        "samples/CasioSa10/LowTom.wav" => buf.read;
    }
}

class MiddleTom extends Sample
{
    {
        "samples/CasioSa10/MiddleTom.wav" => buf.read;
    }
}

class OpenHat extends Sample
{
    {
        "samples/CasioSa10/OpenHat.wav" => buf.read;
    }
}

class Ride extends Sample
{
    {
        "samples/CasioSa10/Ride.wav" => buf.read;
    }
}

class SnareA extends Sample
{
    {
        "samples/CasioSa10/SnareA.wav" => buf.read;
    }
}

class SnareB extends Sample
{
    {
        "samples/CasioSa10/SnareB.wav" => buf.read;
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

public class CasioSa10
{
    Crash crash;
    HighConga highConga;
    HighCowBell highCowBell;
    HighTom highTom;
    Kick kick;
    LowConga lowConga;
    LowCowBell lowCowBell;
    LowTom lowTom;
    MiddleTom middleTom;
    OpenHat openHat;
    Ride ride;
    SnareA snareA;
    SnareB snareB;

    fun void demo()
    {
        ArrayList samples;
        samples.add(crash);
        samples.add(highConga);
        samples.add(highCowBell);
        samples.add(highTom);
        samples.add(kick);
        samples.add(lowConga);
        samples.add(lowCowBell);
        samples.add(lowTom);
        samples.add(middleTom);
        samples.add(openHat);
        samples.add(ride);
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
