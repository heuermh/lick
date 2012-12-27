/*

    LiCK  Library for ChucK.
    Copyright (c) 2007-2012 held jointly by the individual authors.

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

public class Smear
{
    Gain input;
    Gain dry;
    Gain wet;

    8 => int size;
    ArrayList delays;

    // running by default, after init() is called
    true => int running;

    20.0 => float _freq;
    0.8 => float _smear;

    {
        input => dry;
    }

    fun void panic()
    {
        feedback(0.0);
    }

    // need to call this after ctr
    fun void init()
    {
        for (0 => int i; i < size; i++)
        {
            MonoDelay delay;
            1::second => delay.delay.max;
            input => delay.input;
            delay.output => wet;

            delays.add(delay);
        }
    }

    fun void feedback(float f)
    {
        delays.iterator() @=> Iterator iterator;
        while (iterator.hasNext())
        {
            iterator.next() $ MonoDelay @=> MonoDelay delay;
            f => delay.feedback.gain;
        }
    }

    fun float freq(float f)
    {
        f => _freq;
        delays.iterator() @=> Iterator iterator;
        while (iterator.hasNext())
        {
            iterator.next() $ MonoDelay @=> MonoDelay delay;
            Math.random2f((f / 10.0), (-f / 10.0)) => float variation;
            f + variation => float delayFreq;
            (1.0 / delayFreq) * 1::second => dur delayDelay;
            <<<"freq f", f, "variation", variation, "delayFreq", delayFreq, "delayDelay", delayDelay, "max", delay.delay.max()>>>;
            delayDelay => delay.delay.delay;
        }
        return _freq;
    }

    fun float smear(float m)
    {
        m => _smear;
        return _smear;
    }

    fun void start()
    {
        (1.0 / _freq) * 1::second => dur freqDelay;
        freqDelay * (1.0 - _smear) => dur smearDelay;
        <<<"smear freqDelay", freqDelay, "smearDelay", smearDelay>>>;
        staggeredStart(smearDelay);
    }

    fun void _stagger(dur wait)
    {
        delays.iterator() @=> Iterator iterator;
        while (iterator.hasNext())
        {
            iterator.next() $ MonoDelay @=> MonoDelay delay;
            wait => now;
            input => delay.input;
        }
    }

    fun void staggeredStart(dur wait)
    {
        if (!running)
        {
            //spork ~ _stagger(wait);
            _stagger(wait);
            true => running;
        }
    }

    fun void stop()
    {
        if (running)
        {
            delays.iterator() @=> Iterator iterator;
            while (iterator.hasNext())
            {
                iterator.next() $ MonoDelay @=> MonoDelay delay;
                input =< delay.input;
            }
            false => running;
        }
    }

    fun void toggle()
    {
        if (running)
        {
            stop();
        }
        else
        {
            start();
        }
    }

    fun static Smear create(int z, float m, float f)
    {
        Smear smear;
        z => smear.size;
        smear.init();
        smear.freq(f);
        smear.smear(m);

        return smear;
    }
}