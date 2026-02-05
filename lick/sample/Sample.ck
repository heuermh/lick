/*

    LiCK  Library for ChucK.
    Copyright (c) 2007-2026 held jointly by the individual authors.

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


public class Sample
//    implements Procedure, IntProcedure, IntIntProcedure, FloatProcedure, FloatFloatProcedure
{
    1.0 => float rate;
    0.0 => float minRate;
    1.0 => float maxRate;
    0.8 => float gain;
    0.0 => float minGain;
    0.8 => float maxGain;
    "Sample" => string name;
    SndBuf buf => dac;

    // hack to simulate multiple inheritance
    SampleProcedure _procedure;
    SampleIntProcedure _intProcedure;
    SampleIntIntProcedure _intIntProcedure;
    SampleFloatProcedure _floatProcedure;
    SampleFloatFloatProcedure _floatFloatProcedure;

    // ref to last output ugen
    UGen @ _last;

    {
        0.0 => buf.gain;
        this @=> _procedure.sample;
        this @=> _intProcedure.sample;
        this @=> _intIntProcedure.sample;
        this @=> _floatProcedure.sample;
        this @=> _floatFloatProcedure.sample;
        dac @=> _last;
    }

    fun void play()
    {
        0 => buf.pos;
        rate => buf.rate;
        gain => buf.gain;
    }

    fun int loop()
    {
        return buf.loop();
    }

    fun int loop(int i)
    {
        i => buf.loop;
        return i;
    }

    fun void reconnect(UGen ugen)
    {
        //<<<"      reconnect, buf", buf, "ugen", ugen, "_last", _last>>>;
        buf =< _last;
        buf => ugen;
        ugen @=> _last;
    }

    fun Procedure asProcedure()
    {
        return _procedure;
    }

    fun IntProcedure asIntProcedure()
    {
        return _intProcedure;
    }

    fun IntIntProcedure asIntIntProcedure()
    {
        return _intIntProcedure;
    }

    fun FloatProcedure asFloatProcedure()
    {
        return _floatProcedure;
    }

    fun FloatFloatProcedure asFloatFloatProcedure()
    {
        return _floatFloatProcedure;
    }
}

class SampleProcedure extends Procedure
{
    Sample @ sample;

    fun void run()
    {
        sample.play();
    }
}

class SampleIntProcedure extends IntProcedure
{
    Sample @ sample;
    0 => int minGain;
    127 => int maxGain;

    fun void run(int gain)
    {
        sample.minGain + ((gain $ float) / ((minGain + maxGain) $ float)) * (sample.maxGain - sample.minGain) => sample.gain;
        sample.play();
    }
}

class SampleIntIntProcedure extends IntIntProcedure
{
    Sample @ sample;
    0 => int minGain;
    127 => int maxGain;
    0 => int minRate;
    127 => int maxRate;

    fun void run(int rate, int gain)
    {
        sample.minRate + ((rate $ float) / ((minRate + maxRate) $ float)) * (sample.maxRate - sample.minRate) => sample.rate;
        sample.minGain + ((gain $ float) / ((minGain + maxGain) $ float)) * (sample.maxGain - sample.minGain) => sample.gain;
        sample.play();
    }
}

class SampleFloatProcedure extends FloatProcedure
{
    Sample @ sample;

    fun void run(float gain)
    {
        gain => sample.gain;
        sample.play();
    }
}

class SampleFloatFloatProcedure extends FloatFloatProcedure
{
    Sample @ sample;

    fun void run(float rate, float gain)
    {
        rate => sample.rate;
        gain => sample.gain;
        sample.play();
    }
}
