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

// emulates the Animoog iOS app
public class Animoog
{
    0 => static int OFF;
    64 => static int ON;
    0 => static int LP;
    1 * 41 => static int BP;
    2 * 41 => static int HP;
    0 => static int LOOPING;
    1 * 41 => static int BACK_FORTH;
    2 * 41 => static int ONCE;
    1 * 41 => static int TWO_VOICES;
    2 * 41 => static int FOUR_VOICES;
    0 => static int SINE;
    1 * 25 => static int RAMP;
    2 * 25 => static int SAWTOOTH;
    3 * 25 => static int SQUARE;
    4 * 25 => static int SAMPLE_AND_HOLD;

    SinOsc osc => ADSR adsr => dac;

    {
        0.8 => osc.gain;
        adsr.keyOff();
    }


    fun void open(int device)
    {
        <<<"open", device>>>;
    }

    // MIDI instrument API

    fun void noteOn(int note, int velocity)
    {
        <<<"note on", note, velocity>>>;
        freq(midi2freq(note));
        noteOn(midi2vel(velocity));
    }

    fun void noteOff(int note, int velocity)
    {
        <<<"note off", note, velocity>>>;
        freq(midi2freq(note));
        noteOff(midi2vel(velocity));
    }
    

    // StkInstrument-like API

    fun void noteOn(float velocity)
    {
        velocity => osc.gain;
        adsr.keyOn();
    }

    fun void noteOff(float velocity)
    {
        velocity => osc.gain;
        adsr.keyOff();
    }

    fun void freq(float freq)
    {
        freq => osc.freq;
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
        <<<"control change", "filter", filter>>>;
    }

    fun void filterDrive(int filterDrive)
    {
        <<<"control change", "filterDrive", filterDrive>>>;
    }

    fun void filterDrive(float _filterDrive)
    {
        filterDrive(toCC(_filterDrive));
    }

    fun void filterEnv(int filterEnv)
    {
        <<<"control change", "filterEnv", filterEnv>>>;
    }

    fun void filterEnv(float _filterEnv)
    {
        filterEnv(toCC(_filterEnv));
    }

    fun void filterFreq(int filterFreq)
    {
        <<<"control change", "filterFreq", filterFreq>>>;
    }

    fun void filterFreq(float _filterFreq)
    {
        filterFreq(toCC(_filterFreq));
    }

    fun void filterRes(int filterRes)
    {
        <<<"control change", "filterRes", filterRes>>>;
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
        <<<"control change", "orbitSync", orbitSync>>>;
    }

    fun void orbitRate(int orbitRate)
    {
        <<<"control change", "orbitRate", orbitRate>>>;
    }

    fun void orbitRate(float _orbitRate)
    {
        orbitRate(toCC(_orbitRate));
    }

    fun void orbitX(int orbitX)
    {
        <<<"control change", "orbitX", orbitX>>>;
    }

    fun void orbitX(float _orbitX)
    {
        orbitX(toCC(_orbitX));
    }

    fun void orbitY(int orbitY)
    {
        <<<"control change", "orbitY", orbitY>>>;
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
        <<<"control change", "pathSync", pathSync>>>;
    }

    fun void pathRate(int pathRate)
    {
        <<<"control change", "pathRate", pathRate>>>;
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
        <<<"control change", "pathMode", pathMode>>>;
    }

    fun void thickCrush(int thickCrush)
    {
        <<<"control change", "thickCrush", thickCrush>>>;
    }

    fun void thickCrush(float _thickCrush)
    {
        thickCrush(toCC(_thickCrush));
    }

    fun void thickDrive(int thickDrive)
    {
        <<<"control change", "thickDrive", thickDrive>>>;
    }

    fun void thickDrive(float _thickDrive)
    {
        thickDrive(toCC(_thickDrive));
    }

    fun void thickDetune(int thickDetune)
    {
        <<<"control change", "thickDetune", thickDetune>>>;
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
        <<<"control change", "thickUnison", thickUnison>>>;
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
        <<<"control change", "delaySync", delaySync>>>;
    }

