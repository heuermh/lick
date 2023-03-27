/*

    LiCK  Library for ChucK.
    Copyright (c) 2007-2023 held jointly by the individual authors.

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
// Deckard's Dream MK2/Yamaha CS80/etc.
// e.g. https://www.youtube.com/watch?v=jbmah2CPROo
//

class DreamVoice extends Chugraph
{
    PulseOsc pulse;
    SawOsc saw;
    Noise noise;
    Gain mixer;
    ADSR env;
    LPF lpf; // todo: HPF, RESH, LPF, RESL
    Step step;
    ADSR filterEnv;
    Lfo lfo;

    float _width;
    float _pwmRate;
    float _pwmRange;
    float _filterFreq;
    float _filterRange;

    pulse => mixer;
    saw => mixer;
    noise => mixer => lpf => env => outlet;
    step => filterEnv => blackhole;
    lfo => blackhole;

    {
        width(0.6);
        pwmRate(1.4);
        pwmRange(0.08);
        filterFreq(200.0);
        filterRange(6000.0);
        mix(0.5, 0.5, 0.0);

        1.0 => step.next;

        lfo.tri();

        env.set(300::ms, 100::ms, 0.8, 200::ms);
        filterEnv.set(600::ms, 100::ms, 0.6, 200::ms);

        spork ~ _updateAtSampleRate();
    }

    fun float width()
    {
        return _width;
    }

    fun float width(float f)
    {
        f => _width;
        return f;
    }

    fun float pwmRange()
    {
        return _pwmRange;
    }

    fun float pwmRange(float f)
    {
        f => _pwmRange;
        f => lfo.gain;
        return f;
    }

    fun float pwmRate()
    {
        return _pwmRate;
    }

    fun float pwmRate(float f)
    {
        f => _pwmRate;
        f => lfo.rate;
        return f;
    }

    fun float filterFreq()
    {
        return _filterFreq;
    }

    fun float filterFreq(float f)
    {
        f => _filterFreq;
        return f;
    }

    fun float filterRange()
    {
        return _filterRange;
    }

    fun float filterRange(float f)
    {
        f => _filterRange;
        return f;
    }

    fun void mix(float p, float s, float n)
    {
        p => pulse.gain;
        s => saw.gain;
        n => noise.gain;
    }

    fun void _updateAtSampleRate()
    {
        while (true)
        {
            1::samp => now;

            // update pulse width from lfo
            width() + lfo.last() => float w;
            w => pulse.width;
            w => saw.width;

            // update lfo freq from filterEnv
            filterFreq() + (filterEnv.last() * filterRange()) => lpf.freq;
        }
    }
}

class SubVoice extends Chugraph
{
    SinOsc sin;
    ADSR env;
    Lfo lfo;
    float _freq;

    sin => env => outlet;
    lfo => blackhole;

    {
        lfo.sin();
        0.10 => lfo.gain;
        0.20 => lfo.rate;

        env.set(400::ms, 100::ms, 0.8, 200::ms);

        spork ~ _updateAtSampleRate();
    }

    fun float freq()
    {
        return _freq;
    }

    fun float freq(float f)
    {
        f => _freq;
        return f;
    }

    fun void _updateAtSampleRate()
    {
        while (true)
        {
            1::samp => now;
            freq() + lfo.last() => sin.freq;
        }
    }
}

public class Dream extends Chugraph
{
    DreamVoice voice1;
    DreamVoice voice2;
    SubVoice sub;
    Gain mixer;

    float _freq;
    float _detune;

    voice1 => mixer;
    voice2 => mixer;
    sub => mixer => outlet;

    {
        freq(220.0);
        detune(-0.05);
        lfo(1.2, 1.3);
        mix(0.4, 0.4, 0.1, 0.0);
    }

    fun int keyOn(int i)
    {
        freq(Std.mtof(i));
        voice1.env.keyOn(i);
        voice1.filterEnv.keyOn(i);
        voice2.env.keyOn(i);
        voice2.filterEnv.keyOn(i);
        sub.env.keyOn(i);
        return i;
    }

    fun int keyOff(int i)
    {
        voice1.env.keyOff(i);
        voice1.filterEnv.keyOff(i);
        voice2.env.keyOff(i);
        voice2.filterEnv.keyOff(i);
        sub.env.keyOff(i);
        return i;
    }

    fun float freq()
    {
        return _freq;
    }

    fun float freq(float f)
    {
        f => _freq;
        f / 2.0 => sub.freq;
        f => voice1.pulse.freq;
        f => voice1.saw.freq;
        f + _detune => voice2.pulse.freq;
        f + _detune => voice2.saw.freq;
        return f;
    }

    fun float detune()
    {
        return _detune;
    }

    fun float detune(float f)
    {
        f => _detune;
        _freq + _detune => voice2.pulse.freq;
        _freq + _detune => voice2.saw.freq;
        return f;
    }

    fun void lfo(float r1, float r2)
    {
        r1 => voice1.lfo.rate;
        r2 => voice2.lfo.rate;
    }

    fun void mix(float v1, float v2, float s, float n)
    {
        v1 => voice1.gain;
        v2 => voice2.gain;
        s => sub.gain;

        (1.0 - n) / 2.0 => float g;
        voice1.mix(g, g, n);
        voice2.mix(g, g, n);
    }

    fun static Dream create()
    {
        Dream dream;
        return dream;
    }

    fun static Dream create(float voice1, float voice2, float sub, float noise, float detune, float lfoRate1, float lfoRate2)
    {
        Dream dream;
        dream.mix(voice1, voice2, sub, noise);
        dream.detune(detune);
        dream.lfo(lfoRate1, lfoRate2);
        return dream;
    }
}
