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

public class Select extends Mixer
{
    float _max;
    int _current;

    fun void select(int i)
    {
        i => _current;
        inputs.size() => int n;
        for (0 => int i; i < n; i++)
        {
            if (i == _current)
            {
                _max => input(i).gain;
            }
            else
            {
                0.0 => input(i).gain;
            }
        }
    }

    fun float max()
    {
        return _max;
    }

    fun float max(float f)
    {
        f => _max;
        _max => input(_current).gain;
        return f;
    }

    fun static Select create(int n, int current, float max)
    {
        ArrayList _inputs;
        _inputs.size(n);
        for (0 => int i; i < n; i++)
        {
            Gain gain;
            _inputs.add(gain);
        }

        Select select;
        _inputs @=> select.inputs;
        select.connect();
        max => select.max;
        select.select(current);
        return select;
    }
}
