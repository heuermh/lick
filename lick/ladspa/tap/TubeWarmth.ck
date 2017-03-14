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

// wrapper for TAP-plugins TubeWarmth LADSPA plugin,
//   http://tap-plugins.sourceforge.net/ladspa/tubewarmth.html
public class TubeWarmth extends Tap
{
    prefix + "tap_tubewarmth.so" => ladspa.load;
    "tap_tubewarmth" => ladspa.activate;

    fun float drive()
    {
        return ladspa.get(0);
    }

    fun float drive(float f)
    {
        Constrain.constrainf(f, 0.1, 10.0) => float v;
        ladspa.set(0, v);
        return v;
    }

    fun float blend()
    {
        return ladspa.get(1);
    }

    fun float blend(float f)
    {
        Constrain.constrainf(f, -10.0, 10.0) => float v;
        ladspa.set(0, v);
        return v;
    }

    fun float moreTape()
    {
        return blend(blend() - 1.0);
    }

    fun float lessTape()
    {
        return blend(blend() + 1.0);
    }

    fun float moreTube()
    {
        return lessTape();
    }

    fun float lessTube()
    {
        return moreTape();
    }
}
