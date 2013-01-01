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

// Delay examples that attempt to mimic the MFM2
//   http://www.u-he.com/mfm/manual/
//   http://www.u-he.com/downloads/MFM2/MFM2_User_Guide.pdf
//   todo:  these all need dry/wet control

// Single mono delay

/*
Delay delay;
Gain input;
Gain feedback;
Gain output;

200::ms => delay.max;
200::ms => delay.delay;
0.95 => feedback.gain;
0.80 => output.gain;

BeeThree bt;
bt.noteOff(1.0);

bt => input => delay;
//adc => input => delay;
delay => feedback => input;
delay => output => dac;
*/

// Single stereo delay

/*
Delay delayL;
Gain inputL;
Gain feedbackL;
Gain outputL;

200::ms => delayL.max;
200::ms => delayL.delay;
0.95 => feedbackL.gain;
0.80 => outputL.gain;

Delay delayR;
Gain inputR;
Gain feedbackR;
Gain outputR;

400::ms => delayR.max;
400::ms => delayR.delay;
0.95 => feedbackR.gain;
0.80 => outputR.gain;

BeeThree bt;
bt.noteOff(1.0);

Pan2 pan;
0.50 => pan.pan;

bt => inputL => delayL;
//adc.left => inputL => delayL;
delayL => feedbackL => inputL;
delayL => outputL => pan.left => dac.left;

bt => inputR => delayR;
//adc.right => inputR => delayR;
delayR => feedbackR => inputR;
delayR => outputR => pan.right => dac.right;
*/

// Four mono:  Four completely separate delays. The output of each delay is fed back into its own input.

/*
Delay delay1;
Gain input1;
Gain feedback1;
Gain output1;

200::ms => delay1.max;
200::ms => delay1.delay;
0.60 => feedback1.gain;
0.80 => output1.gain;

Delay delay2;
Gain input2;
Gain feedback2;
Gain output2;

220::ms => delay2.max;
220::ms => delay2.delay;
0.60 => feedback2.gain;
0.80 => output2.gain;

Delay delay3;
Gain input3;
Gain feedback3;
Gain output3;

400::ms => delay3.max;
400::ms => delay3.delay;
0.60 => feedback3.gain;
0.80 => output3.gain;

Delay delay4;
Gain input4;
Gain feedback4;
Gain output4;

420::ms => delay4.max;
420::ms => delay4.delay;
0.95 => feedback4.gain;
0.80 => output4.gain;

BeeThree bt;
bt.noteOff(1.0);

Gain inputMixer;
Gain outputMixer;

bt => inputMixer;
//adc => inputMixer;

inputMixer => input1 => delay1;
delay1 => feedback1 => input1;
delay1 => output1 => outputMixer;

inputMixer => input2 => delay2;
delay2 => feedback2 => input2;
delay2 => output2 => outputMixer;

inputMixer => input3 => delay3;
delay3 => feedback3 => input3;
delay3 => output3 => outputMixer;

inputMixer => input4 => delay4;
delay4 => feedback4 => input4;
delay4 => output4 => outputMixer;

0.8 => outputMixer.gain;
outputMixer => dac;
*/

// Four mono, stereo output

