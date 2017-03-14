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

public class Fat extends Chubgraph
{
    SawOsc _saw;
    SawOsc _fifth;
    SqrOsc _oct;
    Gain _mix;
    Dist _dist;

    float _freq;
    float _phase;
    //float _op;
    Intervals.perfectFifth() @=> Interval _up;
    Intervals.octave().descending() @=> Interval _down;

    inlet => blackhole;
    _saw => _mix;
    _fifth => _mix;
    _oct => _mix;
    _mix => _dist => outlet;

    {
        0.60 => _saw.gain;
        0.06 => _fifth.gain;
        0.34 => _oct.gain;

        110.0 => freq;
        0.0 => phase;

        //spork ~ _tickAtSampleRate();
    }

    fun float freq()
    {
        return _freq;
    }

    fun float freq(float f)
    {
        f => _freq;
        _freq => _saw.freq;
        _up.evaluate(_freq) => _fifth.freq;
        _down.evaluate(_freq) => _oct.freq;
        return _freq;
    }

    fun float phase()
    {
        return _phase;
    }

    fun float phase(float f)
    {
        f => _phase;
        _phase => _saw.phase;
        _phase => _fifth.phase;
        _phase => _oct.phase;
        return _phase;
    }

    /*
    fun int op()
    {
        return _op;
    }

    fun int op(int i)
    {
        i => _op;
        return _op;
    }
    */

    fun Interval up()
    {
        return _up;
    }

    fun Interval up(Interval i)
    {
        i @=> _up;
        return _up;
    }

    fun Interval down()
    {
        return _down;
    }

    fun Interval down(Interval i)
    {
        i @=> _down;
        return _down;
    }

    /*
    fun void _tickAtSampleRate()
    {
        while (true)
        {
            1::samp => now;
            inlet.last() => float cv;
            // todo: check mode, set value on all three OSCs
        }
    }
    */
}
