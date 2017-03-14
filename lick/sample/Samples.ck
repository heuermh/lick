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

public class Samples
{
    fun static Sample createSample(string path)
    {
        Sample sample;
        path => sample.buf.read;
        return sample;
    }

    fun static AdsrSample createAdsrSample(string path)
    {
        AdsrSample sample;
        path => sample.buf.read;
        return sample;
    }

    fun static HandedSample createHandedSample(Sample leftHand, Sample rightHand)
    {
        HandedSample sample;
        sample.leftHandSamples.size(1);
        sample.leftHandSamples.clear();
        sample.leftHandSamples.add(leftHand);
        sample.rightHandSamples.size(1);
        sample.rightHandSamples.clear();
        sample.rightHandSamples.add(rightHand);
        return sample;
    }

    fun static CompositeSample createCompositeSample(Sample sample0, Sample sample1)
    {
        CompositeSample sample;
        sample.samples.size(2);
        sample.samples.clear();
        sample.samples.add(sample0);
        sample.samples.add(sample1);
        return sample;
    }

    fun static CompositeSample createCompositeSample(Sample sample0, Sample sample1, Sample sample2)
    {
        CompositeSample sample;
        sample.samples.size(3);
        sample.samples.clear();
        sample.samples.add(sample0);
        sample.samples.add(sample1);
        sample.samples.add(sample2);
        return sample;
    }

    fun static CompositeSample createCompositeSample(Sample sample0, Sample sample1, Sample sample2, Sample sample3)
    {
        CompositeSample sample;
        sample.samples.size(4);
        sample.samples.clear();
        sample.samples.add(sample0);
        sample.samples.add(sample1);
        sample.samples.add(sample2);
        sample.samples.add(sample3);
        return sample;
    }

    fun static CompositeSample createCompositeSample(Sample sample0, Sample sample1, Sample sample2, Sample sample3, Sample sample4)
    {
        CompositeSample sample;
        sample.samples.size(5);
        sample.samples.clear();
        sample.samples.add(sample0);
        sample.samples.add(sample1);
        sample.samples.add(sample2);
        sample.samples.add(sample3);
        sample.samples.add(sample4);
        return sample;
    }

    fun static CompositeSample createCompositeSample(Sample sample0, Sample sample1, Sample sample2, Sample sample3, Sample sample4, Sample sample5)
    {
        CompositeSample sample;
        sample.samples.size(6);
        sample.samples.clear();
        sample.samples.add(sample0);
        sample.samples.add(sample1);
        sample.samples.add(sample2);
        sample.samples.add(sample3);
        sample.samples.add(sample4);
        sample.samples.add(sample5);
        return sample;
    }

    fun static CompositeSample createCompositeSample(Sample sample0, Sample sample1, Sample sample2, Sample sample3, Sample sample4, Sample sample5, Sample sample6)
    {
        CompositeSample sample;
        sample.samples.size(7);
        sample.samples.clear();
        sample.samples.add(sample0);
        sample.samples.add(sample1);
        sample.samples.add(sample2);
        sample.samples.add(sample3);
        sample.samples.add(sample4);
        sample.samples.add(sample5);
        sample.samples.add(sample6);
        return sample;
    }

    fun static CompositeSample createCompositeSample(Sample sample0, Sample sample1, Sample sample2, Sample sample3, Sample sample4, Sample sample5, Sample sample6, Sample sample7)
    {
        CompositeSample sample;
        sample.samples.size(8);
        sample.samples.clear();
        sample.samples.add(sample0);
        sample.samples.add(sample1);
        sample.samples.add(sample2);
        sample.samples.add(sample3);
        sample.samples.add(sample4);
        sample.samples.add(sample5);
        sample.samples.add(sample6);
        sample.samples.add(sample7);
        return sample;
    }

    fun static RandomSample createRandomSample(Sample sample0, Sample sample1)
    {
        RandomSample sample;
        sample.samples.size(2);
        sample.samples.clear();
        sample.samples.add(sample0);
        sample.samples.add(sample1);
        return sample;
    }

    fun static RandomSample createRandomSample(Sample sample0, Sample sample1, Sample sample2)
    {
        RandomSample sample;
        sample.samples.size(3);
        sample.samples.clear();
        sample.samples.add(sample0);
        sample.samples.add(sample1);
        sample.samples.add(sample2);
        return sample;
    }

