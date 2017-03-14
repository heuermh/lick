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
// arpeggiator patterns, based on Shruthi user manual
// http://mutable-instruments.net/shruthi1/manual
//
// Olivier Gillet, Mutable instruments SARL 2011-2013.
// Except where otherwise noted, content on this site is licensed under a cc-by-sa 3.0 license.
//
// As such, this class is dual licensed GPL v3.0 or later as described above
// and also under the cc-by-sa 3.0 license per the Share Alike clause
//

public class Patterns
{

    //  1: o o o o o o o o 
    fun static Pattern p1()
    {
        return pattern(1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0);
    }

    //  2: ooo ooo ooo ooo 
    fun static Pattern p2()
    {
        return pattern(1, 1, 1, 0, 1, 1, 1, 0, 1, 1, 1, 0, 1, 1, 1, 0);
    }

    //  3: o o ooooo o oooo
    fun static Pattern p3()
    {
        return pattern(1, 0, 1, 0, 1, 1, 1, 1, 1, 0, 1, 0, 1, 1, 1, 1);
    }

    //  4: o o oo oo o oo o
    fun static Pattern p4()
    {
        return pattern(1, 0, 1, 0, 1, 1, 0, 1, 1, 0, 1, 0, 1, 1, 0, 1);
    }

    //  5: oooo oo oooo oo 
    fun static Pattern p5()
    {
        return pattern(1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 0, 1, 1, 0);
    }

    //  6: o  o    o  o    
    fun static Pattern p6()
    {
        return pattern(1, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0);
    }

    //  7: o  o  o o  o  o 
    fun static Pattern p7()
    {
        return pattern(1, 0, 0, 1, 0, 0, 1, 0, 1, 0, 0, 1, 0, 0, 1, 0);
    }

    //  8: o  o  o  o  o o 
    fun static Pattern p8()
    {
       return pattern(1, 0, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 1, 0, 1, 0);
    }

    //  9: o o  o  o  o  o 
    fun static Pattern p9()
    {
        return pattern(1, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 1, 0);
    }

    // 10: oo oo oooo oo oo
    fun static Pattern p10()
    {
        return pattern(1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1);
    }

    // 11: ooooo oo oo ooo 
    fun static Pattern p11()
    {
        return pattern(1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 0, 1, 1, 1, 0);
    }

    // 12: o   o   o  o o o
    fun static Pattern p12()
    {
        return pattern(1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 1, 0, 1, 0, 1);
    }

    // 13: o  oo   o o o oo
    fun static Pattern p13()
    {
        return pattern(1, 0, 0, 1, 1, 0, 0, 0, 1, 0, 1, 0, 1, 0, 1, 1);
    }

    // 14: o     oooooo oo 
    fun static Pattern p14()
    {
        return pattern(1, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0);
    }

    // 15: o       o   o oo
    fun static Pattern p15()
    {
        return pattern(1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1, 1);
    }

    fun static void _dumpChars()
    {
        "1+*xXoO" @=> string str;
        str.length() => int n;
        for (0 => int i; i < n; i++)
        {
            <<<str.charAt(i)>>>;
        }
    }

    /*

      01010, -+-+-, -x-x-, -*-*-,  o o ,  x x ,  * * , .x.x., etc.

    */
    fun static Pattern pattern(string p)
    {
        p.length() => int n;

        Pattern pattern;
        pattern.size(n);

        for (0 => int i; i < n; i++)
        {
            p.charAt(i) => int c;
            if (c == 49 || c == 43 || c == 42 || c == 120 || c == 88 || c == 111 || c == 79)
            {
                pattern.pattern.set(i, 1);
            }
            else
            {
                pattern.pattern.set(i, 0);
            }
        }
        return pattern;
    }

    // choose yer own t
    fun static Pattern pattern(string p, int t)
    {
        p.length() => int n;

        Pattern pattern;
        pattern.size(n);

        for (0 => int i; i < n; i++)
        {
            p.charAt(i) => int c;
            if (c == t)
            {
                pattern.pattern.set(i, 1);
            }
            else
            {
                pattern.pattern.set(i, 0);
            }
        }
        return pattern;
    }

    fun static Pattern pattern(int v0, int v1, int v2, int v3)
    {
        Pattern pattern;
        pattern.size(4);
        pattern.pattern.set(0, v0);
        pattern.pattern.set(1, v1);
        pattern.pattern.set(2, v2);
        pattern.pattern.set(3, v3);
        return pattern;
    }

    fun static Pattern pattern(int v0, int v1, int v2, int v3, int v4, int v5, int v6, int v7)
    {
        Pattern pattern;
        pattern.size(8);
        pattern.pattern.set(0, v0);
        pattern.pattern.set(1, v1);
        pattern.pattern.set(2, v2);
        pattern.pattern.set(3, v3);
        pattern.pattern.set(4, v4);
        pattern.pattern.set(5, v5);
        pattern.pattern.set(6, v6);
        pattern.pattern.set(7, v7);
        return pattern;
    }

    fun static Pattern pattern(int v0, int v1, int v2, int v3, int v4, int v5, int v6, int v7,
                               int v8, int v9, int v10, int v11, int v12, int v13, int v14, int v15)
    {
        Pattern pattern;
        pattern.size(16);
        pattern.pattern.set(0, v0);
        pattern.pattern.set(1, v1);
        pattern.pattern.set(2, v2);
        pattern.pattern.set(3, v3);
        pattern.pattern.set(4, v4);
        pattern.pattern.set(5, v5);
        pattern.pattern.set(6, v6);
        pattern.pattern.set(7, v7);
        pattern.pattern.set(8, v8);
        pattern.pattern.set(9, v9);
        pattern.pattern.set(10, v10);
        pattern.pattern.set(11, v11);
        pattern.pattern.set(12, v12);
        pattern.pattern.set(13, v13);
        pattern.pattern.set(14, v14);
        pattern.pattern.set(15, v15);
        return pattern;
    }

    fun static Procedure condition(Pattern p, Procedure r)
    {
        PatternedProcedure patterned;
        p @=> patterned.p;
        r @=> patterned.r;
        return patterned;
    }

    fun static DurProcedure conditiond(Pattern p, DurProcedure r)
    {
        PatternedDurProcedure patterned;
        p @=> patterned.p;
        r @=> patterned.r;
        return patterned;
    }

    fun static FloatProcedure conditionf(Pattern p, FloatProcedure r)
    {
        PatternedFloatProcedure patterned;
        p @=> patterned.p;
        r @=> patterned.r;
        return patterned;
    }

    fun static IntProcedure conditioni(Pattern p, IntProcedure r)
    {
        PatternedIntProcedure patterned;
        p @=> patterned.p;
        r @=> patterned.r;
        return patterned;
    }
}
