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

public class DurProvider extends DurSupplier
{
    dur duration;

    fun dur get()
    {
        return evaluate();
    }

    fun dur evaluate()
    {
        return duration;
    }

    fun dur evaluate(int value)
    {
        return evaluate() * value;
    }

    fun dur evaluate(float value)
    {
        return evaluate() * value;
    }

    fun static DurProvider create(dur duration)
    {
        DurProvider durProvider;
        duration => durProvider.duration;       
        return durProvider;
    }
}
