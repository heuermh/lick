/*

    LiCK  Library for ChucK.
    Copyright (c) 2007-2025 held jointly by the individual authors.

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

@import "Feedback"
@import "../dist/Invert"

public class Presence extends Feedback
{

    /*
        inlet --> pre ------------------->  gain  ---------------------> post --> wet
                   ^                                                       |
                   |                                                       |
                   +--- feedbackIn <-- _lpf <-- _invert <-- feedbackOut <--+

    */

    LPF _lpf;
    Invert _invert;

    pre => post;
    feedbackOut => _invert => _lpf => feedbackIn;

    {
        0.4 => feedback;
        800.0 => freq;
    }


    fun void panic()
    {
        0.0 => feedback;
    }

    fun float feedback()
    {
        return feedbackIn.gain();
    }

    fun float feedback(float f)
    {
        f => feedbackIn.gain;
        return f;
    }

    fun float freq()
    {
        return _lpf.freq();
    }

    fun float freq(float f)
    {
        f => _lpf.freq;
        return f;
    }

    fun float resonance()
    {
        return _lpf.Q();
    }

    fun float resonance(float f)
    {
        f => _lpf.Q;
        return f;
    }

    fun float presence()
    {
        return 1.0 - feedback();
    }

    fun float presence(float f)
    {
        return 1.0 - feedback(1.0 - f);
    }

    fun static Presence create(float p)
    {
        Presence presence;
        p => presence.presence;
        return presence;
    }
}
