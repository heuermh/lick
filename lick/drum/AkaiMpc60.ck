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

class ClosedHat extends Sample
{
    {
        me.dir() + "../../samples/AkaiMpc60/ClosedHat.wav" => buf.read;
    }
}

class Conga extends Sample
{
    {
        me.dir() + "../../samples/AkaiMpc60/Conga.wav" => buf.read;
    }
}

class Crash extends Sample
{
    {
        me.dir() + "../../samples/AkaiMpc60/Crash.wav" => buf.read;
    }
}

class HighTom extends Sample
{
    {
        me.dir() + "../../samples/AkaiMpc60/HighTom.wav" => buf.read;
    }
}

class Kick extends Sample
{
    {
        me.dir() + "../../samples/AkaiMpc60/Kick.wav" => buf.read;
    }
}

class LowTomA extends Sample
{
    {
        me.dir() + "../../samples/AkaiMpc60/LowTomA.wav" => buf.read;
    }
}

class LowTomB extends Sample
{
    {
        me.dir() + "../../samples/AkaiMpc60/LowTomB.wav" => buf.read;
    }
}

class MiddleTom extends Sample
{
    {
        me.dir() + "../../samples/AkaiMpc60/MiddleTom.wav" => buf.read;
    }
}

class OpenHat extends Sample
{
    {
        me.dir() + "../../samples/AkaiMpc60/OpenHat.wav" => buf.read;
    }
}

class Ride extends Sample
{
    {
        me.dir() + "../../samples/AkaiMpc60/Ride.wav" => buf.read;
    }
}

class Rim extends Sample
{
    {
        me.dir() + "../../samples/AkaiMpc60/Rim.wav" => buf.read;
    }
}

class Snare extends Sample
{
    {
        me.dir() + "../../samples/AkaiMpc60/Snare.wav" => buf.read;
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

public class AkaiMpc60
{
    ClosedHat closedHat;
    Conga conga;
    Crash crash;
    HighTom highTom;
    Kick kick;
    LowTomA lowTomA;
    LowTomB lowTomB;
    MiddleTom middleTom;
    OpenHat openHat;
    Ride ride;
    Rim rim;
    Snare snare;

    fun ArrayList list()
    {
        ArrayList samples;
        samples.add(closedHat);
        samples.add(conga);
        samples.add(crash);
        samples.add(highTom);
        samples.add(kick);
        samples.add(lowTomA);
        samples.add(lowTomB);
        samples.add(middleTom);
        samples.add(openHat);
        samples.add(ride);
        samples.add(rim);
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
