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

SinOsc osc0;
110.0 => osc0.freq;
0.6 => osc0.gain;
SinOsc osc1;
440.0 => osc1.freq;
0.2 => osc1.gain;
SinOsc osc2;
1100.0 => osc2.freq;
0.15 => osc2.gain;
SinOsc osc3;
4400.0 => osc3.freq;
0.05 => osc3.gain;

Gain in;
osc0 => in;
osc1 => in;
osc2 => in;
osc3 => in;

// stage 0, low freqs
in => LPF lpf0;
220.0 => lpf0.freq;

SinOsc lfo0;
0.3 => lfo0.freq;
0.8 => lfo0.gain;

SqrOsc lfo1;
1.0 => lfo1.freq;
0.2 => lfo1.gain;

Swirl stage0;
lpf0 => stage0.input;
lfo0 => stage0.cv;
lfo1 => stage0.cv;
stage0.outputL => dac.chan(0);
stage0.outputR => dac.chan(1);

// stage 1, middle freqs
in => LPF lpf1 => HPF hpf0;
2200.0 => lpf1.freq;
220.0 => hpf0.freq;

SinOsc lfo2;
0.3 => lfo2.freq;
0.8 => lfo2.gain;
0.3 => lfo2.phase;

SqrOsc lfo3;
1.0 => lfo3.freq;
0.2 => lfo3.gain;
0.3 => lfo3.phase;

Swirl stage1;
hpf0 => stage1.input;
lfo2 => stage1.cv;
lfo3 => stage1.cv;
stage1.outputL => dac.chan(0);
stage1.outputR => dac.chan(1);

// stage 2, high freqs
in => HPF hpf1;
1100.0 => hpf1.freq;

SinOsc lfo4;
0.3 => lfo4.freq;
0.8 => lfo4.gain;
0.6 => lfo4.phase;

SqrOsc lfo5;
1.0 => lfo5.freq;
0.2 => lfo5.gain;
0.6 => lfo5.phase;

Swirl stage2;
hpf1 => stage2.input;
lfo4 => stage2.cv;
lfo5 => stage2.cv;
stage2.outputL => dac.chan(0);
stage2.outputR => dac.chan(1);

60::second => now;
<<<"done">>>;
