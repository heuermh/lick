/*

    LiCK  Library for ChucK.
    Copyright (c) 2007-2023 held jointly by the individual authors.

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

public class Reconnect
{
    fun static void reconnect(Sample sample, UGen ugen)
    {
        sample.reconnect(ugen);
    }

    fun static void reconnect(ArrayList samples, UGen ugen)
    {
        //<<<"   reconnecting", samples.size(), " samples to ugen", ugen>>>;
        samples.iterator() @=> Iterator iterator;
        while (iterator.hasNext())
        {
            iterator.next() $ Sample @=> Sample sample;
            //<<<"    reconnecting sample", sample.name, " to ugen", ugen>>>;
            sample.reconnect(ugen);
        }
    }
}
