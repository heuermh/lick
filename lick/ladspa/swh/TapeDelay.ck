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

// wrapper for SWH Plugins Tape Delay Simulation LADSPA plugin,
//   http://plugin.org.uk/ladspa-swh/docs/ladspa-swh.html#tth_sEc2.104
public class TapeDelay extends Swh
{
    prefix + "tape_delay_1211.so" => ladspa.load;
    "tapeDelay" => ladspa.activate;

    // use effect for wet/dry setting
    ladspa.set(1, 0.0);

    fun float tapeSpeed()
    {
        return ladspa.get(0);
    }

    fun float tapeSpeed(float f)
    {
        Constrain.constrainf(f, 0.0, 10.0) => float v;
        ladspa.set(0, v);
        return v;
    }


    fun float tap1Distance()
    {
        return ladspa.get(2);
    }

    fun float tap1Distance(float f)
    {
        Constrain.constrainf(f, 0.0, 4.0) => float v;
        ladspa.set(2, v);
        return v;
    }

    fun float tap1Level()
    {
        return ladspa.get(3);
    }

    fun float tap1Level(float f)
    {
        Constrain.constrainf(f, -90.0, 0.0) => float v;
        ladspa.set(3, v);
        return v;
    }

    fun void tap1(float distance, float level)
    {
        tap1Distance(distance);
        tap1Level(level);
    }


    fun float tap2Distance()
    {
        return ladspa.get(4);
    }

    fun float tap2Distance(float f)
    {
        Constrain.constrainf(f, 0.0, 4.0) => float v;
        ladspa.set(4, v);
        return v;
    }

    fun float tap2Level()
    {
        return ladspa.get(5);
    }

    fun float tap2Level(float f)
    {
        Constrain.constrainf(f, -90.0, 0.0) => float v;
        ladspa.set(5, v);
        return v;
    }

    fun void tap2(float distance, float level)
    {
        tap2Distance(distance);
        tap2Level(level);
    }


    fun float tap3Distance()
    {
        return ladspa.get(6);
    }

    fun float tap3Distance(float f)
    {
        Constrain.constrainf(f, 0.0, 4.0) => float v;
        ladspa.set(6, v);
        return v;
    }

    fun float tap3Level()
    {
        return ladspa.get(7);
    }

    fun float tap3Level(float f)
    {
        Constrain.constrainf(f, -90.0, 0.0) => float v;
        ladspa.set(7, v);
        return v;
    }

    fun void tap3(float distance, float level)
    {
        tap3Distance(distance);
        tap3Level(level);
    }


    fun float tap4Distance()
    {
        return ladspa.get(8);
    }

    fun float tap4Distance(float f)
    {
        Constrain.constrainf(f, 0.0, 4.0) => float v;
        ladspa.set(8, v);
        return v;
    }

    fun float tap4Level()
    {
        return ladspa.get(9);
    }

    fun float tap4Level(float f)
    {
        Constrain.constrainf(f, -90.0, 0.0) => float v;
        ladspa.set(9, v);
        return v;
    }

    fun void tap4(float distance, float level)
    {
        tap4Distance(distance);
        tap4Level(level);
    }
}
