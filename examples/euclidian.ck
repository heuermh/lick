/*

    LiCK  Library for ChucK.
    Copyright (c) 2007-2026 held jointly by the individual authors.

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

fun Pattern euclidian(int steps, int pulses)
{
    if (steps < 1)
    {
        Pattern empty;
        empty.size(0);
        return empty;
    }
    if (pulses < 1)
    {
        Pattern empty;
        empty.size(steps);
        return empty;
    }
    if (pulses >= steps)
    {
        Pattern full;
        full.size(steps);
        for (0 => int i; i < steps; i++)
        {
            full.pattern.set(i, 1);
        }
        return full;
    }

    string s;
    steps - pulses => int pauses;
    if (pauses >= pulses)
    {
        pauses / pulses => int per;
        pauses % pulses => int rem;

        for (0 => int i; i < pulses; i++)
        {
            "x" +=> s;
            for (0 => int j; j < per; j++)
            {
                "-" +=> s;
            }
            if (i < rem)
            {
                "-" +=> s;
            }
        }
    }
    else
    {
        (pulses - pauses) / pauses => int per;
        (pulses - pauses) % pauses => int rem;

        for (0 => int i; i < pauses; i++)
        {
            "x" +=> s;
            "-" +=> s;
            for (0 => int j; j < per; j++)
            {
                "x" +=> s;
            }
            if (i < rem)
            {
                "x" +=> s;
            }
        }
    }
    //<<<steps, pulses, s, s.length()>>>;
    return Patterns.pattern(s);
}

fun string print(Pattern p, string pulse, string pause)
{
    string s;
    for (0 => int i; i < p.size(); i++)
    {
        if (p.pattern.get(i))
        {
            pulse +=> s;
        }
        else
        {
            pause +=> s;
        }
    }
    return s;
}

fun string print(Pattern p)
{
    return print(p, "x", "-");
}

<<<"(4, 0)", print(euclidian(4, 0))>>>;
<<<"(4, 1)", print(euclidian(4, 1))>>>;
<<<"(4, 2)", print(euclidian(4, 2))>>>;
<<<"(4, 3)", print(euclidian(4, 3))>>>;
<<<"(4, 4)", print(euclidian(4, 4))>>>;
<<<"(4, 5)", print(euclidian(4, 5))>>>;

<<<"(8, 0)", print(euclidian(8, 0))>>>;
<<<"(8, 1)", print(euclidian(8, 1))>>>;
<<<"(8, 2)", print(euclidian(8, 2))>>>;
<<<"(8, 3)", print(euclidian(8, 3))>>>;
<<<"(8, 4)", print(euclidian(8, 4))>>>;
<<<"(8, 5)", print(euclidian(8, 5))>>>;
<<<"(8, 6)", print(euclidian(8, 6))>>>;
<<<"(8, 7)", print(euclidian(8, 7))>>>;
<<<"(8, 8)", print(euclidian(8, 8))>>>;
<<<"(8, 9)", print(euclidian(8, 9))>>>;

<<<"(16, 0) ", print(euclidian(16, 0))>>>;
<<<"(16, 1) ", print(euclidian(16, 1))>>>;
<<<"(16, 2) ", print(euclidian(16, 2))>>>;
<<<"(16, 3) ", print(euclidian(16, 3))>>>;
<<<"(16, 4) ", print(euclidian(16, 4))>>>;
<<<"(16, 5) ", print(euclidian(16, 5))>>>;
<<<"(16, 6) ", print(euclidian(16, 6))>>>;
<<<"(16, 7) ", print(euclidian(16, 7))>>>;
<<<"(16, 8) ", print(euclidian(16, 8))>>>;
<<<"(16, 9) ", print(euclidian(16, 9))>>>;
<<<"(16, 10)", print(euclidian(16, 10))>>>;
<<<"(16, 11)", print(euclidian(16, 11))>>>;
<<<"(16, 12)", print(euclidian(16, 12))>>>;
<<<"(16, 13)", print(euclidian(16, 13))>>>;
<<<"(16, 14)", print(euclidian(16, 14))>>>;
<<<"(16, 15)", print(euclidian(16, 15))>>>;
<<<"(16, 16)", print(euclidian(16, 16))>>>;
<<<"(16, 17)", print(euclidian(16, 17))>>>;

for (0 => int i; i < 34; i++)
{
   <<<"( 32,", i, ")", print(euclidian(32, i))>>>;
}
<<<"done">>>;
