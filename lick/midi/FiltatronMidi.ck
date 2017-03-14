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

// interacts with the Filtatron iOS app over MIDI
public class FiltatronMidi
{
    // mapping
    0 => static int VCO_FREQ_CC;
    1 => static int VCO_WAVEFORM_CC;
    2 => static int VCO_LEVEL_CC;
    3 => static int VCO_RELEASE_CC;
    4 => static int VCO_RELEASE_ENABLED_CC;
    5 => static int SAMPLER_PLAY_PAUSE_CC;
    6 => static int SAMPLER_RATE_CC;
    7 => static int SAMPLER_LEVEL_CC;
    8 => static int SAMPLER_LOOP_START_CC;
    9 => static int SAMPLER_LOOP_END_CC;
    10 => static int VCF_CUTOFF_CC;
    11 => static int VCF_RESONANCE_CC;
    12 => static int VCF_SEPARATION_CC;
    13 => static int VCF_TYPE_CC;
    14 => static int VCF_MIX_CC;
    15 => static int ENV_SPEED_CC;
    16 => static int ENV_AMOUNT_CC;
    17 => static int LFO_RATE_CC;
    18 => static int LFO_RATE_SYNC_CC;
    19 => static int LFO_AMOUNT_CC;
    20 => static int LFO_WAVEFORM_CC;
    21 => static int AMP_DRIVE_CC;
    22 => static int AMP_FEEDBACK_CC;
    23 => static int DELAY_TIME_CC;
    24 => static int DELAY_TIME_SYNC_CC;
    25 => static int DELAY_FEEDBACK_CC;
    26 => static int DELAY_MIX_CC;
    27 => static int DELAY_MOD_RATE_CC;
    28 => static int DELAY_MOD_DEPTH_CC;
    29 => static int LINE_LEVEL_CC;

    0 => static int OFF;
    64 => static int ON;
    0 => static int SAMPLER_PLAY;
    1 => static int SAMPLER_PAUSE;

    MidiOut out;
    ControlChangeMidiMsg ccMsg;
    SAMPLER_PAUSE => int _sampler;

    fun void open(int device)
    {
        out.open(device);
    }


    // controls

    fun void vcoFreq(int vcoFreq)
    {
        ccMsg.number(VCO_FREQ_CC);
        ccMsg.value(vcoFreq);
        out.send(ccMsg);
    }

    fun void vcoFreq(float _vcoFreq)
    {
        vcoFreq(toCC(_vcoFreq));
    }

    fun void vcoWaveform(int vcoWaveform)
    {
        ccMsg.number(VCO_WAVEFORM_CC);
        ccMsg.value(vcoWaveform);
        out.send(ccMsg);
    }

    fun void vcoWaveform(float _vcoWaveform)
    {
        vcoWaveform(toCC(_vcoWaveform));
    }

    fun void vcoLevel(int vcoLevel)
    {
        ccMsg.number(VCO_LEVEL_CC);
        ccMsg.value(vcoLevel);
        out.send(ccMsg);
    }

    fun void vcoLevel(float _vcoLevel)
    {
        vcoLevel(toCC(_vcoLevel));
    }

    fun void vcoRelease(int vcoRelease)
    {
        ccMsg.number(VCO_RELEASE_CC);
        ccMsg.value(vcoRelease);
        out.send(ccMsg);
    }

    fun void vcoRelease(float _vcoRelease)
    {
        vcoRelease(toCC(_vcoRelease));
    }

    fun void vcoReleaseEnabled(int vcoReleaseEnabled)
    {
        ccMsg.number(VCO_RELEASE_ENABLED_CC);
        ccMsg.value(vcoReleaseEnabled);
        out.send(ccMsg);
    }

    fun void vcoReleaseEnabled(float _vcoReleaseEnabled)
    {
        vcoReleaseEnabled(toCC(_vcoReleaseEnabled));
    }

    fun void samplerPlay()
    {
        if (_sampler == SAMPLER_PAUSE)
        {
            ccMsg.number(SAMPLER_PLAY_PAUSE_CC);
            ccMsg.value(ON);
            out.send(ccMsg);
            SAMPLER_PLAY => _sampler;
        }
    }

    fun void samplerPause()
    {
        if (_sampler == SAMPLER_PLAY)
        {
            ccMsg.number(SAMPLER_PLAY_PAUSE_CC);
            ccMsg.value(OFF);
            out.send(ccMsg);
            SAMPLER_PAUSE => _sampler;
        }
    }

    fun void samplerRate(int samplerRate)
    {
        ccMsg.number(SAMPLER_RATE_CC);
        ccMsg.value(samplerRate);
        out.send(ccMsg);
    }

    fun void samplerRate(float _samplerRate)
    {
        samplerRate(toCC(_samplerRate));
    }

    fun void samplerLevel(int samplerLevel)
    {
        ccMsg.number(SAMPLER_LEVEL_CC);
        ccMsg.value(samplerLevel);
        out.send(ccMsg);
    }

    fun void samplerLevel(float _samplerLevel)
    {
        samplerLevel(toCC(_samplerLevel));
    }

    fun void loopStart(int loopStart)
    {
        ccMsg.number(SAMPLER_LOOP_START_CC);
        ccMsg.value(loopStart);
        out.send(ccMsg);
    }

    fun void loopStart(float _loopStart)
    {
        loopStart(toCC(_loopStart));
    }

    fun void loopEnd(int loopEnd)
    {
        ccMsg.number(SAMPLER_LOOP_END_CC);
        ccMsg.value(loopEnd);
        out.send(ccMsg);
    }

