/*

    LiCK  Library for ChucK.
    Copyright (c) 2007-2025 held jointly by the individual authors.

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
// A xorshift random number generator (xorshift RNG) produces a sequence
// of 2^32−1 integers x, or a sequence of 2^64−1 pairs x,y, or a sequence
// of 2^96−1 triples x,y,z, etc., by means of repeated use of a simple
// computer construction: exclusive-or (xor) a computer word with a shifted
// version of itself.
//
// https://en.wikipedia.org/wiki/Xorshift
//

public class Xorshift extends Chance
{
    [
        [ 1, 3,10],
        [ 1, 5,16],
        [ 1, 5,19],
        [ 1, 9,29],
        [ 1,11, 6],
        [ 1,11,16],
        [ 1,19, 3],
        [ 1,21,20],
        [ 1,27,27],
        [ 2, 5,15],
        [ 2, 5,21],
        [ 2, 7, 7],
        [ 2, 7, 9],
        [ 2, 7,25],
        [ 2, 9,15],
        [ 2,15,17],
        [ 2,15,25],
        [ 2,21, 9],
        [ 3, 1,14],
        [ 3, 3,26],
        [ 3, 3,28],
        [ 3, 3,29],
        [ 3, 5,20],
        [ 3, 5,22],
        [ 3, 5,25],
        [ 3, 7,29],
        [ 3,13, 7],
        [ 3,23,25],
        [ 3,25,24],
        [ 3,27,11],
        [ 4, 3,17],
        [ 4, 3,27],
        [ 4, 5,15],
        [ 5, 3,21],
        [ 5, 7,22],
        [ 5, 9,7 ],
        [ 5, 9,28],
        [ 5, 9,31],
        [ 5,13, 6],
        [ 5,15,17],
        [ 5,17,13],
        [ 5,21,12],
        [ 5,27, 8],
        [ 5,27,21],
        [ 5,27,25],
        [ 5,27,28],
        [ 6, 1,11],
        [ 6, 3,17],
        [ 6,17, 9],
        [ 6,21, 7],
        [ 6,21,13],
        [ 7, 1, 9],
        [ 7, 1,18],
        [ 7, 1,25],
        [ 7,13,25],
        [ 7,17,21],
        [ 7,25,12],
        [ 7,25,20],
        [ 8, 7,23],
        [ 8,9,23 ],
        [ 9, 5,1 ],
        [ 9, 5,25],
        [ 9,11,19],
        [ 9,21,16],
        [10, 9,21],
        [10, 9,25],
        [11, 7,12],
        [11, 7,16],
        [11,17,13],
        [11,21,13],
        [12, 9,23],
        [13, 3,17],
        [13, 3,27],
        [13, 5,19],
        [13,17,15],
        [14, 1,15],
        [14,13,15],
        [15, 1,29],
        [17,15,20],
        [17,15,23],
        [17,15,26]
    ] @=> static int C[][];    

    ((1 << 31) - 1) => static int MASK;

    42 => int y;
    13 => int a;
    17 => int b;
    5 => int c;

    fun int xor()
    {
        y << a ^=> y;
        y >> b ^=> y;
        y << c ^=> y;
        return y;
    }

    fun float get()
    {
        return Std.scalef((xor() & MASK), 0, Math.RANDOM_MAX, 0.0f, 1.0f);
    }

    fun static Xorshift create(int seed)
    {
        return create(seed, seed % C.size());
    }

    fun static Xorshift create(int seed, int i)
    {
        C[i][0] => int a;
        C[i][1] => int b;
        C[i][2] => int c;
        return create(seed, a, b, c);
    }

    fun static Xorshift create(int y, int a, int b, int c)
    {
        Xorshift xorshift;
        y => xorshift.y;
        a => xorshift.a;
        b => xorshift.b;
        c => xorshift.c;
        return xorshift;
    }
}
