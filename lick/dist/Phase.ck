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

public class Phase extends Chugen
{
    0 => static int IN;
    1 => static int OUT;
    IN => int _phase;

    fun int phase()
    {
        return _phase;
    }

    fun int phase(int i)
    {
        i => _phase;
        return i;
    }

    fun int inPhase()
    {
        return (IN == _phase);
    }

    fun int outOfPhase()
    {
        return (OUT == _phase);
    }

    fun void toggle()
    {
        if (_phase == IN)
        {
            OUT => _phase;
        }
        else
        {
            IN => _phase;
        }
    }

    fun float tick(float in)
    {
        if (_phase == IN)
        {
            return in;
        }
        else
        {
            return -1.0 * in;
        }
    }

    fun static Phase create(int i)
    {
        Phase phase;
        i => phase.phase;
        return phase;
    }
}
