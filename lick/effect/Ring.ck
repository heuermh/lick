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

public class Ring extends Effect
{
    Gain pre;
    Gain carrier;
    Gain _ring;

    /*

        inlet ---> pre ---> ring ---> wet;
                             ^
                             |
                 carrier  ---+

     */

    inlet => pre => _ring => wet;
    carrier => _ring;

    {
        3 => _ring.op;
        1.0 => pre.gain;
        1.0 => carrier.gain;
    }

    fun static Ring create(UGen ugen)
    {
        Ring ring;
        ugen => ring.carrier;
        return ring;
    }
}
