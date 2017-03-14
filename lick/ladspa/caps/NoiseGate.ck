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

// wrapper for C*APS NoiseGate LADSPA plugin, http://quitte.de/dsp/caps.html#NoiseGate
public class NoiseGate extends Caps
{
    "NoiseGate" => ladspa.activate;

    fun float open()
    {
        return ladspa.get(0);
    }

    fun float open(float f)
    {
        Constrain.constrainf(f, -60.0, 0.0) => float v;
        ladspa.set(0, v);
        return v;
    }

    fun float attack()
    {
        return ladspa.get(1);
    }

    fun float attack(float f)
    {
        Constrain.constrainf(f, 0.0, 3.0) => float v;
        ladspa.set(1, v);
        return v;
    }

    fun float close()
    {
        return ladspa.get(2);
    }

    fun float close(float f)
    {
        Constrain.constrainf(f, -90.0, 0.0) => float v;
        ladspa.set(2, v);
        return v;
    }

    fun int mains()
    {
        ladspa.get(3) $ int => int i;
        return i;
    }

    fun int mains(int i)
    {
        Constrain.constrain(i, 0, 100) => int v;
        ladspa.set(3, v);
        return v;
    }

    fun string mainsName()
    {
        mains() => int i;
        if (i == 0)
        {
            return "off";
        }
        else if (i == 50)
        {
            return "global";
        }
        else if (i == 60)
        {
            return "imperial";
        }
        return i + " Hz";
    }

    fun string mainsName(string s)
    {
        if ("off" == s)
        {
            mains(0);
        }
        else if ("global" == s)
        {
            mains(50);
        }
        else if ("imperial" == s)
        {
            mains(60);
        }
        else
        {
            // todo: parse int from "50 Hz"
        }
        return mainsName();
    }
}
