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

// interacts with the Animoog iOS app over MIDI
public class AnimoogMidi
{
    // mapping
    0 => static int FILTER_CC;
    1 => static int FILTER_DRIVE_CC;
    2 => static int FILTER_ENV_CC;
    3 => static int FILTER_FREQ_CC;
    4 => static int FILTER_RES_CC;
    5 => static int ORBIT_SYNC_CC;
    6 => static int ORBIT_RATE_CC;
    7 => static int ORBIT_X_CC;
    8 => static int ORBIT_Y_CC;
    9 => static int PATH_SYNC_CC;
    10 => static int PATH_RATE_CC;
    11 => static int PATH_MODE_CC;
    12 => static int THICK_CRUSH_CC;
    13 => static int THICK_DRIVE_CC;
    14 => static int THICK_DETUNE_CC;
    15 => static int THICK_UNISON_CC;
    16 => static int DELAY_SYNC_CC;
    17 => static int DELAY_TIME_CC;
    18 => static int DELAY_FEEDBACK_CC;
    19 => static int DELAY_MIX_CC;
    20 => static int VOLUME_CC;
    21 => static int COR_CC;
    22 => static int GLIDE_CC;
    23 => static int AMP_A_CC;
    24 => static int AMP_D_CC;
    25 => static int AMP_S_CC;
    26 => static int AMP_R_CC;
    27 => static int FILTER_A_CC;
    28 => static int FILTER_D_CC;
    29 => static int FILTER_S_CC;
    30 => static int FILTER_R_CC;
    31 => static int MOD_A_CC;
    32 => static int MOD_D_CC;
    33 => static int MOD_S_CC;
    34 => static int MOD_R_CC;
    35 => static int LFO_SYNC_CC;
    36 => static int LFO_RATE_CC;
    37 => static int LFO_SHAPE_CC;
    38 => static int LFO_KB_TRIG_CC;
    39 => static int ORIGIN_X_CC;
    40 => static int ORIGIN_Y_CC;

    0 => static int OFF;
    64 => static int ON;
    0 => static int LP;
    1 * 41 => static int BP;
    2 * 41 => static int HP;
    0 => static int LOOPING;
    1 * 41 => static int BACK_FORTH;
    2 * 41 => static int ONCE;
    1 * 41 => static int TWO_VOICES;
    2 * 41=> static int FOUR_VOICES;
    0 => static int SINE;
    1 * 25 => static int RAMP;
    2 * 25 => static int SAWTOOTH;
    3 * 25 => static int SQUARE;
    4 * 25 => static int SAMPLE_AND_HOLD;

    MidiOut out;
    ControlChangeMidiMsg ccMsg;
    NoteOnMidiMsg noteOnMsg;
    NoteOffMidiMsg noteOffMsg;

    440.0 => float _freq;


    fun void open(int device)
    {
        out.open(device);
    }

    // MIDI instrument API

    fun void noteOn(int note, int velocity)
    {
        noteOnMsg.note(note);
        noteOnMsg.velocity(velocity);
        out.send(noteOnMsg);
    }

    fun void noteOff(int note, int velocity)
    {
        noteOffMsg.note(note);
        noteOffMsg.velocity(velocity);
        out.send(noteOffMsg);
    }
    

    // StkInstrument-like API

    fun void noteOn(float velocity)
    {
        noteOn(freq2midi(_freq), vel2midi(velocity));
    }

    fun void noteOff(float velocity)
    {
        noteOff(freq2midi(_freq), vel2midi(velocity));
    }

    fun void freq(float frequency)
    {
        frequency => _freq;
    }


    // controls

    fun void lpFilter()
    {
        filter(LP);
    }

    fun void bpFilter()
    {
        filter(BP);
    }

    fun void hpFilter()
    {
        filter(HP);
    }

    fun void filter(int filter)
    {
         ccMsg.number(FILTER_CC);
         ccMsg.value(filter);
         out.send(ccMsg);
    }

    fun void filterDrive(int filterDrive)
    {
         ccMsg.number(FILTER_DRIVE_CC);
         ccMsg.value(filterDrive);
         out.send(ccMsg);
    }

    fun void filterDrive(float _filterDrive)
    {
        filterDrive(toCC(_filterDrive));
    }

