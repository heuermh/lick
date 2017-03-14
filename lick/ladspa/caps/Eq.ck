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

// wrapper for C*APS Eq10 LADSPA plugin, http://quitte.de/dsp/caps.html#Eq10
public class Eq extends Caps
{
    "Eq10" => ladspa.activate;

    fun float band31Hz()
    {
        return ladspa.get(0);
    }

    fun float band31Hz(float f)
    {
        Constrain.constrainf(f, -48.0, 24.0) => float v;
        ladspa.set(0, v);
        return v;
    }

    fun float band63Hz()
    {
        return ladspa.get(1);
    }

    fun float band63Hz(float f)
    {
        Constrain.constrainf(f, -48.0, 24.0) => float v;
        ladspa.set(1, v);
        return v;
    }

    fun float band125Hz()
    {
        return ladspa.get(2);
    }

    fun float band125Hz(float f)
    {
        Constrain.constrainf(f, -48.0, 24.0) => float v;
        ladspa.set(2, v);
        return v;
    }

    fun float band250Hz()
    {
        return ladspa.get(3);
    }

    fun float band250Hz(float f)
    {
        Constrain.constrainf(f, -48.0, 24.0) => float v;
        ladspa.set(3, v);
        return v;
    }

    fun float band500Hz()
    {
        return ladspa.get(4);
    }

    fun float band500Hz(float f)
    {
        Constrain.constrainf(f, -48.0, 24.0) => float v;
        ladspa.set(4, v);
        return v;
    }

    fun float band1kHz()
    {
        return ladspa.get(5);
    }

    fun float band1kHz(float f)
    {
        Constrain.constrainf(f, -48.0, 24.0) => float v;
        ladspa.set(5, v);
        return v;
    }

    fun float band2kHz()
    {
        return ladspa.get(6);
    }

    fun float band2kHz(float f)
    {
        Constrain.constrainf(f, -48.0, 24.0) => float v;
        ladspa.set(6, v);
        return v;
    }

    fun float band4kHz()
    {
        return ladspa.get(7);
    }

    fun float band4kHz(float f)
    {
        Constrain.constrainf(f, -48.0, 24.0) => float v;
        ladspa.set(7, v);
        return v;
    }

    fun float band8kHz()
    {
        return ladspa.get(8);
    }

    fun float band8kHz(float f)
    {
        Constrain.constrainf(f, -48.0, 24.0) => float v;
        ladspa.set(8, v);
        return v;
    }

    fun float band16kHz()
    {
        return ladspa.get(9);
    }

    fun float band16kHz(float f)
    {
        Constrain.constrainf(f, -48.0, 24.0) => float v;
        ladspa.set(9, v);
        return v;
    }

    fun void eq(float b31Hz,
                float b63Hz,
                float b125Hz,
                float b250Hz,
                float b500Hz,
                float b1kHz,
                float b2kHz,
                float b4kHz,
                float b8kHz,
                float b16kHz)
    {
        b31Hz => band31Hz;
        b63Hz => band63Hz;
        b125Hz => band125Hz;
        b250Hz => band250Hz;
        b500Hz => band500Hz;
        b1kHz => band1kHz;
        b2kHz => band2kHz;
        b4kHz => band4kHz;
        b8kHz => band8kHz;
        b16kHz => band16kHz;
    }
}