    fun void delayTime(int delayTime)
    {
        <<<"control change", "delayTime", delayTime>>>;
    }

    fun void delayTime(float _delayTime)
    {
        delayTime(toCC(_delayTime));
    }

    fun void delayFeedback(int delayFeedback)
    {
        <<<"control change", "delayFeedback", delayFeedback>>>;
    }

    fun void delayFeedback(float _delayFeedback)
    {
        delayFeedback(toCC(_delayFeedback));
    }    

    fun void delayMix(int delayMix)
    {
        <<<"control change", "delayMix", delayMix>>>;
    }

    fun void delayMix(float _delayMix)
    {
        delayMix(toCC(_delayMix));
    }

    // note the scale for volume is from 0 to 10
    fun void volume(int volume)
    {
        <<<"control change", "volume", volume>>>;
    }

    fun void volume(float _volume)
    {
        volume(toCC(_volume));
    }

    // note the scale for cor is from 0 to 10 with off/on at 5
    fun void cor(int cor)
    {
        <<<"control change", "cor", cor>>>;
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
        <<<"control change", "glide", glide>>>;
    }

    fun void glide(float _glide)
    {
        glide(toCC(_glide));
    }

    fun void ampA(int ampA)
    {
        <<<"control change", "ampA", ampA>>>;
    }

    fun void ampA(float _ampA)
    {
        ampA(toCC(_ampA));
    }

    fun void ampD(int ampD)
    {
        <<<"control change", "ampD", ampD>>>;
    }

    fun void ampD(float _ampD)
    {
        ampD(toCC(_ampD));
    }

    fun void ampS(int ampS)
    {
        <<<"control change", "ampS", ampS>>>;
    }

    fun void ampS(float _ampS)
    {
        ampS(toCC(_ampS));
    }

    fun void ampR(int ampR)
    {
        <<<"control change", "ampR", ampR>>>;
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
        <<<"control change", "filterA", filterA>>>;
    }

    fun void filterA(float _filterA)
    {
        filterA(toCC(_filterA));
    }

    fun void filterD(int filterD)
    {
        <<<"control change", "filterD", filterD>>>;
    }

    fun void filterD(float _filterD)
    {
        filterD(toCC(_filterD));
    }

    fun void filterS(int filterS)
    {
        <<<"control change", "filterS", filterS>>>;
    }

    fun void filterS(float _filterS)
    {
        filterS(toCC(_filterS));
    }

    fun void filterR(int filterR)
    {
        <<<"control change", "filterR", filterR>>>;
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
        <<<"control change", "modA", modA>>>;
    }

    fun void modA(float _modA)
    {
        modA(toCC(_modA));
    }

    fun void modD(int modD)
    {
        <<<"control change", "modD", modD>>>;
    }

    fun void modD(float _modD)
    {
        modD(toCC(_modD));
    }

    fun void modS(int modS)
    {
        <<<"control change", "modS", modS>>>;
    }

    fun void modS(float _modS)
    {
        modS(toCC(_modS));
    }

    fun void modR(int modR)
    {
        <<<"control change", "modR", modR>>>;
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
        <<<"control change", "lfoSync", lfoSync>>>;
    }

    fun void lfoRate(int lfoRate)
    {
        <<<"control change", "lfoRate", lfoRate>>>;
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
        <<<"control change", "lfoShape", lfoShape>>>;
    }

    fun void lfoShape(float _lfoShape)
    {
        lfoShape(toCC(_lfoShape));
    }

    fun void originX(int originX)
    {
        <<<"control change", "originX", originX>>>;
    }

    fun void originX(float _originX)
    {
        originX(toCC(_originX));
    }

    fun void originY(int originY)
    {
        <<<"control change", "originY", originY>>>;
    }

    fun void originY(float _originY)
    {
        originY(toCC(_originY));
    }


    // utility methods

    fun float midi2freq(int n)
    {
        return Std.mtof(n);
    }

    fun float midi2vel(int v)
    {
        return (v / 127.0);
    }

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
