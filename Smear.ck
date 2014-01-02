/*

    LiCK  Library for ChucK.
    Copyright (c) 2007-2014 held jointly by the individual authors.

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
    true => int _running;

    20.0 => float _freq;
    0.8 => float _smear;
    0.0 => float _feedback;

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

    fun float feedback()
    {
        return _feedback;
    }

    fun float feedback(float feedback)
    {
        feedback => _feedback;
        delays.iterator() @=> Iterator iterator;
        while (iterator.hasNext())
        {
            iterator.next() $ MonoDelay @=> MonoDelay delay;
            _feedback => delay.feedback.gain;
        }
        return _feedback;
    }

    fun float freq()
    {
        return _freq;
    }

    fun float freq(float freq)
    {
        freq => _freq;
        delays.iterator() @=> Iterator iterator;
        while (iterator.hasNext())
        {
            iterator.next() $ MonoDelay @=> MonoDelay delay;
            Math.random2f((_freq / 50.0), (-_freq / 50.0)) => float variation;
            _freq + variation => float delayFreq;
            (1.0 / delayFreq) * 1::second => dur delayDelay;
            <<<"freq f", _freq, "variation", variation, "delayFreq", delayFreq, "delayDelay", delayDelay, "max", delay.delay.max()>>>;
            delayDelay => delay.delay.delay;
        }
        return _freq;
    }

    fun float smear()
    {
        return _smear;
    }

    fun float smear(float smear)
    {
        smear => _smear;
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
        if (!_running)
        {
            //spork ~ _stagger(wait);
            _stagger(wait);
            true => _running;
        }
    }

    fun void stop()
    {
        if (_running)
        {
            delays.iterator() @=> Iterator iterator;
            while (iterator.hasNext())
            {
                iterator.next() $ MonoDelay @=> MonoDelay delay;
                input =< delay.input;
            }
            false => _running;
        }
    }

    fun void toggle()
    {
        if (_running)
        {
            stop();
        }
        else
        {
            start();
        }
    }

    fun int running()
    {
        return _running;
    }

    fun static Smear create(int z, float m, float f, float d)
    {
        Smear smear;
        z => smear.size;
        smear.init();
        smear.freq(f);
        smear.smear(m);
        smear.feedback(d);

        return smear;
    }
}