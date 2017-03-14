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

/*

RBMA: What does your set-up look like? I assume it's quite different depending on
what group or what context you're in.

Stephen O'Malley: It used to be more so, but kind of on the point I just made,
it's kind of like you can change your tone with the same tools. It's like a
carpenter makes a lot of different things with his tools too. I use reverb, delay,
I love tape delays, and I have modded RAT pedals, and the most important thing in
my effects set-up is a switch that allows me to have four channels simultaneously
or individually, which has phase control on each channel so I can play several
amplifiers. The amplifiers don't have to be in phase with each other, or I can
tune the phase so they are all in phase and that makes an incredible difference
with tone, of course. That was a real game-changer, that piece of gear.

*/

// split mono in to four separate channels
dac => Gain pre;
pre => Gain in0;
pre => Gain in1;
pre => Gain in2;
pre => Gain in3;

// spread in stereo
Gain out0 => Pan2 pan0;
Gain out1 => Pan2 pan1;
Gain out2 => Pan2 pan2;
Gain out3 => Pan2 pan3;
0.0 => pan0.pan;
0.33 => pan1.pan;
0.66 => pan2.pan;
1.0 => pan3.pan;

// join to master gain
Gain master => dac;
pan0 => master;
pan1 => master;
pan2 => master;
pan3 => master;

class Phase extends Chugen
{
    0 => int _invert;

    fun float tick(float in)
    {
        if (_invert)
        {
            return -1 * in;
        }
        else
        {
            return in;
        }
    }

    fun int invert()
    {
        if (_invert)
        {
            0 => _invert;
        }
        else
        {
            1 => _invert;
        }
        return _invert;
    }
}

in0 => Phase phase0 => MonoDelay2 delay0 => Amp amp0 => Cabinet cabinet0 => GVerb gverb0 => out0;
in1 => Phase phase1 => MonoDelay2 delay1 => Amp amp1 => Cabinet cabinet1 => GVerb gverb1 => out1;
in2 => Phase phase2 => MonoDelay2 delay2 => Amp amp2 => Cabinet cabinet2 => GVerb gverb2 => out2;
in3 => Phase phase3 => MonoDelay2 delay3 => Amp amp3 => Cabinet cabinet3 => GVerb gverb3 => out3;

phase1.invert();
phase3.invert();

1.0 => delay0.mix;
0.0 => delay0.feedback;
2::ms => delay0.delay;

0.0 => delay1.mix;

0.0 => delay2.mix;

1.0 => delay3.mix;
0.0 => delay3.feedback;
4::ms => delay3.delay;

1.0 => amp0.bass;
0.1 => amp0.mid;
0.5 => amp0.treble;

0.7 => amp0.drive;
0.1 => amp0.bright;
0.6 => amp0.power;

"2x" => amp0.overName;
"stanford" => amp0.tonestackName;

1.0 => amp1.bass;
0.1 => amp1.mid;
0.5 => amp1.treble;

0.7 => amp1.drive;
0.1 => amp1.bright;
0.6 => amp1.power;

"2x" => amp1.overName;
"juice 800" => amp1.tonestackName;

1.0 => amp2.bass;
0.1 => amp2.mid;
0.5 => amp2.treble;

0.7 => amp2.drive;
0.1 => amp2.bright;
0.6 => amp2.power;

"2x" => amp2.overName;
"twin" => amp2.tonestackName;

1.0 => amp3.bass;
0.1 => amp3.mid;
0.5 => amp3.treble;

0.7 => amp3.drive;
0.1 => amp3.bright;
0.6 => amp3.power;

"2x" => amp3.overName;
"basswoman" => amp3.tonestackName;

"twin A" => cabinet0.modelName;

"sixty-one" => cabinet1.modelName;

"blue A" => cabinet2.modelName;

"tweedy A" => cabinet3.modelName;

0.96 => gverb0.dry;
0.02 => gverb0.early;
0.07 => gverb0.tail;
30.0 => gverb0.roomsize;

0.96 => gverb1.dry;
0.02 => gverb1.early;
0.07 => gverb1.tail;
30.0 => gverb1.roomsize;

0.96 => gverb2.dry;
0.02 => gverb2.early;
0.07 => gverb2.tail;
30.0 => gverb2.roomsize;

0.96 => gverb3.dry;
0.02 => gverb3.early;
0.07 => gverb3.tail;
30.0 => gverb3.roomsize;

<<<"ready">>>;
1::minute => now;