    fun void filterEnv(int filterEnv)
    {
         ccMsg.number(FILTER_ENV_CC);
         ccMsg.value(filterEnv);
         out.send(ccMsg);
    }

    fun void filterEnv(float _filterEnv)
    {
        filterEnv(toCC(_filterEnv));
    }

    fun void filterFreq(int filterFreq)
    {
         ccMsg.number(FILTER_FREQ_CC);
         ccMsg.value(filterFreq);
         out.send(ccMsg);
    }

    fun void filterFreq(float _filterFreq)
    {
        filterFreq(toCC(_filterFreq));
    }

    fun void filterRes(int filterRes)
    {
         ccMsg.number(FILTER_RES_CC);
         ccMsg.value(filterRes);
         out.send(ccMsg);
    }

    fun void filterRes(float _filterRes)
    {
        filterRes(toCC(_filterRes));
    }

    fun void orbitSyncOn()
    {
        orbitSync(ON);
    }

    fun void orbitSyncOff()
    {
        orbitSync(OFF);
    }

    fun void orbitSync(int orbitSync)
    {
         ccMsg.number(ORBIT_SYNC_CC);
         ccMsg.value(orbitSync);
         out.send(ccMsg);
    }

    fun void orbitRate(int orbitRate)
    {
         ccMsg.number(ORBIT_RATE_CC);
         ccMsg.value(orbitRate);
         out.send(ccMsg);
    }

    fun void orbitRate(float _orbitRate)
    {
        orbitRate(toCC(_orbitRate));
    }

    fun void orbitX(int orbitX)
    {
         ccMsg.number(ORBIT_X_CC);
         ccMsg.value(orbitX);
         out.send(ccMsg);
    }

    fun void orbitX(float _orbitX)
    {
        orbitX(toCC(_orbitX));
    }

    fun void orbitY(int orbitY)
    {
         ccMsg.number(ORBIT_Y_CC);
         ccMsg.value(orbitY);
         out.send(ccMsg);
    }

    fun void orbitY(float _orbitY)
    {
        orbitY(toCC(_orbitY));
    }

    fun void pathSyncOn()
    {
        pathSync(ON);
    }

    fun void pathSyncOff()
    {
        pathSync(OFF);
    }

    fun void pathSync(int pathSync)
    {
         ccMsg.number(PATH_SYNC_CC);
         ccMsg.value(pathSync);
         out.send(ccMsg);
    }

    fun void pathRate(int pathRate)
    {
         ccMsg.number(PATH_RATE_CC);
         ccMsg.value(pathRate);
         out.send(ccMsg);
    }

    fun void pathRate(float _pathRate)
    {
        pathRate(toCC(_pathRate));
    }

    fun void loopingPathMode()
    {
        pathMode(LOOPING);
    }

    fun void backForthPathMode()
    {
        pathMode(BACK_FORTH);
    }

    fun void oncePathMode()
    {
        pathMode(ONCE);
    }

    fun void pathMode(int pathMode)
    {
         ccMsg.number(PATH_MODE_CC);
         ccMsg.value(pathMode);
         out.send(ccMsg);
    }

    fun void thickCrush(int thickCrush)
    {
         ccMsg.number(THICK_CRUSH_CC);
         ccMsg.value(thickCrush);
         out.send(ccMsg);
    }

    fun void thickCrush(float _thickCrush)
    {
        thickCrush(toCC(_thickCrush));
    }

    fun void thickDrive(int thickDrive)
    {
         ccMsg.number(THICK_DRIVE_CC);
         ccMsg.value(thickDrive);
         out.send(ccMsg);
    }

    fun void thickDrive(float _thickDrive)
    {
        thickDrive(toCC(_thickDrive));
    }

    fun void thickDetune(int thickDetune)
    {
         ccMsg.number(THICK_DETUNE_CC);
         ccMsg.value(thickDetune);
         out.send(ccMsg);
    }

    fun void thickDetune(float _thickDetune)
    {
        thickDetune(toCC(_thickDetune));
    }

    fun void thickUnisonOff()
    {
        thickUnison(OFF);
    }

    fun void thickUnison2()
    {
        thickUnison(TWO_VOICES);
    }

