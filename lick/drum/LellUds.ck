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
        me.dir() + "../../samples/LellUds/Clap.wav" => buf.read;
    }
}

class ClosedHatA extends Sample
{
    {
        me.dir() + "../../samples/LellUds/ClosedHatA.wav" => buf.read;
    }
}

class ClosedHatB extends Sample
{
    {
        me.dir() + "../../samples/LellUds/ClosedHatB.wav" => buf.read;
    }
}

class KickA extends Sample
{
    {
        me.dir() + "../../samples/LellUds/KickA.wav" => buf.read;
    }
}

class KickB extends Sample
{
    {
        me.dir() + "../../samples/LellUds/KickB.wav" => buf.read;
    }
}

class KickC extends Sample
{
    {
        me.dir() + "../../samples/LellUds/KickC.wav" => buf.read;
    }
}

class OpenHatA extends Sample
{
    {
        me.dir() + "../../samples/LellUds/OpenHatA.wav" => buf.read;
    }
}

class OpenHatB extends Sample
{
    {
        me.dir() + "../../samples/LellUds/OpenHatB.wav" => buf.read;
    }
}

class SnareA extends Sample
{
    {
        me.dir() + "../../samples/LellUds/SnareA.wav" => buf.read;
    }
}

class SnareB extends Sample
{
    {
        me.dir() + "../../samples/LellUds/SnareB.wav" => buf.read;
    }
}

class SnareC extends Sample
{
    {
        me.dir() + "../../samples/LellUds/SnareC.wav" => buf.read;
    }
}

class SnareD extends Sample
{
    {
        me.dir() + "../../samples/LellUds/SnareD.wav" => buf.read;
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

public class LellUds
{
    Clap clap;
    ClosedHatA closedHatA;
    ClosedHatB closedHatB;
    KickA kickA;
    KickB kickB;
    KickC kickC;
    OpenHatA openHatA;
    OpenHatB openHatB;
    SnareA snareA;
    SnareB snareB;
    SnareC snareC;
    SnareD snareD;

    fun ArrayList list()
    {
        ArrayList samples;
        samples.add(clap);
        samples.add(closedHatA);
        samples.add(closedHatB);
        samples.add(kickA);
        samples.add(kickB);
        samples.add(kickC);
        samples.add(openHatA);
        samples.add(openHatB);
        samples.add(snareA);
        samples.add(snareB);
        samples.add(snareC);
        samples.add(snareD);
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
