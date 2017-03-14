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

class F extends FloatFunction
{
    512 => static int STAGES;

    0.0 => float _last;
    now => time _lastTimestamp;
    float _stages[STAGES];

    4::samp => dur _clockRate;

    spork ~ _clockA();
    spork ~ _clockB();

    fun void _clockA()
    {
        while (true)
        {
            _even();
            _clockRate => now;
        }
    }

    fun void _clockB()
    {
        _clockRate/2.0 => now;
        while (true)
        {
            _odd();
            _clockRate => now;
        }
    }

    fun float _even()
    {
        _last => _stages[0];
        now => _lastTimestamp;
        for (0 => int i; i < (STAGES - 1); )
        {
            _stages[i] => _stages[i + 1];
            i++;
            i++;
        }
    }

    fun float _odd()
    {
        now => _lastTimestamp;
        for (1 => int i; i < (STAGES - 1); )
        {
            _stages[i] => _stages[i + 1];
            i++;
            i++;
        }
    }

    fun float evaluate(float f)
    {
        f => _last;
        return _stages[STAGES - 1];
    }
}

public class BucketBrigade extends WaveShaper
{
    F _f;
    _f @=> shape;

    fun dur clockRate()
    {
        return _f._clockRate;
    }

    fun dur clockRate(dur d)
    {
        d => _f._clockRate;
        return d;
    }
}
