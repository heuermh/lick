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

public class Tremolo extends LfoEffect
{
    Gain _tremolo;

    {
        inlet => _tremolo => wet;

        spork ~ _updateAtSampleRate();
    }

    fun void _updateAtSampleRate()
    {
        while (true)
        {
            1::samp => now;
            1.0 - _lfo.depth()/2.0 + _lfo.last()/2.0 => _tremolo.gain;
        }
    }

    fun static Tremolo create()
    {
        Tremolo tremolo;
        return tremolo;
    }
}
