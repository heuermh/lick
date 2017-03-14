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

// wrapper for SWH Plugins Higher Quality Pitch Scaler LADSPA plugin,
//   http://www.plugin.org.uk/ladspa-swh/docs/ladspa-swh.html#id1194
public class PitchScale extends Swh
{
    prefix + "pitch_scale_1194.so" => ladspa.load;
    "pitchScaleHQ" => ladspa.activate;

    fun float shift()
    {
        return pitchCoefficient();
    }

    fun float shift(float f)
    {
        return pitchCoefficient(f);
    }

    fun float pitchCoefficient()
    {
        return ladspa.get(0);
    }

    fun float pitchCoefficient(float f)
    {
        Constrain.constrainf(f, 0.5, 2.0) => float v;
        ladspa.set(0, v);
        return v;
    }

    fun float latency()
    {
        return ladspa.get(1);
    }
}
