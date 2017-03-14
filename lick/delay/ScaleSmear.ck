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

class ApplyFreq extends FloatProcedure
{
    ScaleSmear @ smear;

    fun void run(float f)
    {
        /*

             ChucK bug:

[ScaleSmear.ck]:line(29): class 'ScaleSmear' has no member 'freq'
[ScaleSmear.ck]: ...in function 'run'

             might be same problem as https://github.com/spencersalazar/chuck/issues/31

        */
        //smear.freq(f);
        smear._applyFreq(f);
    }
}

public class ScaleSmear extends Smear
{
    0 => int _index;
    Scale @ scale;

    fun float up()
    {
        Math.min(scale.intervals.size() - 1, _index + 1) $ int => _index;
        scale.intervals.get(_index) $ Interval @=> Interval interval;
        interval.evaluate(scale.root) => float f;
        return freq(f);
    }

    fun float down()
    {
        Math.max(0, _index - 1) $ int => _index;
        scale.intervals.get(_index) $ Interval @=> Interval interval;
        interval.evaluate(scale.root) => float f;
        return freq(f);
    }

    fun float root()
    {
        return freq(scale.root);
    }

    fun float random()
    {
        return freq(scale.sample());
    }

    fun void arp(Arpeggiator a)
    {
        ApplyFreq applyFreq;
        this @=> applyFreq.smear;
        applyFreq @=> a.procedure;        

        spork ~ a.run();
    }

    fun void arpUp(dur rate)
    {
        FloatProcedure noop;
        Arpeggiators.up(scale, noop) @=> Arpeggiator a;
        DurProvider.create(rate) @=> a.waitProvider;
        arp(a);
    }

    fun void arpDown(dur rate)
    {
        FloatProcedure noop;
        Arpeggiators.down(scale, noop) @=> Arpeggiator a;
        DurProvider.create(rate) @=> a.waitProvider;
        arp(a);
    }

    fun void arpUpDown(dur rate)
    {
        FloatProcedure noop;
        Arpeggiators.upDown(scale, noop) @=> Arpeggiator a;
        DurProvider.create(rate) @=> a.waitProvider;
        arp(a);
    }

    fun void arpDownUp(dur rate)
    {
        FloatProcedure noop;
        Arpeggiators.downUp(scale, noop) @=> Arpeggiator a;
        DurProvider.create(rate) @=> a.waitProvider;
        arp(a);
    }

    fun void arpRandom(dur rate)
    {
        FloatProcedure noop;
        Arpeggiators.random(scale, noop) @=> Arpeggiator a;
        DurProvider.create(rate) @=> a.waitProvider;
        arp(a);
    }

    fun float feedbackUp()
    {
        // use inverse feedback
        1.0 - feedback() => float f;
        Constrain.constrainf(f - (f / 10.0), 0.0, 1.0) => f;
        return feedback(1.0 - f);
    }

    fun float feedbackDown()
    {
        // use inverse feedback
        1.0 - feedback() => float f;
        Constrain.constrainf(f + (f / 10.0), 0.0, 1.0) => f;
        return feedback(1.0 - f);
    }

    fun float smearUp()
    {
        smear() => float s;
        Constrain.constrainf(s + (s / 10.0), 0.0, 1.0) => s;
        return smear(s);
    }

    fun float smearDown()
    {
        smear() => float s;
        Constrain.constrainf(s - (s / 10.0), 0.0, 1.0) => s;
        return smear(s);
    }

    // see bug above
    fun void _applyFreq(float f)
    {
        freq(f);
    }

    fun static ScaleSmear create(int z, float m, float d, Scale scale)
    {
        ScaleSmear smear;
        z => smear._size;
        smear.init();
        smear.freq(scale.root);
        smear.smear(m);
        smear.feedback(d);
        scale @=> smear.scale;

        return smear;
    }
}
