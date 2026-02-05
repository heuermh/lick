/*

    LiCK  Library for ChucK.
    Copyright (c) 2007-2026 held jointly by the individual authors.

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
// chorus of 16 strange voices with spread
//

public class StrangeChorus extends Chugraph
{
    float _freq;
    float _spread;
    float _resonance;

    Mixer.create(16) @=> Mixer _mixer;

    Strange s0 => _mixer.input(0);
    Strange s1 => _mixer.input(1);
    Strange s2 => _mixer.input(2);
    Strange s3 => _mixer.input(3);

    Strange a0 => _mixer.input(4);
    Strange a1 => _mixer.input(5);
    Strange a2 => _mixer.input(6);
    Strange a3 => _mixer.input(7);

    Strange t0 => _mixer.input(8);
    Strange t1 => _mixer.input(9);
    Strange t2 => _mixer.input(10);
    Strange t3 => _mixer.input(11);

    Strange b0 => _mixer.input(12);
    Strange b1 => _mixer.input(13);
    Strange b2 => _mixer.input(14);
    Strange b3 => _mixer.input(15);

    ArrayList _chorus;

    inlet => blackhole;
    _mixer => outlet;

    {
        440.0 => freq;
        0.005 => spread;
        32.0 => resonance;

        _chorus.add(s0);
        _chorus.add(s1);
        _chorus.add(s2);
        _chorus.add(s3);

        _chorus.add(a0);
        _chorus.add(a1);
        _chorus.add(a2);
        _chorus.add(a3);

        _chorus.add(t0);
        _chorus.add(t1);
        _chorus.add(t2);
        _chorus.add(t3);

        _chorus.add(b0);
        _chorus.add(b1);
        _chorus.add(b2);
        _chorus.add(b3);

        ee();
    }

    fun void ee()
    {
        _chorus.iterator() @=> Iterator iterator;
        while (iterator.hasNext())
        {
            iterator.next() $ Strange @=> Strange s;
            s.ee();
        }
    }

    fun void i()
    {
        _chorus.iterator() @=> Iterator iterator;
        while (iterator.hasNext())
        {
            iterator.next() $ Strange @=> Strange s;
            s.i();
        }
    }

    fun void e()
    {
        _chorus.iterator() @=> Iterator iterator;
        while (iterator.hasNext())
        {
            iterator.next() $ Strange @=> Strange s;
            s.e();
        }
    }

    fun void ae()
    {
        _chorus.iterator() @=> Iterator iterator;
        while (iterator.hasNext())
        {
            iterator.next() $ Strange @=> Strange s;
            s.ae();
        }
    }

    fun void ah()
    {
        _chorus.iterator() @=> Iterator iterator;
        while (iterator.hasNext())
        {
            iterator.next() $ Strange @=> Strange s;
            s.ah();
        }
    }

    fun void aw()
    {
        _chorus.iterator() @=> Iterator iterator;
        while (iterator.hasNext())
        {
            iterator.next() $ Strange @=> Strange s;
            s.aw();
        }
    }

    fun void u()
    {
        _chorus.iterator() @=> Iterator iterator;
        while (iterator.hasNext())
        {
            iterator.next() $ Strange @=> Strange s;
            s.u();
        }
    }

    fun void oo()
    {
        _chorus.iterator() @=> Iterator iterator;
        while (iterator.hasNext())
        {
            iterator.next() $ Strange @=> Strange s;
            s.oo();
        }
    }

    fun void a()
    {
        _chorus.iterator() @=> Iterator iterator;
        while (iterator.hasNext())
        {
            iterator.next() $ Strange @=> Strange s;
            s.a();
        }
    }

    fun void er()
    {
        _chorus.iterator() @=> Iterator iterator;
        while (iterator.hasNext())
        {
            iterator.next() $ Strange @=> Strange s;
            s.er();
        }
    }

    fun void keyOn()
    {
        _chorus.iterator() @=> Iterator iterator;
        while (iterator.hasNext())
        {
            iterator.next() $ Strange @=> Strange s;
            s.keyOn();
        }
    }

    fun void keyOff()
    {
        _chorus.iterator() @=> Iterator iterator;
        while (iterator.hasNext())
        {
            iterator.next() $ Strange @=> Strange s;
            s.keyOff();
        }
    }

    fun float freq()
    {
        return _freq;
    }

    fun float freq(float f)
    {
        f => _freq;

        f * 2.0 => s0.freq;
        f * 2.0 + (f * 2.0 * _spread * Math.random2f(-1.0, 1.0)) => s1.freq;
        f * 2.0 + (f * 2.0 * _spread * Math.random2f(-1.0, 1.0)) => s2.freq;
        f * 2.0 + (f * 2.0 * _spread * Math.random2f(-1.0, 1.0)) => s3.freq;

        f => a0.freq;
        f + (f * _spread * Math.random2f(-1.0, 1.0)) => a1.freq;
        f + (f * _spread * Math.random2f(-1.0, 1.0)) => a2.freq;
        f + (f * _spread * Math.random2f(-1.0, 1.0)) => a3.freq;

        f/2.0 => t0.freq;
        f/2.0 + (f/2.0 * _spread * Math.random2f(-1.0, 1.0)) => t1.freq;
        f/2.0 + (f/2.0 * _spread * Math.random2f(-1.0, 1.0)) => t2.freq;
        f/2.0 + (f/2.0 * _spread * Math.random2f(-1.0, 1.0)) => t3.freq;

        f/4.0 => b0.freq;
        f/4.0 + (f/4.0 * _spread * Math.random2f(-1.0, 1.0)) => b1.freq;
        f/4.0 + (f/4.0 * _spread * Math.random2f(-1.0, 1.0)) => b2.freq;
        f/4.0 + (f/4.0 * _spread * Math.random2f(-1.0, 1.0)) => b3.freq;

        return f;
    }

    fun float spread()
    {
        return _spread;
    }

    fun float spread(float f)
    {
        f => _spread;
        return f;
    }

    fun float resonance()
    {
        return _resonance;
    }

    fun float resonance(float f)
    {
        f => _resonance;
        _chorus.iterator() @=> Iterator iterator;
        while (iterator.hasNext())
        {
            iterator.next() $ Strange @=> Strange s;
            f => s.resonance;
        }
        return f;
    }
}