    fun static RandomSample createRandomSample(Sample sample0, Sample sample1, Sample sample2, Sample sample3)
    {
        RandomSample sample;
        sample.samples.size(4);
        sample.samples.clear();
        sample.samples.add(sample0);
        sample.samples.add(sample1);
        sample.samples.add(sample2);
        sample.samples.add(sample3);
        return sample;
    }

    fun static RandomSample createRandomSample(Sample sample0, Sample sample1, Sample sample2, Sample sample3, Sample sample4)
    {
        RandomSample sample;
        sample.samples.size(5);
        sample.samples.clear();
        sample.samples.add(sample0);
        sample.samples.add(sample1);
        sample.samples.add(sample2);
        sample.samples.add(sample3);
        sample.samples.add(sample4);
        return sample;
    }

    fun static RandomSample createRandomSample(Sample sample0, Sample sample1, Sample sample2, Sample sample3, Sample sample4, Sample sample5)
    {
        RandomSample sample;
        sample.samples.size(6);
        sample.samples.clear();
        sample.samples.add(sample0);
        sample.samples.add(sample1);
        sample.samples.add(sample2);
        sample.samples.add(sample3);
        sample.samples.add(sample4);
        sample.samples.add(sample5);
        return sample;
    }

    fun static RandomSample createRandomSample(Sample sample0, Sample sample1, Sample sample2, Sample sample3, Sample sample4, Sample sample5, Sample sample6)
    {
        RandomSample sample;
        sample.samples.size(7);
        sample.samples.clear();
        sample.samples.add(sample0);
        sample.samples.add(sample1);
        sample.samples.add(sample2);
        sample.samples.add(sample3);
        sample.samples.add(sample4);
        sample.samples.add(sample5);
        sample.samples.add(sample6);
        return sample;
    }

    fun static RandomSample createRandomSample(Sample sample0, Sample sample1, Sample sample2, Sample sample3, Sample sample4, Sample sample5, Sample sample6, Sample sample7)
    {
        RandomSample sample;
        sample.samples.size(8);
        sample.samples.clear();
        sample.samples.add(sample0);
        sample.samples.add(sample1);
        sample.samples.add(sample2);
        sample.samples.add(sample3);
        sample.samples.add(sample4);
        sample.samples.add(sample5);
        sample.samples.add(sample6);
        sample.samples.add(sample7);
        return sample;
    }


    fun static PitchSensitiveSample createPitchSensitiveSample(Sample sample0, Sample sample1)
    {
        PitchSensitiveSample sample;
        sample.samples.size(2);
        sample.samples.clear();
        sample.samples.add(sample0);
        sample.samples.add(sample1);
        return sample;
    }

    fun static PitchSensitiveSample createPitchSensitiveSample(Sample sample0, Sample sample1, Sample sample2)
    {
        PitchSensitiveSample sample;
        sample.samples.size(3);
        sample.samples.clear();
        sample.samples.add(sample0);
        sample.samples.add(sample1);
        sample.samples.add(sample2);
        return sample;
    }

    fun static PitchSensitiveSample createPitchSensitiveSample(Sample sample0, Sample sample1, Sample sample2, Sample sample3)
    {
        PitchSensitiveSample sample;
        sample.samples.size(4);
        sample.samples.clear();
        sample.samples.add(sample0);
        sample.samples.add(sample1);
        sample.samples.add(sample2);
        sample.samples.add(sample3);
        return sample;
    }

    fun static PitchSensitiveSample createPitchSensitiveSample(Sample sample0, Sample sample1, Sample sample2, Sample sample3, Sample sample4)
    {
        PitchSensitiveSample sample;
        sample.samples.size(5);
        sample.samples.clear();
        sample.samples.add(sample0);
        sample.samples.add(sample1);
        sample.samples.add(sample2);
        sample.samples.add(sample3);
        sample.samples.add(sample4);
        return sample;
    }

    fun static PitchSensitiveSample createPitchSensitiveSample(Sample sample0, Sample sample1, Sample sample2, Sample sample3, Sample sample4, Sample sample5)
    {
        PitchSensitiveSample sample;
        sample.samples.size(6);
        sample.samples.clear();
        sample.samples.add(sample0);
        sample.samples.add(sample1);
        sample.samples.add(sample2);
        sample.samples.add(sample3);
        sample.samples.add(sample4);
        sample.samples.add(sample5);
        return sample;
    }

