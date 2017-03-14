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

// wrapper for C*APS Eq4p LADSPA plugin, http://quitte.de/dsp/caps.html#Eq4p
public class ParametricEq extends Caps
{
    "Eq4p" => ladspa.activate;

    fun int aMode()
    {
        ladspa.get(0) $ int => int i;
        return i;
    }

    fun int aMode(int i)
    {
        Constrain.constrain(i, 0, 9) => int v;
        ladspa.set(0, v);
        return v;
    }

    fun string aModeName()
    {
        aMode() => int i;
        if (i == -1)
        {
            return "off";
        }
        else if (i == 0)
        {
            return "lowshelve";
        }
        else if (i == 1)
        {
            return "band";
        }
        return "hishelve";
    }

    fun string aModeName(string s)
    {
        if ("off" == s)
        {
            aMode(-1);
        }
        else if ("lowshelve" == s)
        {
            aMode(0);
        }
        else if ("band" == s)
        {
            aMode(1);
        }
        else if ("hishelve" == s)
        {
            aMode(2);
        }
        return aModeName();
    }

    fun float aF()
    {
        return ladspa.get(1);
    }

    fun float aF(float f)
    {
        Constrain.constrainf(f, 20.0, 14000.0) => float v;
        ladspa.set(1, v);
        return v;
    }

    fun float aQ()
    {
        return ladspa.get(2);
    }

    fun float aQ(float f)
    {
        Constrain.constrainf(f, 0.0, 1.0) => float v;
        ladspa.set(2, v);
        return v;
    }

    fun float aGain()
    {
        return ladspa.get(3);
    }

    fun float aGain(float f)
    {
        Constrain.constrainf(f, -48.0, 24.0) => float v;
        ladspa.set(3, v);
        return v;
    }

    fun void a(string mode, float f, float q, float gain)
    {
        aModeName(mode);
        aF(f);
        aQ(q);
        aGain(gain);
    }


    fun int bMode()
    {
        ladspa.get(4) $ int => int i;
        return i;
    }

    fun int bMode(int i)
    {
        Constrain.constrain(i, 0, 9) => int v;
        ladspa.set(4, v);
        return v;
    }

    fun string bModeName()
    {
        bMode() => int i;
        if (i == -1)
        {
            return "off";
        }
        else if (i == 0)
        {
            return "lowshelve";
        }
        else if (i == 1)
        {
            return "band";
        }
        return "hishelve";
    }

    fun string bModeName(string s)
    {
        if ("off" == s)
        {
            bMode(-1);
        }
        else if ("lowshelve" == s)
        {
            bMode(0);
        }
        else if ("band" == s)
        {
            bMode(1);
        }
        else if ("hishelve" == s)
        {
            bMode(2);
        }
        return bModeName();
    }

    fun float bF()
    {
        return ladspa.get(5);
    }

    fun float bF(float f)
    {
        Constrain.constrainf(f, 20.0, 14000.0) => float v;
        ladspa.set(5, v);
        return v;
    }

    fun float bQ()
    {
        return ladspa.get(6);
    }

    fun float bQ(float f)
    {
        Constrain.constrainf(f, 0.0, 1.0) => float v;
        ladspa.set(6, v);
        return v;
    }

    fun float bGain()
    {
        return ladspa.get(7);
    }

    fun float bGain(float f)
    {
        Constrain.constrainf(f, -48.0, 24.0) => float v;
        ladspa.set(7, v);
        return v;
    }

    fun void b(string mode, float f, float q, float gain)
    {
        bModeName(mode);
        bF(f);
        bQ(q);
        bGain(gain);
    }


    fun int cMode()
    {
        ladspa.get(8) $ int => int i;
        return i;
    }

    fun int cMode(int i)
    {
        Constrain.constrain(i, 0, 9) => int v;
        ladspa.set(8, v);
        return v;
    }

    fun string cModeName()
    {
        cMode() => int i;
        if (i == -1)
        {
            return "off";
        }
        else if (i == 0)
        {
            return "lowshelve";
        }
        else if (i == 1)
        {
            return "band";
        }
        return "hishelve";
    }

    fun string cModeName(string s)
    {
        if ("off" == s)
        {
            cMode(-1);
        }
        else if ("lowshelve" == s)
        {
            cMode(0);
        }
        else if ("band" == s)
        {
            cMode(1);
        }
        else if ("hishelve" == s)
        {
            cMode(2);
        }
        return cModeName();
    }

    fun float cF()
    {
        return ladspa.get(9);
    }

    fun float cF(float f)
    {
        Constrain.constrainf(f, 20.0, 14000.0) => float v;
        ladspa.set(9, v);
        return v;
    }

    fun float cQ()
    {
        return ladspa.get(10);
    }

    fun float cQ(float f)
    {
        Constrain.constrainf(f, 0.0, 1.0) => float v;
        ladspa.set(10, v);
        return v;
    }

    fun float cGain()
    {
        return ladspa.get(11);
    }

    fun float cGain(float f)
    {
        Constrain.constrainf(f, -48.0, 24.0) => float v;
        ladspa.set(11, v);
        return v;
    }

    fun void c(string mode, float f, float q, float gain)
    {
        cModeName(mode);
        cF(f);
        cQ(q);
        cGain(gain);
    }


    fun int dMode()
    {
        ladspa.get(12) $ int => int i;
        return i;
    }

    fun int dMode(int i)
    {
        Constrain.constrain(i, 0, 9) => int v;
        ladspa.set(12, v);
        return v;
    }

    fun string dModeName()
    {
        dMode() => int i;
        if (i == -1)
        {
            return "off";
        }
        else if (i == 0)
        {
            return "lowshelve";
        }
        else if (i == 1)
        {
            return "band";
        }
        return "hishelve";
    }

    fun string dModeName(string s)
    {
        if ("off" == s)
        {
            dMode(-1);
        }
        else if ("lowshelve" == s)
        {
            dMode(0);
        }
        else if ("band" == s)
        {
            dMode(1);
        }
        else if ("hishelve" == s)
        {
            dMode(2);
        }
        return dModeName();
    }

    fun float dF()
    {
        return ladspa.get(13);
    }

    fun float dF(float f)
    {
        Constrain.constrainf(f, 20.0, 14000.0) => float v;
        ladspa.set(13, v);
        return v;
    }

    fun float dQ()
    {
        return ladspa.get(14);
    }

    fun float dQ(float f)
    {
        Constrain.constrainf(f, 0.0, 1.0) => float v;
        ladspa.set(14, v);
        return v;
    }

    fun float dGain()
    {
        return ladspa.get(15);
    }

    fun float dGain(float f)
    {
        Constrain.constrainf(f, -48.0, 24.0) => float v;
        ladspa.set(15, v);
        return v;
    }

    fun void d(string mode, float f, float q, float gain)
    {
        dModeName(mode);
        dF(f);
        dQ(q);
        dGain(gain);
    }
}
