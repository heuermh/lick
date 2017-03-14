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

// wrapper for Rubber Band Mono Pitch Shifter LADSPA plugin, http://breakfastquay.com/rubberband/
public class RubberBand extends Ladspa
{
    prefix + "ladspa-rubberband.so" => ladspa.load;
    "rubberband-pitchshifter-mono" => ladspa.activate;

    fun void about()
    {
        <<<"Rubber Band Library\nhttp://breakfastquay.com/rubberband/\nGNU General Public License, version 2">>>;
    }

    fun float latency()
    {
        return ladspa.get(0);
    }

    fun float cents()
    {
        return ladspa.get(1);
    }

    fun float cents(float f)
    {
        Constrain.constrainf(f, -100.0, 100.0) => float v;
        ladspa.set(1, v);
        return v;
    }

    fun float semitones()
    {
        return ladspa.get(2);
    }

    fun float semitones(float f)
    {
        Constrain.constrainf(f, -12.0, 12.0) => float v;
        ladspa.set(2, v);
        return v;
    }

    fun float octaves()
    {
        return ladspa.get(3);
    }

    fun float octaves(float f)
    {
        Constrain.constrainf(f, -3.0, 3.0) => float v;
        ladspa.set(3, v);
        return v;
    }

    fun float interval()
    {
        /*

          double oct = (m_octaves ? *m_octaves : 0.0);
          oct += (m_semitones ? *m_semitones : 0.0) / 12;
          oct += (m_cents ? *m_cents : 0.0) / 1200;
          m_ratio = pow(2.0, oct);

        */
        octaves() => float o;
        semitones() => float s;
        cents() => float c;

        return Math.pow(2.0, c + (s / 12.0) + (c / 1200.0));
    }

    fun float interval(float f)
    {
        // this may work if rubberband doesn't truncate m_octaves to integer
        return octaves(f);
    }

    fun float interval(Interval v)
    {
        return interval(v.evaluate(1.0));
    }

    fun float shift()
    {
        return interval();
    }

    fun float shift(float f)
    {
        return interval(f);
    }

    /*

      "Crispness" levels:

        0   equivalent to --no-transients --no-lamination --window-long
        1   equivalent to --detector-soft --no-lamination --window-long (for piano)
        2   equivalent to --no-transients --no-lamination
        3   equivalent to --no-transients
        4   equivalent to --bl-transients
        5   default processing options
        6   equivalent to --no-lamination --window-short (may be good for drums)

    */
    fun float crisp()
    {
        return ladspa.get(4);
    }

    fun float crisp(float f)
    {
        Constrain.constrainf(f, 0.0, 3.0) => float v;
        ladspa.set(4, v);
        return v;
    }
}