/*
Delay delay1;
Gain input1;
Gain feedback1;
Gain output1;
Pan2 pan1;

200::ms => delay1.max;
200::ms => delay1.delay;
0.60 => feedback1.gain;
0.80 => output1.gain;
-1.0 => pan1.pan;
//-0.80 => pan1.pan;

Delay delay2;
Gain input2;
Gain feedback2;
Gain output2;
Pan2 pan2;

220::ms => delay2.max;
220::ms => delay2.delay;
0.60 => feedback2.gain;
0.80 => output2.gain;
-1.0 => pan2.pan;
//-0.60 => pan2.pan;

Delay delay3;
Gain input3;
Gain feedback3;
Gain output3;
Pan2 pan3;

400::ms => delay3.max;
400::ms => delay3.delay;
0.60 => feedback3.gain;
0.80 => output3.gain;
1.0 => pan3.pan;
//0.60 => pan3.pan;

Delay delay4;
Gain input4;
Gain feedback4;
Gain output4;
Pan2 pan4;

420::ms => delay4.max;
420::ms => delay4.delay;
0.95 => feedback4.gain;
0.80 => output4.gain;
1.0 => pan4.pan;
//0.80 => pan4.pan;

BeeThree bt;
bt.noteOff(1.0);

Gain inputMixer;
Gain outputMixerL;
Gain outputMixerR;

bt => inputMixer;

inputMixer => input1 => delay1;
delay1 => feedback1 => input1;
delay1 => output1;
output1 => pan1.left;
output1 => pan1.right;
pan1.left => outputMixerL;
pan1.right => outputMixerR;

inputMixer => input2 => delay2;
delay2 => feedback2 => input2;
delay2 => output2;
output2 => pan2.left;
output2 => pan2.right;
pan2.left => outputMixerL;
pan2.right => outputMixerR;

inputMixer => input3 => delay3;
delay3 => feedback3 => input3;
delay3 => output3;
output3 => pan3.left;
output3 => pan3.right;
pan3.left => outputMixerL;
pan3.right => outputMixerR;

inputMixer => input4 => delay4;
delay4 => feedback4 => input4;
delay4 => output4;
output4 => pan4.left;
output4 => pan4.right;
pan4.left => outputMixerL;
pan4.right => outputMixerR;

0.8 => outputMixerL.gain;
0.8 => outputMixerR.gain;
outputMixerL => dac.left;
outputMixerR => dac.right;
*/

// Dual Pingpong: Two pairs of delays. The output of each delay is routed to the other member of the pair.

/*
Delay delay1;
Gain input1;
Gain feedback1;
Gain output1;

200::ms => delay1.max;
200::ms => delay1.delay;
0.60 => feedback1.gain;
0.80 => output1.gain;

Delay delay2;
Gain input2;
Gain feedback2;
Gain output2;

400::ms => delay2.max;
400::ms => delay2.delay;
0.80 => feedback2.gain;
0.80 => output2.gain;

Delay delay3;
Gain input3;
Gain feedback3;
Gain output3;

300::ms => delay3.max;
300::ms => delay3.delay;
0.60 => feedback3.gain;
0.80 => output3.gain;

Delay delay4;
Gain input4;
Gain feedback4;
Gain output4;

600::ms => delay4.max;
600::ms => delay4.delay;
0.80 => feedback4.gain;
0.80 => output4.gain;

BeeThree bt;
bt.noteOff(1.0);

Gain inputMixer;
Gain outputMixer;

bt => inputMixer;
//adc => inputMixer;

inputMixer => input1 => delay1;
delay1 => feedback2 => input2 => delay2;
delay2 => feedback1 => delay1;
delay1 => output1 => outputMixer;
delay2 => output2 => outputMixer;

inputMixer => input3 => delay3;
delay3 => feedback4 => input4 => delay4;
delay4 => feedback3 => delay3;
delay3 => output3 => outputMixer;
delay4 => output4 => outputMixer;

0.8 => outputMixer.gain;
outputMixer => dac;
*/

// Quad Pingpong: The signal is fed from one delay to the next. To make the most of this preset, set the
//   input of three of the delay lines to none.

