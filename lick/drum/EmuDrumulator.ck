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
        "samples/EmuDrumulator/Clap.wav" => buf.read;
    }
}

class Clave extends Sample
{
    {
        "samples/EmuDrumulator/Clave.wav" => buf.read;
    }
}

class ClosedHat extends Sample
{
    {
        "samples/EmuDrumulator/ClosedHat.wav" => buf.read;
    }
}

class CowBell extends Sample
{
    {
        "samples/EmuDrumulator/CowBell.wav" => buf.read;
    }
}

class Crash extends Sample
{
    {
        "samples/EmuDrumulator/Crash.wav" => buf.read;
    }
}

class HighTom extends Sample
{
    {
        "samples/EmuDrumulator/HighTom.wav" => buf.read;
    }
}

class Kick extends Sample
{
    {
        "samples/EmuDrumulator/Kick.wav" => buf.read;
    }
}

class LowTom extends Sample
{
    {
        "samples/EmuDrumulator/LowTom.wav" => buf.read;
    }
}

class MiddleTom extends Sample
{
    {
        "samples/EmuDrumulator/MiddleTom.wav" => buf.read;
    }
}

class OpenHat extends Sample
{
    {
        "samples/EmuDrumulator/OpenHat.wav" => buf.read;
    }
}

class Rim extends Sample
{
    {
        "samples/EmuDrumulator/Rim.wav" => buf.read;
    }
}

class Snare extends Sample
{
    {
        "samples/EmuDrumulator/Snare.wav" => buf.read;
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

public class EmuDrumulator
{
    Clap clap;
    Clave clave;
    ClosedHat closedHat;
    CowBell cowBell;
    Crash crash;
    HighTom highTom;
    Kick kick;
    LowTom lowTom;
    MiddleTom middleTom;
    OpenHat openHat;
    Rim rim;
    Snare snare;

    fun void demo()
    {
        ArrayList samples;
        samples.add(clap);
        samples.add(clave);
        samples.add(closedHat);
        samples.add(cowBell);
        samples.add(crash);
        samples.add(highTom);
        samples.add(kick);
        samples.add(lowTom);
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