    fun void thickUnison4()
    {
        thickUnison(FOUR_VOICES);
    }

    fun void thickUnison(int thickUnison)
    {
         ccMsg.number(THICK_UNISON_CC);
         ccMsg.value(thickUnison);
         out.send(ccMsg);
    }

    fun void delaySyncOn()
    {
        delaySync(ON);
    }

    fun void delaySyncOff()
    {
        delaySync(OFF);
    }

    fun void delaySync(int delaySync)
    {
         ccMsg.number(DELAY_SYNC_CC);
         ccMsg.value(delaySync);
         out.send(ccMsg);
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

    // note the scale for volume is from 0 to 10
    fun void volume(int volume)
    {
         ccMsg.number(VOLUME_CC);
         ccMsg.value(volume);
         out.send(ccMsg);
    }

    fun void volume(float _volume)
    {
        volume(toCC(_volume));
    }

    // note the scale for cor is from 0 to 10 with off/on at 5
    fun void cor(int cor)
    {
         ccMsg.number(COR_CC);
         ccMsg.value(cor);
         out.send(ccMsg);
    }

    fun void cor(float _cor)
    {
        cor(toCC(_cor));
    }

    fun void keyPitchCorrection(int keyPitchCorrection)
    {
        cor(keyPitchCorrection);
    }

    fun void keyPitchCorrection(float _keyPitchCorrection)
    {
        cor(_keyPitchCorrection);
    }

    // note the scale for glide is from 0 to 10 with off/on at 5
    fun void glide(int glide)
    {
         ccMsg.number(GLIDE_CC);
         ccMsg.value(glide);
         out.send(ccMsg);
    }

    fun void glide(float _glide)
    {
        glide(toCC(_glide));
    }

    fun void ampA(int ampA)
    {
         ccMsg.number(AMP_A_CC);
         ccMsg.value(ampA);
         out.send(ccMsg);
    }

    fun void ampA(float _ampA)
    {
        ampA(toCC(_ampA));
    }

    fun void ampD(int ampD)
    {
         ccMsg.number(AMP_D_CC);
         ccMsg.value(ampD);
         out.send(ccMsg);
    }

    fun void ampD(float _ampD)
    {
        ampD(toCC(_ampD));
    }

    fun void ampS(int ampS)
    {
         ccMsg.number(AMP_S_CC);
         ccMsg.value(ampS);
         out.send(ccMsg);
    }

    fun void ampS(float _ampS)
    {
        ampS(toCC(_ampS));
    }

    fun void ampR(int ampR)
    {
         ccMsg.number(AMP_R_CC);
         ccMsg.value(ampR);
         out.send(ccMsg);
    }

    fun void ampR(float _ampR)
    {
        ampR(toCC(_ampR));
    }

    fun void ampADSR(int _ampA, int _ampD, int _ampS, int _ampR)
    {
        ampA(_ampA);
        ampD(_ampD);
        ampS(_ampS);
        ampR(_ampR);
    }

    fun void ampADSR(float _ampA, float _ampD, float _ampS, float _ampR)
    {
        ampA(_ampA);
        ampD(_ampD);
        ampS(_ampS);
        ampR(_ampR);
    }

    fun void filterA(int filterA)
    {
         ccMsg.number(FILTER_A_CC);
         ccMsg.value(filterA);
         out.send(ccMsg);
    }

    fun void filterA(float _filterA)
    {
        filterA(toCC(_filterA));
    }

    fun void filterD(int filterD)
    {
         ccMsg.number(FILTER_D_CC);
         ccMsg.value(filterD);
         out.send(ccMsg);
    }

    fun void filterD(float _filterD)
    {
        filterD(toCC(_filterD));
    }

    fun void filterS(int filterS)
    {
         ccMsg.number(FILTER_S_CC);
         ccMsg.value(filterS);
         out.send(ccMsg);
    }

    fun void filterS(float _filterS)
    {
        filterS(toCC(_filterS));
    }

    fun void filterR(int filterR)
    {
         ccMsg.number(FILTER_R_CC);
         ccMsg.value(filterR);
         out.send(ccMsg);
    }

    fun void filterR(float _filterR)
    {
        filterR(toCC(_filterR));
    }

    fun void filterADSR(int _filterA, int _filterD, int _filterS, int _filterR)
    {
        filterA(_filterA);
        filterD(_filterD);
        filterS(_filterS);
        filterR(_filterR);
    }

    fun void filterADSR(float _filterA, float _filterD, float _filterS, float _filterR)
    {
        filterA(_filterA);
        filterD(_filterD);
        filterS(_filterS);
        filterR(_filterR);
    }

    fun void modA(int modA)
    {
         ccMsg.number(MOD_A_CC);
         ccMsg.value(modA);
         out.send(ccMsg);
    }

    fun void modA(float _modA)
    {
        modA(toCC(_modA));
    }

    fun void modD(int modD)
    {
         ccMsg.number(MOD_D_CC);
         ccMsg.value(modD);
         out.send(ccMsg);
    }

    fun void modD(float _modD)
    {
        modD(toCC(_modD));
    }

    fun void modS(int modS)
    {
         ccMsg.number(MOD_S_CC);
         ccMsg.value(modS);
         out.send(ccMsg);
    }

    fun void modS(float _modS)
    {
        modS(toCC(_modS));
    }

    fun void modR(int modR)
    {
         ccMsg.number(MOD_R_CC);
         ccMsg.value(modR);
         out.send(ccMsg);
    }

    fun void modR(float _modR)
    {
        modR(toCC(_modR));
    }

    fun void modADSR(int _modA, int _modD, int _modS, int _modR)
    {
        modA(_modA);
        modD(_modD);
        modS(_modS);
        modR(_modR);
    }

    fun void modADSR(float _modA, float _modD, float _modS, float _modR)
    {
        modA(_modA);
        modD(_modD);
        modS(_modS);
        modR(_modR);
    }

    fun void lfoSyncOn()
    {
        lfoSync(ON);
    }

    fun void lfoSyncOff()
    {
        lfoSync(OFF);
    }

    fun void lfoSync(int lfoSync)
    {
         ccMsg.number(LFO_SYNC_CC);
         ccMsg.value(lfoSync);
         out.send(ccMsg);
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

    fun void lfoShapeSine()
    {
        lfoShape(SINE);
    }

    fun void lfoShapeRamp()
    {
        lfoShape(RAMP);
    }

    fun void lfoShapeSawtooth()
    {
        lfoShape(SAWTOOTH);
    }

    fun void lfoShapeSquare()
    {
        lfoShape(SQUARE);
    }

    fun void lfoShapeSampleAndHold()
    {
        lfoShape(SAMPLE_AND_HOLD);
    }

    fun void lfoShape(int lfoShape)
    {
         ccMsg.number(LFO_SHAPE_CC);
         ccMsg.value(lfoShape);
         out.send(ccMsg);
    }

    fun void lfoShape(float _lfoShape)
    {
        lfoShape(toCC(_lfoShape));
    }

    fun void lfoKeyTriggerOn()
    {
        lfoKeyTrigger(ON);
    }

    fun void lfoKeyTriggerOff()
    {
        lfoKeyTrigger(OFF);
    }

    fun void lfoKeyTrigger(int keyTrigger)
    {
         ccMsg.number(LFO_KB_TRIG_CC);
         ccMsg.value(keyTrigger);
         out.send(ccMsg);
    }

    fun void originX(int originX)
    {
         ccMsg.number(ORIGIN_X_CC);
         ccMsg.value(originX);
         out.send(ccMsg);
    }

    fun void originX(float _originX)
    {
        originX(toCC(_originX));
    }

    fun void originY(int originY)
    {
         ccMsg.number(ORIGIN_Y_CC);
         ccMsg.value(originY);
         out.send(ccMsg);        
    }

    fun void originY(float _originY)
    {
        originY(toCC(_originY));
    }


    // utility methods

    fun int freq2midi(float f)
    {
        return Std.ftom(f) $ int;
    }

    fun int vel2midi(float v)
    {
        if (v < 0.0)
        {
            return 0;
        }
        if (v > 1.0)
        {
            return 127;
        }
        return (v * 127.0) $ int;
    }

    fun int toCC(float value)
    {
        if (value < 0.0)
        {
            return 0;
        }
        if (value > 1.0)
        {
            return 121;
        }
        return (value * 121.0) $ int;
    }
}
