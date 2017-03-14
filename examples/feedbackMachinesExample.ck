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

BeeThree bt;
bt.noteOff(1.0);

261.6256 => float c;
440.0 => float a;
Chords.majorThirteenth(c, "C") @=> Chord c_maj13;
Chords.minorEleventh(a, "A") @=> Chord a_min11;

<<<"fourMono, f=0.8">>>;
demo(FeedbackMachines.fourMono(0.8), c_maj13);

<<<"dualPingpong, f=0.8">>>;
demo(FeedbackMachines.dualPingpong(0.8), a_min11);

<<<"quadPingpong, f=0.9">>>;
demo(FeedbackMachines.quadPingpong(0.9), c_maj13);

<<<"quadNetwork, f=0.8">>>;
demo(FeedbackMachines.dualPingpong(0.8), a_min11);

<<<"12into34, f=0.8">>>;
demo(FeedbackMachines.oneTwoIntoThreeFour(0.8), c_maj13);

<<<"cascade, f=0.8">>>;
demo(FeedbackMachines.cascade(0.8), a_min11);

<<<"sink, f=0.8">>>;
demo(FeedbackMachines.sink(0.8), c_maj13);

<<<"lambda, f=0.7">>>;
demo(FeedbackMachines.lambda(0.7), a_min11);

<<<"diamond, f=0.7">>>;
demo(FeedbackMachines.diamond(0.7), c_maj13);


1::second => now;
<<<"done">>>;


fun void demo(FeedbackMachine fm, Chord c)
{
    1700::ms => fm.delay1.delay.max;
    1700::ms => fm.delay1.delay.delay;
    1300::ms => fm.delay2.delay.max;
    1300::ms => fm.delay2.delay.delay;
    1100::ms => fm.delay3.delay.max;
    1100::ms => fm.delay3.delay.delay;
    700::ms => fm.delay4.delay.max;
    700::ms => fm.delay4.delay.delay;

    bt => fm => dac;
    0.9 => fm.mix;

    500::ms => now;
    <<<c.symbol>>>;
    for (0 => int i; i < 10; i++)
    {
        <<<i>>>;
        bt.freq(c.sample());
        bt.noteOn(1.0);
        800::ms => now;
        bt.noteOff(1.0);
        800::ms => now;
    }
    12::second => now;

    bt =< fm;
    fm =< dac;
}