    fun static PitchSensitiveSample createPitchSensitiveSample(Sample sample0, Sample sample1, Sample sample2, Sample sample3, Sample sample4, Sample sample5, Sample sample6)
    {
        PitchSensitiveSample sample;
        sample.samples.size(7);
        sample.samples.clear();
        sample.samples.add(sample0);
        sample.samples.add(sample1);
        sample.samples.add(sample2);
        sample.samples.add(sample3);
        sample.samples.add(sample4);
        sample.samples.add(sample5);
        sample.samples.add(sample6);
        return sample;
    }

    fun static PitchSensitiveSample createPitchSensitiveSample(Sample sample0, Sample sample1, Sample sample2, Sample sample3, Sample sample4, Sample sample5, Sample sample6, Sample sample7)
    {
        PitchSensitiveSample sample;
        sample.samples.size(8);
        sample.samples.clear();
        sample.samples.add(sample0);
        sample.samples.add(sample1);
        sample.samples.add(sample2);
        sample.samples.add(sample3);
        sample.samples.add(sample4);
        sample.samples.add(sample5);
        sample.samples.add(sample6);
        sample.samples.add(sample7);
        return sample;
    }

    fun static VelocitySensitiveSample createVelocitySensitiveSample(Sample sample0, Sample sample1)
    {
        VelocitySensitiveSample sample;
        sample.samples.size(2);
        sample.samples.clear();
        sample.samples.add(sample0);
        sample.samples.add(sample1);
        return sample;
    }

    fun static VelocitySensitiveSample createVelocitySensitiveSample(Sample sample0, Sample sample1, Sample sample2)
    {
        VelocitySensitiveSample sample;
        sample.samples.size(3);
        sample.samples.clear();
        sample.samples.add(sample0);
        sample.samples.add(sample1);
        sample.samples.add(sample2);
        return sample;
    }

    fun static VelocitySensitiveSample createVelocitySensitiveSample(Sample sample0, Sample sample1, Sample sample2, Sample sample3)
    {
        VelocitySensitiveSample sample;
        sample.samples.size(4);
        sample.samples.clear();
        sample.samples.add(sample0);
        sample.samples.add(sample1);
        sample.samples.add(sample2);
        sample.samples.add(sample3);
        return sample;
    }

    fun static VelocitySensitiveSample createVelocitySensitiveSample(Sample sample0, Sample sample1, Sample sample2, Sample sample3, Sample sample4)
    {
        VelocitySensitiveSample sample;
        sample.samples.size(5);
        sample.samples.clear();
        sample.samples.add(sample0);
        sample.samples.add(sample1);
        sample.samples.add(sample2);
        sample.samples.add(sample3);
        sample.samples.add(sample4);
        return sample;
    }

    fun static VelocitySensitiveSample createVelocitySensitiveSample(Sample sample0, Sample sample1, Sample sample2, Sample sample3, Sample sample4, Sample sample5)
    {
        VelocitySensitiveSample sample;
        sample.samples.size(6);
        sample.samples.clear();
        sample.samples.add(sample0);
        sample.samples.add(sample1);
        sample.samples.add(sample2);
        sample.samples.add(sample3);
        sample.samples.add(sample4);
        sample.samples.add(sample5);
        return sample;
    }

    fun static VelocitySensitiveSample createVelocitySensitiveSample(Sample sample0, Sample sample1, Sample sample2, Sample sample3, Sample sample4, Sample sample5, Sample sample6)
    {
        VelocitySensitiveSample sample;
        sample.samples.size(7);
        sample.samples.clear();
        sample.samples.add(sample0);
        sample.samples.add(sample1);
        sample.samples.add(sample2);
        sample.samples.add(sample3);
        sample.samples.add(sample4);
        sample.samples.add(sample5);
        sample.samples.add(sample6);
        return sample;
    }

    fun static VelocitySensitiveSample createVelocitySensitiveSample(Sample sample0, Sample sample1, Sample sample2, Sample sample3, Sample sample4, Sample sample5, Sample sample6, Sample sample7)
    {
        VelocitySensitiveSample sample;
        sample.samples.size(8);
        sample.samples.clear();
        sample.samples.add(sample0);
        sample.samples.add(sample1);
        sample.samples.add(sample2);
        sample.samples.add(sample3);
        sample.samples.add(sample4);
        sample.samples.add(sample5);
        sample.samples.add(sample6);
        sample.samples.add(sample7);
        return sample;
    }
}
