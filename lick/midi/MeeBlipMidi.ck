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

// interacts with a MeeBlip micro over MIDI
public class MeeBlipMidi
{
    MidiOut out;
    ControlChangeMidiMsg ccMsg;
    NoteOnMidiMsg noteOnMsg;
    NoteOffMidiMsg noteOffMsg;

    440.0 => float _freq;


    fun int open(int device)
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


    // switches

    /*

CC 64: Knob Shift
CC 65: FM off/on
CC 66: LFO Random (off/on)
CC 67: LFO Wave (Triangle/Square)
CC 68: Filter Mode (Low/High)
CC 69: Distortion (off/on)
CC 70: LFO Enable (off/on)
CC 71: LFO Destination (Filter/Oscillator)
CC 72: Anti Alias (off/on)
CC 73: Oscillator B Octave (Normal/Up)
CC 74: Oscillator B Enable
CC 75: Oscillator B Wave (Triangle/Square)
CC 76: Envelope Sustain (off/on)
CC 77: Oscillator A Noise (off/on)
CC 78: PWM Sweep (Pulse/PWM)
CC 79: Oscillator A Wave (Sawtooth/PWM)

A switch is off if its value is between 0-63, on if it’s 64 or higher.

http://meeblip.com/use-one/micro-kit-assembly/

    */

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
        ccMsg.number(65);
        ccMsg.value(fm);
        out.send(ccMsg);
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
        ccMsg.number(66);
        ccMsg.value(lfoRandom);
        out.send(ccMsg);
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
        ccMsg.number(67);
        ccMsg.value(lfoWave);
        out.send(ccMsg);
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
        ccMsg.number(68);
        ccMsg.value(filterMode);
        out.send(ccMsg);
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
        ccMsg.number(69);
        ccMsg.value(distortion);
        out.send(ccMsg);
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
        ccMsg.number(70);
        ccMsg.value(lfo);
        out.send(ccMsg);
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
        ccMsg.number(71);
        ccMsg.value(lfoDestination);
        out.send(ccMsg);
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
        ccMsg.number(72);
        ccMsg.value(antiAlias);
        out.send(ccMsg);
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
        ccMsg.number(73);
        ccMsg.value(oscBOctave);
        out.send(ccMsg);
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
        ccMsg.number(74);
        ccMsg.value(oscB);
        out.send(ccMsg);
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
        ccMsg.number(75);
        ccMsg.value(oscBWave);
        out.send(ccMsg);
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
        ccMsg.number(76);
        ccMsg.value(envelopeSustain);
        out.send(ccMsg);
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
        ccMsg.number(77);
        ccMsg.value(oscANoise);
        out.send(ccMsg);
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
        ccMsg.number(78);
        ccMsg.value(pwmSweep);
        out.send(ccMsg);
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
        ccMsg.number(79);
        ccMsg.value(oscAWave);
        out.send(ccMsg);
    }

/*

CC 48: Filter Resonance
CC 49: Filter Cutoff
CC 50: LFO Frequency
CC 51: LFO Level
CC 52: Filter Envelope Amount
CC 53: Portamento
CC 54: Pulse Width/PWM Rate
CC 55: Oscillator Detune
CC 58: Filter Decay
CC 59: Filter Attack
CC 60: Amplitude Decay
CC 61: Amplitude Attack

http://meeblip.com/use-one/micro-kit-assembly/

*/

    // knobs

    fun void filterResonance(int filterResonance)
    {
        ccMsg.number(48);
        ccMsg.value(filterResonance);
        out.send(ccMsg);
    }

    fun void filterResonance(float _filterResonance)
    {
        filterResonance(toCC(_filterResonance));
    }

    fun void filterCutoff(int filterCutoff)
    {
        ccMsg.number(49);
        ccMsg.value(filterCutoff);
        out.send(ccMsg);
    }

    fun void filterCutoff(float _filterCutoff)
    {
        filterCutoff(toCC(_filterCutoff));
    }

    fun void lfoFreq(int lfoFreq)
    {
        ccMsg.number(50);
        ccMsg.value(lfoFreq);
        out.send(ccMsg);
    }

    fun void lfoFreq(float _lfoFreq)
    {
        lfoFreq(toCC(_lfoFreq));
    }

    fun void lfoLevel(int lfoLevel)
    {
        ccMsg.number(51);
        ccMsg.value(lfoLevel);
        out.send(ccMsg);
    }

    fun void lfoLevel(float _lfoLevel)
    {
        lfoLevel(toCC(_lfoLevel));
    }

    fun void filterEnvelope(int filterEnvelope)
    {
        ccMsg.number(52);
        ccMsg.value(filterEnvelope);
        out.send(ccMsg);
    }

    fun void filterEnvelope(float _filterEnvelope)
    {
        filterEnvelope(toCC(_filterEnvelope));
    }

    fun void portamento(int portamento)
    {
        ccMsg.number(53);
        ccMsg.value(portamento);
        out.send(ccMsg);
    }

    fun void portamento(float _portamento)
    {
        portamento(toCC(_portamento));
    }

    fun void pulseWidthRate(int pulseWidthRate)
    {
        ccMsg.number(54);
        ccMsg.value(pulseWidthRate);
        out.send(ccMsg);
    }

    fun void pulseWidthRate(float _pulseWidthRate)
    {
        pulseWidthRate(toCC(_pulseWidthRate));
    }

    fun void pwmRate(int pwmRate)
    {
        ccMsg.number(54);
        ccMsg.value(pwmRate);
        out.send(ccMsg);
    }

    fun void pwmRate(float _pwmRate)
    {
        pwmRate(toCC(_pwmRate));
    }

    fun void oscDetune(int oscDetune)
    {
        ccMsg.number(55);
        ccMsg.value(oscDetune);
        out.send(ccMsg);
    }

    fun void oscDetune(float _oscDetune)
    {
        oscDetune(toCC(_oscDetune));
    }

    fun void filterDecay(int filterDecay)
    {
        ccMsg.number(58);
        ccMsg.value(filterDecay);
        out.send(ccMsg);
    }

    fun void filterDecay(float _filterDecay)
    {
        filterDecay(toCC(_filterDecay));
    }

    fun void filterAttack(int filterAttack)
    {
        ccMsg.number(59);
        ccMsg.value(filterAttack);
        out.send(ccMsg);
    }

    fun void filterAttack(float _filterAttack)
    {
        filterAttack(toCC(_filterAttack));
    }

    fun void ampDecay(int ampDecay)
    {
        ccMsg.number(60);
        ccMsg.value(ampDecay);
        out.send(ccMsg);
    }

    fun void ampDecay(float _ampDecay)
    {
        ampDecay(toCC(_ampDecay));
    }

    fun void ampAttack(int ampAttack)
    {
        ccMsg.number(61);
        ccMsg.value(ampAttack);
        out.send(ccMsg);
    }

    fun void ampAttack(float _ampAttack)
    {
        ampAttack(toCC(_ampAttack));
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
