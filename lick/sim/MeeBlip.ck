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

// emulates a MeeBlip micro
public class MeeBlip
{
    SinOsc osc => ADSR adsr => dac;

    {
        0.8 => osc.gain;
        adsr.keyOff();
    }


    fun int open(int device)
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


    // switches

    fun void fmOff()
    {
        fm(0);
    }

    fun void fmOn()
    {
        fm(64);
    }

    fun void fm(int fm)
    {
        <<<"control change", 65, fm>>>;
    }

    fun void lfoRandomOff()
    {
        lfoRandom(0);
    }

    fun void lfoRandomOn()
    {
        lfoRandom(64);
    }

    fun void lfoRandom(int lfoRandom)
    {
        <<<"control change", 66, lfoRandom>>>;
    }

    fun void lfoTriangleWave()
    {
        lfoWave(0);
    }

    fun void lfoSquareWave()
    {
        lfoWave(64);
    }

    fun void lfoWave(int lfoWave)
    {
        <<<"control change", 67, lfoWave>>>;
    }

    fun void filterModeLow()
    {
        filterMode(0);
    }

    fun void filterModeHigh()
    {
        filterMode(64);
    }

    fun void filterMode(int filterMode)
    {
        <<<"control change", 68, filterMode>>>;
    }

    fun void distortionOff()
    {
        distortion(0);
    }

    fun void distortionOn()
    {
        distortion(64);
    }

    fun void distortion(int distortion)
    {
        <<<"control change", 69, distortion>>>;
    }

    fun void lfoOff()
    {
        lfo(0);
    }

    fun void lfoOn()
    {
        lfo(64);
    }

    fun void lfo(int lfo)
    {
        <<<"control change", 70, lfo>>>;
    }

    fun void lfoDestinationFilter()
    {
        lfoDestination(0);
    }

    fun void lfoDestinationOscillator()
    {
        lfoDestination(64);
    }

    fun void lfoDestination(int lfoDestination)
    {
        <<<"control change", 71, lfoDestination>>>;
    }

    fun void antiAliasOff()
    {
        antiAlias(0);
    }

    fun void antiAliasOn()
    {
        antiAlias(64);
    }

    fun void antiAlias(int antiAlias)
    {
        <<<"control change", 72, antiAlias>>>;
    }

    fun void oscBOctaveNormal()
    {
        oscBOctave(0);
    }

    fun void oscBOctaveUp()
    {
        oscBOctave(64);
    }

    fun void oscBOctave(int oscBOctave)
    {
        <<<"control change", 73, oscBOctave>>>;
    }

    fun void oscBOff()
    {
        oscB(0);
    }

    fun void oscBOn()
    {
        oscB(64);
    }

    fun void oscB(int oscB)
    {
        <<<"control change", 74, oscB>>>;
    }

    fun void oscBTriangleWave()
    {
        oscBWave(0);
    }

    fun void oscBSquareWave()
    {
        oscBWave(64);
    }

    fun void oscBWave(int oscBWave)
    {
        <<<"control change", 75, oscBWave>>>;
    }

    fun void envelopeSustainOff()
    {
        envelopeSustain(0);
    }

    fun void envelopeSustainOn()
    {
        envelopeSustain(64);
    }

    fun void envelopeSustain(int envelopeSustain)
    {
        <<<"control change", 76, envelopeSustain>>>;
    }

    fun void oscANoiseOff()
    {
        oscANoise(0);
    }

    fun void oscANoiseOn()
    {
        oscANoise(64);
    }

    fun void oscANoise(int oscANoise)
    {
        <<<"control change", 77, oscANoise>>>;
    }

    fun void pwmSweepPulse()
    {
        pwmSweep(0);
    }

    fun void pwmSweepPwm()
    {
        pwmSweep(64);
    }

    fun void pwmSweep(int pwmSweep)
    {
        <<<"control change", 78, pwmSweep>>>;
    }

    fun void oscASawtoothWave()
    {
        oscAWave(0);
    }

    fun void oscAPwmWave()
    {
        oscAWave(64);
    }

    fun void oscAWave(int oscAWave)
    {
        <<<"control change", 79, oscAWave>>>;
    }

    // knobs

    fun void filterResonance(int filterResonance)
    {    
        <<<"control change", 48, filterResonance>>>;
    }

    fun void filterResonance(float _filterResonance)
    {
        filterResonance(toCC(_filterResonance));
    }

    fun void filterCutoff(int filterCutoff)
    {
        <<<"control change", 48, filterCutoff>>>;
    }

    fun void filterCutoff(float _filterCutoff)
    {
        filterCutoff(toCC(_filterCutoff));
    }

    fun void lfoFreq(int lfoFreq)
    {
        <<<"control change", 50, lfoFreq>>>;
    }

    fun void lfoFreq(float _lfoFreq)
    {
        lfoFreq(toCC(_lfoFreq));
    }

    fun void lfoLevel(int lfoLevel)
    {
        <<<"control change", 51, lfoLevel>>>;
    }

    fun void lfoLevel(float _lfoLevel)
    {
        lfoLevel(toCC(_lfoLevel));
    }

    fun void filterEnvelope(int filterEnvelope)
    {
        <<<"control change", 52, filterEnvelope>>>;
    }

    fun void filterEnvelope(float _filterEnvelope)
    {
        filterEnvelope(toCC(_filterEnvelope));
    }

    fun void portamento(int portamento)
    {
        <<<"control change", 53, portamento>>>;
    }

    fun void portamento(float _portamento)
    {
        portamento(toCC(_portamento));
    }

    fun void pulseWidthRate(int pulseWidthRate)
    {
        <<<"control change", 54, pulseWidthRate>>>;
    }

    fun void pulseWidthRate(float _pulseWidthRate)
    {
        pulseWidthRate(toCC(_pulseWidthRate));
    }

    fun void pwmRate(int pwmRate)
    {
        <<<"control change", 55, pwmRate>>>;
    }

    fun void pwmRate(float _pwmRate)
    {
        pwmRate(toCC(_pwmRate));
    }

    fun void oscDetune(int oscDetune)
    {
        <<<"control change", 56, oscDetune>>>;
    }

    fun void oscDetune(float _oscDetune)
    {
        oscDetune(toCC(_oscDetune));
    }

    fun void filterDecay(int filterDecay)
    {
        <<<"control change", 58, filterDecay>>>;
    }

    fun void filterDecay(float _filterDecay)
    {
        filterDecay(toCC(_filterDecay));
    }

    fun void filterAttack(int filterAttack)
    {
        <<<"control change", 59, filterAttack>>>;
    }

    fun void filterAttack(float _filterAttack)
    {
        filterAttack(toCC(_filterAttack));
    }

    fun void ampDecay(int ampDecay)
    {
        <<<"control change", 60, ampDecay>>>;
    }

    fun void ampDecay(float _ampDecay)
    {
        ampDecay(toCC(_ampDecay));
    }

    fun void ampAttack(int ampAttack)
    {
        <<<"control change", 61, ampAttack>>>;
    }

    fun void ampAttack(float _ampAttack)
    {
        ampAttack(toCC(_ampAttack));
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
