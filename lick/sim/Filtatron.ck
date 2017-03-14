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

// emulates the Filtatron iOS app
public class Filtatron
{
    0 => static int SAMPLER_PLAY;
    1 => static int SAMPLER_PAUSE;
    SAMPLER_PAUSE => int _sampler;

    fun void open(int device)
    {
        <<<"open", device>>>;
    }


    // controls

    fun void vcoFreq(int vcoFreq)
    {
        <<<"vcoFreq", vcoFreq>>>;
    }

    fun void vcoFreq(float _vcoFreq)
    {
        vcoFreq(toCC(_vcoFreq));
    }

    fun void vcoWaveform(int vcoWaveform)
    {
        <<<"vcoWaveform", vcoWaveform>>>;
    }

    fun void vcoWaveform(float _vcoWaveform)
    {
        vcoWaveform(toCC(_vcoWaveform));
    }

    fun void vcoLevel(int vcoLevel)
    {
        <<<"vcoLevel", vcoLevel>>>;
    }

    fun void vcoLevel(float _vcoLevel)
    {
        vcoLevel(toCC(_vcoLevel));
    }

    fun void vcoRelease(int vcoRelease)
    {
        <<<"vcoRelease", vcoRelease>>>;
    }

    fun void vcoRelease(float _vcoRelease)
    {
        vcoRelease(toCC(_vcoRelease));
    }

    fun void vcoReleaseEnabled(int vcoReleaseEnabled)
    {
        <<<"vcoReleaseEnabled", vcoReleaseEnabled>>>;
    }

    fun void vcoReleaseEnabled(float _vcoReleaseEnabled)
    {
        vcoReleaseEnabled(toCC(_vcoReleaseEnabled));
    }

    fun void samplerPlay()
    {
        if (_sampler == SAMPLER_PAUSE)
        {
            <<<"samplerPlay">>>;
            SAMPLER_PLAY => _sampler;
        }
    }

    fun void samplerPause()
    {
        if (_sampler == SAMPLER_PLAY)
        {
            <<<"samplerPause">>>;
            SAMPLER_PAUSE => _sampler;
        }
    }

    fun void samplerRate(int samplerRate)
    {
        <<<"samplerRate", samplerRate>>>;
    }

    fun void samplerRate(float _samplerRate)
    {
        samplerRate(toCC(_samplerRate));
    }

    fun void samplerLevel(int samplerLevel)
    {
        <<<"samplerLevel", samplerLevel>>>;
    }

    fun void samplerLevel(float _samplerLevel)
    {
        samplerLevel(toCC(_samplerLevel));
    }

    fun void loopStart(int loopStart)
    {
        <<<"loopStart", loopStart>>>;
    }

    fun void loopStart(float _loopStart)
    {
        loopStart(toCC(_loopStart));
    }

    fun void loopEnd(int loopEnd)
    {
        <<<"loopEnd", loopEnd>>>;
    }

    fun void loopEnd(float _loopEnd)
    {
        loopEnd(toCC(_loopEnd));
    }

    fun void vcfCutoff(int vcfCutoff)
    {
        <<<"vcfCutoff", vcfCutoff>>>;
    }

    fun void vcfCutoff(float _vcfCutoff)
    {
        vcfCutoff(toCC(_vcfCutoff));
    }

    fun void vcfResonance(int vcfResonance)
    {
        <<<"vcfResonance", vcfResonance>>>;
    }

    fun void vcfResonance(float _vcfResonance)
    {
        vcfResonance(toCC(_vcfResonance));
    }

    fun void vcfSeparation(int vcfSeparation)
    {
        <<<"vcfSeparation", vcfSeparation>>>;
    }

    fun void vcfSeparation(float _vcfSeparation)
    {
        vcfSeparation(toCC(_vcfSeparation));
    }

    fun void vcfType(int vcfType)
    {
        <<<"vcfType", vcfType>>>;
    }

    fun void vcfType(float _vcfType)
    {
        vcfType(toCC(_vcfType));
    }

    fun void vcfMix(int vcfMix)
    {
        <<<"vcfMix", vcfMix>>>;
    }

    fun void vcfMix(float _vcfMix)
    {
        vcfMix(toCC(_vcfMix));
    }

    fun void envSpeed(int envSpeed)
    {
        <<<"envSpeed", envSpeed>>>;
    }

    fun void envSpeed(float _envSpeed)
    {
        envSpeed(toCC(_envSpeed));
    }

    fun void envAmount(int envAmount)
    {
        <<<"envAmount", envAmount>>>;
    }

    fun void envAmount(float _envAmount)
    {
        envAmount(toCC(_envAmount));
    }

    fun void lfoRate(int lfoRate)
    {
        <<<"lfoRate", lfoRate>>>;
    }

    fun void lfoRate(float _lfoRate)
    {
        lfoRate(toCC(_lfoRate));
    }

    fun void lfoRateSync(int lfoRateSync)
    {
        <<<"lfoRateSync", lfoRateSync>>>;
    }

    fun void lfoRateSync(float _lfoRateSync)
    {
        lfoRateSync(toCC(_lfoRateSync));
    }

    fun void lfoAmount(int lfoAmount)
    {
        <<<"lfoAmount", lfoAmount>>>;
    }

    fun void lfoAmount(float _lfoAmount)
    {
        lfoAmount(toCC(_lfoAmount));
    }

    fun void lfoWaveform(int lfoWaveform)
    {
        <<<"lfoWaveform", lfoWaveform>>>;
    }

    fun void lfoWaveform(float _lfoWaveform)
    {
        lfoWaveform(toCC(_lfoWaveform));
    }

    fun void ampDrive(int ampDrive)
    {
        <<<"ampDrive", ampDrive>>>;
    }

    fun void ampDrive(float _ampDrive)
    {
        ampDrive(toCC(_ampDrive));
    }

    fun void ampFeedback(int ampFeedback)
    {
        <<<"ampFeedback", ampFeedback>>>;
    }

    fun void ampFeedback(float _ampFeedback)
    {
        ampFeedback(toCC(_ampFeedback));
    }

    fun void delayTime(int delayTime)
    {
        <<<"delayTime", delayTime>>>;
    }

    fun void delayTime(float _delayTime)
    {
        delayTime(toCC(_delayTime));
    }

    fun void delayTimeSync(int delayTimeSync)
    {
        <<<"delayTimeSync", delayTimeSync>>>;
    }

    fun void delayTimeSync(float _delayTimeSync)
    {
        delayTimeSync(toCC(_delayTimeSync));
    }

    fun void delayFeedback(int delayFeedback)
    {
        <<<"delayFeedback", delayFeedback>>>;
    }

    fun void delayFeedback(float _delayFeedback)
    {
        delayFeedback(toCC(_delayFeedback));
    }

    fun void delayMix(int delayMix)
    {
        <<<"delayMix", delayMix>>>;
    }

    fun void delayMix(float _delayMix)
    {
        delayMix(toCC(_delayMix));
    }

    fun void lineLevel(int lineLevel)
    {
        <<<"lineLevel", lineLevel>>>;
    }

    fun void lineLevel(float _lineLevel)
    {
        lineLevel(toCC(_lineLevel));
    }

    // utility methods

    fun int toCC(float value)
    {
        if (value < 0.0)
        {
            return 0;
        }
        if (value > 1.0)
        {
            return 127;
        }
        return (value * 127.0) $ int;
    }
}
