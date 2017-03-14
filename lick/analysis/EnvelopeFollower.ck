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

//
// derived from ChucK example
//   http://chuck.cs.princeton.edu/doc/examples/deep/follower.ck
//

public class EnvelopeFollower extends Chubgraph
{
    20::ms => dur _rate;

    Gain _gain;
    OnePole _pole;
    Step _step;

    inlet => _gain;
    inlet => _gain;
    _gain => _pole => blackhole;
    _step => outlet;

    {
        3 => _gain.op;
        0.99 => _pole.pole;

        spork ~ _updateAtRate();
    }

    fun float last()
    {
        return _step.last();
    }

    fun dur rate()
    {
        return _rate;
    }

    fun dur rate(dur d)
    {
        d => _rate;
        return d;
    }

    fun void _updateAtRate()
    {
        while (true)
        {
            _pole.last() => _step.next;
            _rate => now;
        }
    }
}
