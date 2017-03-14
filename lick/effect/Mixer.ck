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

public class Mixer extends Effect
{
    ArrayList @ inputs;

    /*

        input 1 ---+
                   |
        input 2 ---+---> wet
                   |
         ...       |
        input n ---+

    */
    {
        1.0 => mix;
    }

    fun Gain input(int i)
    {
        inputs.get(i) $ Gain @=> Gain input;
        return input;
    }

    fun void connect()
    {
        inputs.size() => int n;
        for (0 => int i; i < n; i++)
        {
            input(i) => wet;
        }
    }

    fun void disconnect()
    {
        inputs.size() => int n;
        for (0 => int i; i < n; i++)
        {
            input(i) =< wet;
        }
    }

    fun void distribute(float f)
    {
        1.0/f => float g;
        inputs.size() => int n;
        for (0 => int i; i < n; i++)
        {
            g => input(i).gain;
        }
    }

    fun void normalize()
    {
        0.0 => float sum;
        inputs.size() => int n;
        for (0 => int i; i < n; i++)
        {
            input(i).gain() => float g;
            sum + g => sum;
        }
        for (0 => int i; i < n; i++)
        {
            input(i).gain() => float g;
            g/sum => input(i).gain;
        }
    }

    fun void randomize()
    {
        Random r;
        randomize(r);
    }

    fun void randomize(Random r)
    {
        1.0 => float remaining;
        inputs.size() => int n;
        for (0 => int i; i < n; i++)
        {
            r.evaluate() * remaining => float g;
            g => input(i).gain;
            remaining - g => remaining;
        }
    }

    fun static Mixer create(int n)
    {
        ArrayList inputs;
        inputs.size(n);
        for (0 => int i; i < n; i++)
        {
            Gain gain;
            inputs.add(gain);
        }

        Mixer mixer;
        inputs @=> mixer.inputs;
        mixer.connect();
        mixer.distribute(1.0);
        return mixer;
    }
}