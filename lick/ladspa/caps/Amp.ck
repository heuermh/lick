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

// wrapper for C*APS AmpVTS LADSPA plugin, http://quitte.de/dsp/caps.html#AmpVTS
public class Amp extends Caps
{
    "AmpVTS" => ladspa.activate;

    string overNames[3];
    int overIds[3];
    string tonestackNames[9];
    int tonestackIds[9];

    {
        "2x" => overNames[0];
        "4x" => overNames[1];
        "8x" => overNames[2];

        0 => overIds["2x"];
        1 => overIds["4x"];
        2 => overIds["8x"];

        "basswoman" => tonestackNames[0];
        "twin" => tonestackNames[1];
        "wookie" => tonestackNames[2];
        "DC 30" => tonestackNames[3];
        "juice 800" => tonestackNames[4];
        "stanford" => tonestackNames[5];
        "HK 20" => tonestackNames[6];
        "nihon ace" => tonestackNames[7];
        "porky" => tonestackNames[8];

        0 => tonestackIds["basswoman"];
        1 => tonestackIds["twin"];
        2 => tonestackIds["wookie"];
        3 => tonestackIds["DC 30"];
        4 => tonestackIds["juice 800"];
        5 => tonestackIds["stanford"];
        6 => tonestackIds["HK 20"];
        7 => tonestackIds["nihon ace"];
        8 => tonestackIds["porky"];
    }

    fun int over()
    {
        ladspa.get(0) $ int => int i;
        return i;
    }

    fun int over(int i)
    {
        Constrain.constrain(i, 0, 2) => int v;
        ladspa.set(0, v);
        return v;
    }

    fun string overName()
    {
        return overNames[over()];
    }

    fun string overName(string s)
    {
        over(overIds[s]) => int i;
        return overNames[i];
    }

    // gain --> drive
    fun float drive()
    {
        return ladspa.get(1);
    }

    fun float drive(float f)
    {
        Constrain.constrainf(f, 0.0, 1.0) => float v;
        ladspa.set(1, v);
        return v;
    }

    fun float bright()
    {
        return ladspa.get(2);
    }

    fun float bright(float f)
    {
        Constrain.constrainf(f, 0.0, 1.0) => float v;
        ladspa.set(2, v);
        return v;
    }

    fun float power()
    {
        return ladspa.get(3);
    }

    fun float power(float f)
    {
        Constrain.constrainf(f, 0.0, 1.0) => float v;
        ladspa.set(3, v);
        return v;
    }

    fun int tonestack()
    {
        ladspa.get(4) $ int => int i;
        return i;
    }

    fun int tonestack(int i)
    {
        Constrain.constrain(i, 0, 8) => int v;
        ladspa.set(4, v);
        return v;
    }

    fun string tonestackName()
    {
        return tonestackNames[tonestack()];
    }

    fun string tonestackName(string s)
    {
        tonestack(tonestackIds[s]) => int i;
        return tonestackNames[i];
    }

    fun float bass()
    {
        return ladspa.get(5);
    }

    fun float bass(float f)
    {
        Constrain.constrainf(f, 0.0, 1.0) => float v;
        ladspa.set(5, v);
        return v;
    }

    fun float mid()
    {
        return ladspa.get(6);
    }

    fun float mid(float f)
    {
        Constrain.constrainf(f, 0.0, 1.0) => float v;
        ladspa.set(6, v);
        return v;
    }

    fun float treble()
    {
        return ladspa.get(7);
    }

    fun float treble(float f)
    {
        Constrain.constrainf(f, 0.0, 1.0) => float v;
        ladspa.set(7, v);
        return v;
    }

    fun float attack()
    {
        return ladspa.get(8);
    }

    fun float attack(float f)
    {
        Constrain.constrainf(f, 0.0, 1.0) => float v;
        ladspa.set(8, v);
        return v;
    }

    fun float squash()
    {
        return ladspa.get(9);
    }

    fun float squash(float f)
    {
        Constrain.constrainf(f, 0.0, 1.0) => float v;
        ladspa.set(9, v);
        return v;
    }

    fun float lowcut()
    {
        return ladspa.get(10);
    }

    fun float lowcut(float f)
    {
        Constrain.constrainf(f, 0.0, 1.0) => float v;
        ladspa.set(10, v);
        return v;
    }
}