    fun void loopEnd(float _loopEnd)
    {
        loopEnd(toCC(_loopEnd));
    }

    fun void vcfCutoff(int vcfCutoff)
    {
        ccMsg.number(VCF_CUTOFF_CC);
        ccMsg.value(vcfCutoff);
        out.send(ccMsg);
    }

    fun void vcfCutoff(float _vcfCutoff)
    {
        vcfCutoff(toCC(_vcfCutoff));
    }

    fun void vcfResonance(int vcfResonance)
    {
        ccMsg.number(VCF_RESONANCE_CC);
        ccMsg.value(vcfResonance);
        out.send(ccMsg);
    }

    fun void vcfResonance(float _vcfResonance)
    {
        vcfResonance(toCC(_vcfResonance));
    }

    fun void vcfSeparation(int vcfSeparation)
    {
        ccMsg.number(VCF_SEPARATION_CC);
        ccMsg.value(vcfSeparation);
        out.send(ccMsg);
    }

    fun void vcfSeparation(float _vcfSeparation)
    {
        vcfSeparation(toCC(_vcfSeparation));
    }

    fun void vcfType(int vcfType)
    {
        ccMsg.number(VCF_TYPE_CC);
        ccMsg.value(vcfType);
        out.send(ccMsg);
    }

    fun void vcfType(float _vcfType)
    {
        vcfType(toCC(_vcfType));
    }

    fun void vcfMix(int vcfMix)
    {
        ccMsg.number(VCF_MIX_CC);
        ccMsg.value(vcfMix);
        out.send(ccMsg);
    }

    fun void vcfMix(float _vcfMix)
    {
        vcfMix(toCC(_vcfMix));
    }

    fun void envSpeed(int envSpeed)
    {
        ccMsg.number(ENV_SPEED_CC);
        ccMsg.value(envSpeed);
        out.send(ccMsg);
    }

    fun void envSpeed(float _envSpeed)
    {
        envSpeed(toCC(_envSpeed));
    }

    fun void envAmount(int envAmount)
    {
        ccMsg.number(ENV_AMOUNT_CC);
        ccMsg.value(envAmount);
        out.send(ccMsg);
    }

    fun void envAmount(float _envAmount)
    {
        envAmount(toCC(_envAmount));
    }

    fun void lfoRate(int lfoRate)
    {
        ccMsg.number(LFO_RATE_CC);
        ccMsg.value(lfoRate);
        out.send(ccMsg);
    }

    fun void lfoRate(float _lfoRate)
    {
        lfoRate(toCC(_lfoRate));
    }

    fun void lfoRateSync(int lfoRateSync)
    {
        ccMsg.number(LFO_RATE_SYNC_CC);
        ccMsg.value(lfoRateSync);
        out.send(ccMsg);
    }

    fun void lfoRateSync(float _lfoRateSync)
    {
        lfoRateSync(toCC(_lfoRateSync));
    }

    fun void lfoAmount(int lfoAmount)
    {
        ccMsg.number(LFO_AMOUNT_CC);
        ccMsg.value(lfoAmount);
        out.send(ccMsg);
    }

    fun void lfoAmount(float _lfoAmount)
    {
        lfoAmount(toCC(_lfoAmount));
    }

    fun void lfoWaveform(int lfoWaveform)
    {
        ccMsg.number(LFO_WAVEFORM_CC);
        ccMsg.value(lfoWaveform);
        out.send(ccMsg);
    }

    fun void lfoWaveform(float _lfoWaveform)
    {
        lfoWaveform(toCC(_lfoWaveform));
    }

    fun void ampDrive(int ampDrive)
    {
        ccMsg.number(AMP_DRIVE_CC);
        ccMsg.value(ampDrive);
        out.send(ccMsg);
    }

    fun void ampDrive(float _ampDrive)
    {
        ampDrive(toCC(_ampDrive));
    }

    fun void ampFeedback(int ampFeedback)
    {
        ccMsg.number(AMP_FEEDBACK_CC);
        ccMsg.value(ampFeedback);
        out.send(ccMsg);
    }

    fun void ampFeedback(float _ampFeedback)
    {
        ampFeedback(toCC(_ampFeedback));
    }

    fun void delayTime(int delayTime)
    {
        ccMsg.number(DELAY_TIME_CC);
        ccMsg.value(delayTime);
         out.send(ccMsg);
    }

    fun void delayTime(float _delayTime)
    {
        delayTime(toCC(_delayTime));
    }

    fun void delayTimeSync(int delayTimeSync)
    {
        ccMsg.number(DELAY_TIME_SYNC_CC);
        ccMsg.value(delayTimeSync);
        out.send(ccMsg);
    }

    fun void delayTimeSync(float _delayTimeSync)
    {
        delayTimeSync(toCC(_delayTimeSync));
    }

    fun void delayFeedback(int delayFeedback)
    {
        ccMsg.number(DELAY_FEEDBACK_CC);
        ccMsg.value(delayFeedback);
        out.send(ccMsg);
    }

    fun void delayFeedback(float _delayFeedback)
    {
        delayFeedback(toCC(_delayFeedback));
    }

    fun void delayMix(int delayMix)
    {
        ccMsg.number(DELAY_MIX_CC);
        ccMsg.value(delayMix);
        out.send(ccMsg);
    }

    fun void delayMix(float _delayMix)
    {
        delayMix(toCC(_delayMix));
    }

    fun void lineLevel(int lineLevel)
    {
        ccMsg.number(LINE_LEVEL_CC);
        ccMsg.value(lineLevel);
        out.send(ccMsg);
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
