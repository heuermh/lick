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

class Claves extends Sample
{
    {
        "samples/RolandCr78/Claves.wav" => buf.read;
    }
}

class ClosedHat extends Sample
{
    {
        "samples/RolandCr78/ClosedHat.wav" => buf.read;
    }
}

class CowBell extends Sample
{
    {
        "samples/RolandCr78/CowBell.wav" => buf.read;
    }
}

class Crash extends Sample
{
    {
        "samples/RolandCr78/Crash.wav" => buf.read;
    }
}

class Guiro extends Sample
{
    {
        "samples/RolandCr78/Guiro.wav" => buf.read;
    }
}

class HighBongo extends Sample
{
    {
        "samples/RolandCr78/HighBongo.wav" => buf.read;
    }
}

class Kick extends Sample
{
    {
        "samples/RolandCr78/Kick.wav" => buf.read;
    }
}

class LowBongo extends Sample
{
    {
        "samples/RolandCr78/LowBongo.wav" => buf.read;
    }
}

class LowConga extends Sample
{
    {
        "samples/RolandCr78/LowConga.wav" => buf.read;
    }
}

class Maracas extends Sample
{
    {
        "samples/RolandCr78/Maracas.wav" => buf.read;
    }
}

class OpenHat extends Sample
{
    {
        "samples/RolandCr78/OpenHat.wav" => buf.read;
    }
}

class Rim extends Sample
{
    {
        "samples/RolandCr78/Rim.wav" => buf.read;
    }
}

class Snare extends Sample
{
    {
        "samples/RolandCr78/Snare.wav" => buf.read;
    }
}

class Tamborine extends Sample
{
    {
        "samples/RolandCr78/Tamborine.wav" => buf.read;
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

public class RolandCr78
{
    Claves claves;
    ClosedHat closedHat;
    CowBell cowBell;
    Crash crash;
    Guiro guiro;
    HighBongo highBongo;
    Kick kick;
    LowBongo lowBongo;
    LowConga lowConga;
    Maracas maracas;
    OpenHat openHat;
    Rim rim;
    Snare snare;
    Tamborine tamborine;

    fun void demo()
    {
        ArrayList samples;
        samples.add(claves);
        samples.add(closedHat);
        samples.add(cowBell);
        samples.add(crash);
        samples.add(guiro);
        samples.add(highBongo);
        samples.add(kick);
        samples.add(lowBongo);
        samples.add(lowConga);
        samples.add(maracas);
        samples.add(openHat);
        samples.add(rim);
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
