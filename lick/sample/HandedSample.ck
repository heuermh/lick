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

class HandedSampleProcedure extends Procedure
{
    Sample @ sample;

    fun void run()
    {
        sample.play();
    }
}

class HandedSampleIntProcedure extends IntProcedure
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

class HandedSampleIntIntProcedure extends IntIntProcedure
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

class HandedSampleFloatProcedure extends FloatProcedure
{
    Sample @ sample;

    fun void run(float gain)
    {
        gain => sample.gain;
        sample.play();
    }
}

class HandedSampleFloatFloatProcedure extends FloatFloatProcedure
{
    Sample @ sample;

    fun void run(float rate, float gain)
    {
        rate => sample.rate;
        gain => sample.gain;
        sample.play();
    }
}

public class HandedSample extends Sample
//    implements Procedure, IntProcedure, IntIntProcedure, FloatProcedure, FloatFloatProcedure
{
    0 => int hand;
    ArrayList leftHandSamples;
    ArrayList rightHandSamples;

    // hack to simulate multiple inheritance
    HandedSampleProcedure _handedProcedure;
    HandedSampleIntProcedure _handedIntProcedure;
    HandedSampleIntIntProcedure _handedIntIntProcedure;
    HandedSampleFloatProcedure _handedFloatProcedure;
    HandedSampleFloatFloatProcedure _handedFloatFloatProcedure;

    {
        this @=> _handedProcedure.sample;
        this @=> _handedIntProcedure.sample;
        this @=> _handedIntIntProcedure.sample;
        this @=> _handedFloatProcedure.sample;
        this @=> _handedFloatFloatProcedure.sample;
    }

    fun void switchHand()
    {
        (hand == 0) => hand;
    }

    fun ArrayList samples()
    {
        if (hand)
        {
            return leftHandSamples;
        }
        return rightHandSamples;
    }

    fun void play()
    {
        samples() @=> ArrayList samples;
        ((minGain + gain)/(maxGain) * samples.size()) $ int => int index;
        samples.get(index - 1) $ Sample @=> Sample sample;
        rate => sample.rate;
        gain => sample.gain;
        sample.play();
        switchHand();
    }

    fun Procedure asProcedure()
    {
        return _handedProcedure;
    }

    fun IntProcedure asIntProcedure()
    {
        return _handedIntProcedure;
    }

    fun IntIntProcedure asIntIntProcedure()
    {
        return _handedIntIntProcedure;
    }

    fun FloatProcedure asFloatProcedure()
    {
        return _handedFloatProcedure;
    }

    fun FloatFloatProcedure asFloatFloatProcedure()
    {
        return _handedFloatFloatProcedure;
    }
}
