//  idea: split input into multiple channels, detune/sharpen per LFOs

0.1 => float depth0;
0.1 => float depth1;
2.0 => float lfo0Rate;
3.0 => float lfo1Rate;

adc => Gain pre;
pre => Gain in0;
pre => Gain in1;
pre => Gain in2;

Gain out0 => Pan2 pan0;
Gain out1 => Pan2 pan1;
Gain out2 => Pan2 pan2;

0.0 => pan0.pan;
0.5 => pan1.pan;
1.0 => pan2.pan;

Gain master => dac;
pan0 => master;
pan1 => master;
pan2 => master;

in0 => PitShift pitchShift0 => out0;
in1 => out1;
in2 => PitShift pitchShift1 => out2;

SinOsc lfo0 => blackhole;
SinOsc lfo1 => blackhole;

0.5 => lfo1.phase;
lfo0Rate => lfo0.freq;
lfo1Rate => lfo1.freq;

fun void _runAtSampleRate()
{
    while (true)
    {
        //1::samp => now;
        100::ms => now;
        lfo0.last() * depth0 => pitchShift0.shift;
        lfo1.last() * depth1 => pitchShift1.shift;
        <<<pitchShift0.shift(), pitchShift1.shift()>>>;
    }
}

spork ~ _runAtSampleRate();

<<<"ready">>>;
1::minute => now;
