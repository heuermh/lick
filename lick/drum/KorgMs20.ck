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

//
// Korg MS-20 samples made available by Francis Prève
// http://francispreve.blogspot.de/2013/10/free-korg-ms-20-ableton-instruments.html
//

class DetunedPulse extends AdsrSample
{
    {
        "samples/KorgMs20/MS20 - Detuned Pulse.wav" => buf.read;
    }
}

class FilterFrenzy extends AdsrSample
{
    {
        "samples/KorgMs20/MS20 - Filter Frenzy.wav" => buf.read;
    }
}

class NoiseSquare extends AdsrSample
{
    {
        "samples/KorgMs20/MS20 - Noise Square.wav" => buf.read;
    }
}

class ResSawInterval extends AdsrSample
{
    {
        "samples/KorgMs20/MS20 - Res Saw Interval.wav" => buf.read;
    }
}

class ResoSquare extends AdsrSample
{
    {
        "samples/KorgMs20/MS20 - Reso Square.wav" => buf.read;
    }
}

class RingFizz extends AdsrSample
{
    {
        "samples/KorgMs20/MS20 - Ring Fizz.wav" => buf.read;
    }
}

class PlaySample extends UnaryProcedure
{
    float rate;
    float gain;

    fun void run(Object value)
    {
        value $ AdsrSample @=> AdsrSample sample;
        rate => sample.rate;
        gain => sample.gain;
        sample.keyOn();
        10000::ms => now;
        sample.keyOff();
        800::ms => now;
    }
}

public class KorgMs20
{
    DetunedPulse detunedPulse;
    FilterFrenzy filterFrenzy;
    NoiseSquare noiseSquare;
    ResSawInterval resSawInterval;
    ResoSquare resoSquare;
    RingFizz ringFizz;

    fun void demo()
    {
        ArrayList samples;
        samples.add(detunedPulse);
        samples.add(filterFrenzy);
        samples.add(noiseSquare);
        samples.add(resSawInterval);
        samples.add(resoSquare);
        samples.add(ringFizz);


        PlaySample playSample;
        1.0 => playSample.rate;
        0.4 => playSample.gain;

        <<<"as recorded (C3)">>>;
        samples.forEach(playSample);

        <<<"up a perfect fifth">>>;
        Intervals.perfectFifth().evaluate(1.0) => playSample.rate;
        samples.forEach(playSample);

        <<<"down a minor third">>>;
        Intervals.minorThird().desc().evaluate(1.0) => playSample.rate;
        samples.forEach(playSample);
    }
}
