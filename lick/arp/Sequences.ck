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

public class Sequences
{

    fun static Sequence sequence(string s)
    {
        // todo: create regex that splits on ,|\t\w
        return sequence(s, " ");
    }

    // choose yer own delimiter
    fun static Sequence sequence(string p, string delim)
    {
        Sequence sequence;

        StringTokenizer st;
        st.set(p); // todo: cannot specify the delimiter

        while (st.more())
        {
            Std.atof(st.next()) => float f;
            sequence.sequence.add(f);
        }
        return sequence;
    }

    fun static Sequence sequence(float v0, float v1, float v2, float v3)
    {
        Sequence sequence;
        sequence.size(4);
        sequence.sequence.set(0, v0);
        sequence.sequence.set(1, v1);
        sequence.sequence.set(2, v2);
        sequence.sequence.set(3, v3);
        return sequence;
    }

    fun static Sequence sequence(float v0, float v1, float v2, float v3, float v4, float v5, float v6, float v7)
    {
        Sequence sequence;
        sequence.size(8);
        sequence.sequence.set(0, v0);
        sequence.sequence.set(1, v1);
        sequence.sequence.set(2, v2);
        sequence.sequence.set(3, v3);
        sequence.sequence.set(4, v4);
        sequence.sequence.set(5, v5);
        sequence.sequence.set(6, v6);
        sequence.sequence.set(7, v7);
        return sequence;
    }

    fun static Sequence sequence(float v0, float v1, float v2, float v3, float v4, float v5, float v6, float v7,
                               float v8, float v9, float v10, float v11, float v12, float v13, float v14, float v15)
    {
        Sequence sequence;
        sequence.size(16);
        sequence.sequence.set(0, v0);
        sequence.sequence.set(1, v1);
        sequence.sequence.set(2, v2);
        sequence.sequence.set(3, v3);
        sequence.sequence.set(4, v4);
        sequence.sequence.set(5, v5);
        sequence.sequence.set(6, v6);
        sequence.sequence.set(7, v7);
        sequence.sequence.set(8, v8);
        sequence.sequence.set(9, v9);
        sequence.sequence.set(10, v10);
        sequence.sequence.set(11, v11);
        sequence.sequence.set(12, v12);
        sequence.sequence.set(13, v13);
        sequence.sequence.set(14, v14);
        sequence.sequence.set(15, v15);
        return sequence;
    }
}
