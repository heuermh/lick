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

// wrapper for C*APS Scape LADSPA plugin, http://quitte.de/dsp/caps.html#Scape
//   see also https://github.com/jwmatthys/chugins/blob/master/Ladspa/Scape.ck
public class Scape extends Caps
{
    "Scape" => ladspa.activate;

    // use effect for wet/dry setting
    ladspa.set(3, 1.0);

    fun float bpm()
    {
        return ladspa.get(0);
    }

    fun float bpm(float f)
    {
        Constrain.constrainf(f, 30.0, 164.0) => float v;
        ladspa.set(0, v);
        return v;
    }

    fun float divider()
    {
        return ladspa.get(1);
    }

    fun float divider(float f)
    {
        Constrain.constrainf(f, 2.0, 4.0) => float v;
        ladspa.set(1, v);
        return v;
    }

    fun float feedback()
    {
        return ladspa.get(2);
    }

    fun float feedback(float f)
    {
        Constrain.constrainf(f, 0.0, 1.0) => float v;
        ladspa.set(2, v);
        return v;
    }

    fun float blend()
    {
        return ladspa.get(4);
    }

    fun float blend(float f)
    {
        Constrain.constrainf(f, 0.0, 1.0) => float v;
        ladspa.set(4, v);
        return v;
    }

    fun float tune()
    {
        return ladspa.get(5);
    }

    fun float tune(float f)
    {
        Constrain.constrainf(f, 415.0, 467.0) => float v;
        ladspa.set(5, v);
        return v;
    }    
}
