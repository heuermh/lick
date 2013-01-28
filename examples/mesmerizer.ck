/*

    LiCK  Library for ChucK.
    Copyright (c) 2007-2013 held jointly by the individual authors.

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
// inspired by the description accompanying the guitar effect pedal
//
// Catalinbread Pareidolia Harmonic Mesmerizer
// Buy one here:  http://www.catalinbread.com/PARE
//

//adc => Gain in;

SinOsc low => Gain in;
0.3 => low.gain;
220.0 => low.freq;

SinOsc high => in;
0.3 => high.gain;
440.0 => high.freq;

// your guitar signal is split into two
in => Gain stage0;
in => Gain stage1;

// one feeding a gain stage filtered to pass highs
stage0 => HPF hpf;
0.5 => float stage0Gain;
stage0Gain => stage0.gain;

// and the other filtered to pass lows
stage1 => LPF lpf;
0.5 => float stage1Gain;
stage1Gain => stage1.gain;

// these stages are tuned to share some common frequences so that when it modulates they have a nice swirly soup in the midrange.
330.0 => float filterFreq;
0.0 => float filterSpread;
//4400.0 => float filterFreq;
//2200.0 => float filterSpread;
filterFreq + filterSpread => lpf.freq;
filterFreq - filterSpread => hpf.freq;

// The amplitude (via bias) of each stage is modulated by a sinewave out of phase with the other. The result of this is as one
// stage’s volume is going down the other is going up. The fact that it is modulated by bias means the phase of each stage is
// modulated ever so slightly. The interaction of this slight phase shift on the shared midrange frequencies results in some
// interesting subtle frequency canceling while the amplitude goes up and down.
SinOsc lfo0 => blackhole;
SinOsc lfo1 => blackhole;

1 => lfo0.sync;
1 => lfo1.sync;

8.0 => float lfoFreq;
lfoFreq => lfo0.freq;
lfoFreq => lfo1.freq;
1.0 => float lfoDepth;
lfoDepth => lfo0.gain;
lfoDepth => lfo1.gain;

SinOsc phasorLfo0 => blackhole;
SinOsc phasorLfo1 => blackhole;

1.0 => float phasorLfoFreq;
phasorLfoFreq => phasorLfo0.freq;
phasorLfoFreq => phasorLfo1.freq;

0.00001 => float phasorLfoDepth;
phasorLfoDepth => phasorLfo0.gain;
phasorLfoDepth => phasorLfo1.gain;

class PhasorModule extends Module
{
    Phasor phasor => blackhole;

    fun float tick(float in, float cv)
    {
        phasor.phase() + cv => phasor.phase;
        return phasor.last();
    }
}

PhasorModule phasor0;
0.0 => phasor0.phasor.phase;
lfoFreq => phasor0.phasor.freq;
phasorLfo0 => phasor0._cv;

PhasorModule phasor1;
0.5 => phasor1.phasor.phase;
lfoFreq => phasor1.phasor.freq;
phasorLfo1 => phasor1._cv;

phasor0 => lfo0;
phasor1 => lfo1;

/*
Phasor phasor0;
0.0 => float phasor0Phase;
phasor0Phase => phasor0.phase;
lfoFreq => phasor0.freq;

Phasor phasor1;
0.5 => float phasor1Phase;
phasor1Phase => phasor1.phase;
lfoFreq => phasor1.freq;

phasor0 => lfo0;
phasor1 => lfo1;

-1.0 => float lfo0Phase;
1.0 => float lfo1Phase;

lfo0Phase => lfo0.phase;
lfo1Phase => lfo1.phase;

Step step0 => lfo0;
Step step1 => lfo1;

-1.0 => step0.next;
1.0 => step1.next;

Step step0 => SinOsc phaseLfo0;
Step step1 => SinOsc phaseLfo1;

0 => phaseLfo0.sync;
1 => phaseLfo1.sync;
0.0 => step0.next;
1.0 => step1.next;

0.02 => float phaseLfo0Depth;
0.02 => float phaseLfo1Depth;
1.0 => float phaseLfo0Rate;
1.0 => float phaseLfo1Rate;

phaseLfo0Depth => phaseLfo0.gain;
phaseLfo1Depth => phaseLfo1.gain;
phaseLfo0Rate => phaseLfo0.freq;
phaseLfo1Rate => phaseLfo1.freq;

phaseLfo0 => lfo0;
phaseLfo1 => lfo1;
*/

