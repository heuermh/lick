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

// wrapper for CMT Lo Fi LADSPA plugin, http://www.ladspa.org/cmt/plugins.html
public class Lofi extends Cmt
{
    "lofi" => ladspa.activate;

    fun float crack()
    {
        return ladspa.get(0);
    }

    fun float crack(float f)
    {
        Constrain.constrainf(f, -0.1, 100.1) => float v;
        ladspa.set(0, v);
        return v;
    }

    fun float over()
    {
        return ladspa.get(1);
    }

    fun float over(float f)
    {
        Constrain.constrainf(f, 0.0, 100.0) => float v;
        ladspa.set(1, v);
        return v;
    }

    fun float limit()
    {
        return ladspa.get(2);
    }

    fun float limit(float f)
    {
        Constrain.constrainf(f, 1.0, 10000.0) => float v;
        ladspa.set(2, v);
        return v;
    }

    fun float crackling()
    {
        return crack();
    }

    fun float crackling(float f)
    {
        return crack(f);
    }

    fun float powerSupplyOverloading()
    {
        return over();
    }

    fun float powerSupplyOverloading(float f)
    {
        return over(f);
    }    

    fun float opampBandwidthLimiting()
    {
        return limit();
    }

    fun float opampBandwidthLimiting(float f)
    {
        return limit(f);
    }
}
