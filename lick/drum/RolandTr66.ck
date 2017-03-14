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

class ClosedHat extends RandomSample
{
    {
        samples.add(Samples.createSample("samples/RolandTr66/ClosedHat1.wav"));
        samples.add(Samples.createSample("samples/RolandTr66/ClosedHat2.wav"));
        samples.add(Samples.createSample("samples/RolandTr66/ClosedHat3.wav"));
        samples.add(Samples.createSample("samples/RolandTr66/ClosedHat4.wav"));
    }
}

class Crash extends Sample
{
    {
        "samples/RolandTr66/Crash.wav" => buf.read;
    }
}

class HighConga extends Sample
{
    {
        "samples/RolandTr66/HighConga.wav" => buf.read;
    }
}

class KickA extends RandomSample
{
    {
        samples.add(Samples.createSample("samples/RolandTr66/KickA1.wav"));
        samples.add(Samples.createSample("samples/RolandTr66/KickA2.wav"));
        samples.add(Samples.createSample("samples/RolandTr66/KickA3.wav"));
        samples.add(Samples.createSample("samples/RolandTr66/KickA4.wav"));
    }
}

class KickB extends RandomSample
{
    {
        samples.add(Samples.createSample("samples/RolandTr66/KickB1.wav"));
        samples.add(Samples.createSample("samples/RolandTr66/KickB2.wav"));
        samples.add(Samples.createSample("samples/RolandTr66/KickB3.wav"));
        samples.add(Samples.createSample("samples/RolandTr66/KickB4.wav"));
    }
}

class LowConga extends Sample
{
    {
        "samples/RolandTr66/LowConga.wav" => buf.read;
    }
}

class OpenHat extends RandomSample
{
    {
        samples.add(Samples.createSample("samples/RolandTr66/OpenHat1.wav"));
        samples.add(Samples.createSample("samples/RolandTr66/OpenHat2.wav"));
    }
}

class Rim extends Sample
{
    {
        "samples/RolandTr66/Rim.wav" => buf.read;
    }
}

class Snare extends RandomSample
{
    {
        samples.add(Samples.createSample("samples/RolandTr66/Snare1.wav"));
        samples.add(Samples.createSample("samples/RolandTr66/Snare2.wav"));
        samples.add(Samples.createSample("samples/RolandTr66/Snare3.wav"));
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

public class RolandTr66
{
    ClosedHat closedHat;
    Crash crash;
    HighConga highConga;
    KickA kickA;
    KickB kickB;
    LowConga lowConga;
    OpenHat openHat;
    Rim rim;
    Snare snare;

    fun void demo()
    {
        ArrayList samples;
        samples.add(closedHat);
        samples.add(crash);
        samples.add(highConga);
        samples.add(kickA);
        samples.add(kickB);
        samples.add(lowConga);
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