/*
Delay delay1;
Gain input1;
Gain feedback1;
Gain output1;

200::ms => delay1.max;
200::ms => delay1.delay;
0.40 => feedback1.gain;
0.80 => output1.gain;

Delay delay2;
Gain input2;
Gain feedback2;
Gain output2;

400::ms => delay2.max;
400::ms => delay2.delay;
0.40 => feedback2.gain;
0.80 => output2.gain;

Delay delay3;
Gain input3;
Gain feedback3;
Gain output3;

300::ms => delay3.max;
300::ms => delay3.delay;
0.40 => feedback3.gain;
0.80 => output3.gain;

Delay delay4;
Gain input4;
Gain feedback4;
Gain output4;

600::ms => delay4.max;
600::ms => delay4.delay;
0.40 => feedback4.gain;
0.80 => output4.gain;

BeeThree bt;
bt.noteOff(1.0);

Gain inputMixer;
Gain outputMixer;

bt => inputMixer;
//adc => inputMixer;

inputMixer => input1 => delay1;
delay1 => feedback1 => delay1;
delay1 => input2 => delay2;
delay2 => feedback2 => delay2;
delay2 => input3 => delay3;
delay3 => feedback3 => delay3;
delay3 => input4 => delay4;
delay4 => feedback4 => delay4;
delay1 => output1 => outputMixer;
delay2 => output2 => outputMixer;
delay3 => output3 => outputMixer;
delay4 => output4 => outputMixer;

0.8 => outputMixer.gain;
outputMixer => dac;
*/

// Quad Permute: Like Quad Pingpong except that the signal is sent in both directions around the circle,
//   while the feedback is inverted in one of the directions. This is a very complex network which has been
//   used in classical reverb algorithms.

/*

  not sure what inverted feedback means

*/


// Quad Network: Every output is send to every other input -– feedback heaven! Use carefully e.g. for
//   atmospheric delays or dense reverbs.

/*

  out of control . . .

Delay delay1;
Gain input1;
Gain feedback1;
Gain output1;

200::ms => delay1.max;
200::ms => delay1.delay;
0.10 => feedback1.gain;
0.80 => output1.gain;

Delay delay2;
Gain input2;
Gain feedback2;
Gain output2;

400::ms => delay2.max;
400::ms => delay2.delay;
0.10 => feedback2.gain;
0.80 => output2.gain;

Delay delay3;
Gain input3;
Gain feedback3;
Gain output3;

300::ms => delay3.max;
300::ms => delay3.delay;
0.10 => feedback3.gain;
0.80 => output3.gain;

Delay delay4;
Gain input4;
Gain feedback4;
Gain output4;

600::ms => delay4.max;
600::ms => delay4.delay;
0.10 => feedback4.gain;
0.80 => output4.gain;

BeeThree bt;
0.1 => bt.gain;
bt.noteOff(1.0);

Gain inputMixer;
Gain outputMixer;

bt => inputMixer;
//adc => inputMixer;

inputMixer => input1 => delay1;
inputMixer => input2 => delay2;
inputMixer => input3 => delay3;
inputMixer => input4 => delay4;

delay1 => feedback1 => input1;
delay2 => feedback2 => input2;
delay3 => feedback3 => input3;
delay4 => feedback4 => input4;

delay1 => input2;
delay1 => input3;
delay1 => input4;

delay2 => input1;
delay2 => input3;
delay2 => input4;

delay3 => input1;
delay3 => input2;
delay3 => input4;

delay4 => input1;
delay4 => input2;
delay4 => input3;

delay1 => output1 => outputMixer;
delay2 => output2 => outputMixer;
delay3 => output3 => outputMixer;
delay4 => output4 => outputMixer;

0.8 => outputMixer.gain;
outputMixer => dac;
*/

// 12 into 34: The output of delay 1 is sent to delay 3, which is fed back into itself. Similar applies
//   for delays 2 and 4. This mode is great for dub rhythms e.g. using an initial 5/8 delay together
//   with 1/2 notes in the other taps.

