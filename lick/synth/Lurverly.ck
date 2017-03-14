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

public class Luverly extends Chubgraph
{
    SawOsc _saw1;
    SawOsc _saw2;
    Gain _mix;

    float _freq;
    float _phase;
    //float _op;
    float _detune;

    inlet => blackhole;
    _saw1 => _mix;
    _saw2 => Invert _invert => _mix;
    _mix => outlet;

    {
        0.6 => _saw1.gain;
        0.4 => _saw2.gain;

        110.0 => freq;
        0.0 => phase;
        0.1 => detune;

        //spork ~ _tickAtSampleRate();
    }

    fun float freq()
    {
        return _freq;
    }

    fun float freq(float f)
    {
        f => _freq;
        _freq => _saw1.freq;
        _freq - (_freq * _detune/100.0) => _saw2.freq;
        return _freq;
    }

    fun float phase()
    {
        return _phase;
    }

    fun float phase(float f)
    {
        f => _phase;
        _phase => _saw1.phase;
        _phase => _saw2.phase;
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

    fun float detune()
    {
        return _detune;
    }

    fun float detune(float f)
    {
        f => _detune;
        _freq - (_freq * _detune/100.0) => _saw2.freq;
        return _detune;
    }

    /*
    fun void _tickAtSampleRate()
    {
        while (true)
        {
            1::samp => now;
            inlet.last() => float cv;
            // todo: check mode, set value on both OSCs
        }
    }
    */
}
