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

public class SampleHold extends Chubgraph
{
    inlet => blackhole;
    Step _step => outlet;
    100::samp => dur _hold;

    sample();
    spork ~ _tickAtRate();

    fun float freq()
    {
        return rate();
    }

    fun float freq(float f)
    {
        return rate(f);
    }

    fun float rate()
    {
        return 1::second / _hold;
    }

    fun float rate(float f)
    {
        1::second / f => _hold;
        return f;
    }

    fun dur hold()
    {
        return _hold;
    }

    fun dur hold(dur d)
    {
        d => _hold;
        return d;
    }

    fun void sample()
    {
        inlet.last() => _step.next;
    }

    fun void _tickAtRate()
    {
        while (true)
        {
            _hold => now;
            sample();
        }
    }

    fun static SampleHold create()
    {
        SampleHold sampleHold;
        return sampleHold;
    }

    fun static SampleHold create(float freq)
    {
        SampleHold sampleHold;
        freq => sampleHold.freq;
        return sampleHold;
    }

    fun static SampleHold create(dur hold)
    {
        SampleHold sampleHold;
        hold => sampleHold.hold;
        return sampleHold;
    }
}
