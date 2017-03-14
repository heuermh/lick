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

// wrapper for C*APS Saturate LADSPA plugin, http://quitte.de/dsp/caps.html#Saturate
public class Saturate extends Caps
{
    "Saturate" => ladspa.activate;

    string modeNames[12];
    int modeIds[12];

    {
        "bypass" => modeNames[0];
        "atan" => modeNames[1];
        "atan15" => modeNames[2];
        "clip" => modeNames[3];
        "one5" => modeNames[4];
        "one53" => modeNames[5];
        "clip3" => modeNames[6];
        "clip9" => modeNames[7];
        "sin1" => modeNames[8];
        "pow7" => modeNames[9];
        "tanh" => modeNames[10];
        "rectify" => modeNames[11];

        0 => modeIds["bypass"];
        1 => modeIds["atan"];
        2 => modeIds["atan15"];
        3 => modeIds["clip"];
        4 => modeIds["one5"];
        5 => modeIds["one53"];
        6 => modeIds["clip3"];
        7 => modeIds["clip9"];
        8 => modeIds["sin1"];
        9 => modeIds["pow7"];
        10 => modeIds["tanh"];
        11 => modeIds["rectify"];
    }

    fun int mode()
    {
        ladspa.get(0) $ int => int i;
        return i;
    }

    fun int mode(int i)
    {
        Constrain.constrain(i, 0, 11) => int v;
        ladspa.set(0, v);
        return v;
    }

    fun string modeName()
    {
        return modeNames[mode()];
    }

    fun string modeName(string s)
    {
        mode(modeIds[s]) => int i;
        return modeNames[i];
    }

    // gain --> db
    fun float db()
    {
        return ladspa.get(1);
    }

    fun float db(float f)
    {
        Constrain.constrainf(f, -24.0, 72.0) => float v;
        ladspa.set(1, v);
        return v;
    }

    fun float bias()
    {
        return ladspa.get(2);
    }

    fun float bias(float f)
    {
        Constrain.constrainf(f, 0.0, 1.0) => float v;
        ladspa.set(2, v);
        return v;
    }
}
