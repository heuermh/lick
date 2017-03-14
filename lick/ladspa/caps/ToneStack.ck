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

// wrapper for C*APS ToneStack LADSPA plugin, http://quitte.de/dsp/caps.html#ToneStack
public class ToneStack extends Caps
{
    "ToneStack" => ladspa.activate;

    string modelNames[10];
    int modelIds[10];

    {                                   // from ToneStack.cc source:
        "basswoman" => modelNames[0];   // 59 Bassman 5F6-A procedural implementation
        "twin" => modelNames[1];        // 69 Twin Reverb AA270             "
        "wookie" => modelNames[2];      // Mesa Dual Rect. 'Orange'         "
        "DC 30" => modelNames[3];       // 59/86 Vox AC-30                  "
        "juice 800" => modelNames[4];   // 59/81 JCM-800 Lead 100 2203      "
        "stanford" => modelNames[5];    // 64 Princeton AA1164              "
        "HK 20" => modelNames[6];       // Huges & Kettner Tube 20          "
        "nihon ace" => modelNames[7];   // Roland Jazz Chorus               "
        "porky" => modelNames[8];       // Pignose G40V                     "
        "5F6-A LT" => modelNames[9];    // 59 Bassman 5F6-A lattice filter implementation

        0 => modelIds["basswoman"];
        1 => modelIds["twin"];
        2 => modelIds["wookie"];
        3 => modelIds["DC 30"];
        4 => modelIds["juice 800"];
        5 => modelIds["stanford"];
        6 => modelIds["HK 20"];
        7 => modelIds["nihon ace"];
        8 => modelIds["porky"];
        9 => modelIds["5F6-A LT"];
    }

    fun int model()
    {
        ladspa.get(0) $ int => int i;
        return i;
    }

    fun int model(int i)
    {
        Constrain.constrain(i, 0, 9) => int v;
        ladspa.set(0, v);
        return v;
    }

    fun string modelName()
    {
        return modelNames[model()];
    }

    fun string modelName(string s)
    {
        model(modelIds[s]) => int i;
        return modelNames[i];
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
}