/*
Delay delay1;
Gain input1;
Gain feedback1;
Gain output1;

1200::ms => delay1.max;
1200::ms => delay1.delay;
0.40 => feedback1.gain;
0.80 => output1.gain;

Delay delay2;
Gain input2;
Gain feedback2;
Gain output2;

1600::ms => delay2.max;
1600::ms => delay2.delay;
0.40 => feedback2.gain;
0.80 => output2.gain;

Delay delay3;
Gain input3;
Gain feedback3;
Gain output3;

200::ms => delay3.max;
200::ms => delay3.delay;
0.90 => feedback3.gain;
0.80 => output3.gain;

Delay delay4;
Gain input4;
Gain feedback4;
Gain output4;

300::ms => delay4.max;
300::ms => delay4.delay;
0.90 => feedback4.gain;
0.80 => output4.gain;

BeeThree bt;
bt.noteOff(1.0);

Gain inputMixer;
Gain outputMixer;

bt => inputMixer;
//adc => inputMixer;

inputMixer => input1 => delay1;
delay1 => feedback1 => input1;
delay1 => output1 => outputMixer;

delay1 => input3 => delay3;
delay3 => feedback3 => input3;
delay3 => output3 => outputMixer;

inputMixer => input2 => delay2;
delay2 => feedback2 => input2;
delay2 => output2 => outputMixer;

delay2 => input4 => delay4;
delay4 => feedback4 => input4;
delay4 => output4 => outputMixer;

0.8 => outputMixer.gain;
outputMixer => dac;
*/

// User matrix: In user mode you can specify how much of each delay is fed back to any delay.

Delay delay1;
Gain input1;
Gain feedback1;
Gain output1;

1200::ms => delay1.max;
1200::ms => delay1.delay;
0.40 => feedback1.gain;
0.80 => output1.gain;

Delay delay2;
Gain input2;
Gain feedback2;
Gain output2;

1600::ms => delay2.max;
1600::ms => delay2.delay;
0.40 => feedback2.gain;
0.80 => output2.gain;

Delay delay3;
Gain input3;
Gain feedback3;
Gain output3;

200::ms => delay3.max;
200::ms => delay3.delay;
0.90 => feedback3.gain;
0.80 => output3.gain;

Delay delay4;
Gain input4;
Gain feedback4;
Gain output4;

300::ms => delay4.max;
300::ms => delay4.delay;
0.90 => feedback4.gain;
0.80 => output4.gain;

BeeThree bt;
bt.noteOff(1.0);

Gain inputMixer;
Gain outputMixer;

bt => inputMixer;
//adc => inputMixer;

Gain route1to2;
Gain route1to3;
Gain route1to4;
Gain route2to1;
Gain route2to3;
Gain route2to4;
Gain route3to1;
Gain route3to2;
Gain route3to4;
Gain route4to1;
Gain route4to2;
Gain route4to3;

0.1 => route1to2.gain;
0.0 => route1to3.gain;
0.3 => route1to4.gain;
0.0 => route2to1.gain;
0.1 => route2to3.gain;
0.0 => route2to4.gain;
0.0 => route3to1.gain;
0.2 => route3to2.gain;
0.1 => route3to4.gain;
0.0 => route4to1.gain;
0.3 => route4to2.gain;
0.0 => route4to3.gain;

inputMixer => input1 => delay1;
inputMixer => input2 => delay2;
inputMixer => input3 => delay3;
inputMixer => input4 => delay4;

delay1 => feedback1 => input1;
delay2 => feedback2 => input2;
delay3 => feedback3 => input3;
delay4 => feedback4 => input4;

delay1 => route1to2 => input2;
delay1 => route1to3 => input3;
delay1 => route1to4 => input4;

delay2 => route2to1 => input1;
delay2 => route2to3 => input3;
delay2 => route2to4 => input4;

delay3 => route3to1 => input1;
delay3 => route3to2 => input2;
delay3 => route3to4 => input4;

delay4 => route4to1 => input1;
delay4 => route4to2 => input2;
delay4 => route4to3 => input3;

delay1 => output1 => outputMixer;
delay2 => output2 => outputMixer;
delay3 => output3 => outputMixer;
delay4 => output4 => outputMixer;

0.8 => outputMixer.gain;
outputMixer => dac;


500::ms => now;

for (0 => int i; i < 10; i++)
{
    <<<i>>>;
    bt.noteOn(1.0);
    800::ms => now;
    bt.noteOff(1.0);
    800::ms => now;
}

8::second => now;

<<<"done">>>;