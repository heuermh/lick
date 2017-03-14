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

// wrapper for C*APS CabinetIV LADSPA plugin, http://quitte.de/dsp/caps.html#CabinetIV
public class Cabinet extends Caps
{
    "CabinetIV" => ladspa.activate;

    string modelNames[25];
    int modelIds[25];

    {
        "mega wookie 800" => modelNames[0];
        "mega wookie 812" => modelNames[1];
        "mega wookie 828" => modelNames[2];
        "mega wookie 868" => modelNames[3];
        "mega wookie 908" => modelNames[4];
        "mega wookie 912" => modelNames[5];
        "mega wookie 936" => modelNames[6];
        "mega wookie 968" => modelNames[7];
        "mega wookie 992" => modelNames[8];
        "unmatched" => modelNames[9];
        "twin A" => modelNames[10];
        "twin B" => modelNames[11];
        "twin C" => modelNames[12];
        "blue A" => modelNames[13];
        "blue B" => modelNames[14];
        "tweedie A" => modelNames[15];
        "tweedie B" => modelNames[16];
        "mini wookie A" => modelNames[17];
        "mini wookie B" => modelNames[18];
        "rosie A" => modelNames[19];
        "rosie B" => modelNames[20];
        "indigo" => modelNames[21];
        "angel" => modelNames[22];
        "sixty-one" => modelNames[23];
        "sixty-two" => modelNames[24];

        0 => modelIds["mega wookie 800"];
        1 => modelIds["mega wookie 812"];
        2 => modelIds["mega wookie 828"];
        3 => modelIds["mega wookie 868"];
        4 => modelIds["mega wookie 908"];
        5 => modelIds["mega wookie 912"];
        6 => modelIds["mega wookie 936"];
        7 => modelIds["mega wookie 968"];
        8 => modelIds["mega wookie 992"];
        9 => modelIds["unmatched"];
        10 => modelIds["twin A"];
        11 => modelIds["twin B"];
        12 => modelIds["twin C"];
        13 => modelIds["blue A"];
        14 => modelIds["blue B"];
        15 => modelIds["tweedie A"];
        16 => modelIds["tweedie B"];
        17 => modelIds["mini wookie A"];
        18 => modelIds["mini wookie B"];
        19 => modelIds["rosie A"];
        20 => modelIds["rosie B"];
        21 => modelIds["indigo"];
        22 => modelIds["angel"];
        23 => modelIds["sixty-one"];
        24 => modelIds["sixty-two"];
    }

    fun int model()
    {
        ladspa.get(0) $ int => int i;
        return i;
    }

    fun int model(int i)
    {
        Constrain.constrain(i, 0, 24) => int v;
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

    // gain --> db
    fun float db()
    {
        return ladspa.get(1);
    }

    fun float db(float f)
    {
        Constrain.constrainf(f, -24.0, 24.0) => float v;
        ladspa.set(1, v);
        return v;
    }
}