// ...now use lfo0 and lfo1 in a module to affect gain

class TremoloModule extends Module
{
    fun float tick(float in, float cv)
    {
        Interpolate.linear(cv, -1.0, 1.0, 0.0, 1.0) => gain;
        return in;
    }
}

TremoloModule trem0;
lfo0 => trem0._cv;

TremoloModule trem1;
lfo1 => trem1._cv;

in => Gain dry => dac;
Gain wet => dac;

lpf => trem0 => wet => dac;
hpf => trem1 => wet => dac;

// not running by default
1.0 => dry.gain;
0.0 => wet.gain;

//
// parameters available for tweaking:
//
// stage0Gain
// stage1Gain
// filterFreq
// filterSpread
// lfoFreq
// lfoDepth
// phasorLfoFreq
// phasorLfoDepth
// dry.gain
// wet.gain
//

class Toggle extends Procedure
{
    false => int running;

    fun void run()
    {
        if (running)
        {
            1.0 => dry.gain;
            0.0 => wet.gain;
            false => running;
        }
        else
        {
            0.0 => dry.gain;
            1.0 => wet.gain;
            true => running;
        }
        <<<"running", running>>>;
        <<<"lfo0 phase", lfo0.phase()>>>;
        <<<"lfo0 last", lfo0.last()>>>;
        <<<"lfo1 phase", lfo1.phase()>>>;
        <<<"lfo1 last", lfo1.last()>>>;
    }
}

class IncreaseLfoFreq extends Procedure
{
    fun void run()
    {
        lfoFreq * 1.1 => lfoFreq;
        lfoFreq => lfo0.freq;
        lfoFreq => lfo1.freq;
        lfoFreq => phasor0.phasor.freq;
        lfoFreq => phasor1.phasor.freq;
        <<<"lfoFreq", lfoFreq>>>;
    }
}

class DecreaseLfoFreq extends Procedure
{
    fun void run()
    {
        lfoFreq * 0.9 => lfoFreq;
        lfoFreq => lfo0.freq;
        lfoFreq => lfo1.freq;
        lfoFreq => phasor0.phasor.freq;
        lfoFreq => phasor1.phasor.freq;
        <<<"lfoFreq", lfoFreq>>>;
    }
}

class IncreasePhasorLfoFreq extends Procedure
{
    fun void run()
    {
        phasorLfoFreq * 1.1 => phasorLfoFreq;
        phasorLfoFreq => phasorLfo0.freq;
        phasorLfoFreq => phasorLfo1.freq;
        <<<"phasorLfoFreq", phasorLfoFreq>>>;
    }
}

class DecreasePhasorLfoFreq extends Procedure
{
    fun void run()
    {
        phasorLfoFreq * 0.9 => phasorLfoFreq;
        phasorLfoFreq => phasorLfo0.freq;
        phasorLfoFreq => phasorLfo1.freq;
        <<<"phasorLfoFreq", phasorLfoFreq>>>;
    }
}

Toggle toggle;
IncreaseLfoFreq increaseLfoFreq;
DecreaseLfoFreq decreaseLfoFreq;
IncreasePhasorLfoFreq increasePhasorLfoFreq;
DecreasePhasorLfoFreq decreasePhasorLfoFreq;

StompKeyboard stomp;
toggle @=> stomp.button0Down;
increaseLfoFreq @=> stomp.button1Down;
decreaseLfoFreq @=> stomp.button2Down;
increasePhasorLfoFreq @=> stomp.button3Down;
decreasePhasorLfoFreq @=> stomp.button4Down;

stomp.open(0);