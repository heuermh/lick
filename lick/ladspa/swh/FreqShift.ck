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

// wrapper for SWH Plugins Bode frequency shifter LADSPA plugin,
//   http://plugin.org.uk/ladspa-swh/docs/ladspa-swh.html#tth_sEc2.10
public class FreqShift extends Swh
{
    prefix + "bode_shifter_1431.so" => ladspa.load;
    "bodeShifter" => ladspa.activate;

    fun float shift()
    {
        return ladspa.get(0);
    }

    // frequency shift, in Hz
    fun float shift(float f)
    {
        Constrain.constrainf(f, 0.0, 5000.0) => float v;
        ladspa.set(0, v);
        return v;
    }

    fun float latency()
    {
        return ladspa.get(1);
    }
}
