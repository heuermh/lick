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

public class Reverse extends Feedback
{
    600::ms => dur _max;
    600::ms => dur _delay;
    ReverseBuffer @ _reverse;
    ReverseBuffer.create(_max) @=> _reverse;

    pre => _reverse => post;
    feedbackOut => LPF _lpf => feedbackIn;

    {
        delay(_delay);
        feedback(0.2);
        8000.0 => _lpf.freq;
    }

    fun dur max()
    {
        return _max;
    }

    fun dur max(dur d)
    {
        d => _max;
        // todo: might have to disconnect/reconnect here
        ReverseBuffer.create(d) @=> _reverse;
        return _max;
    }

    fun dur delay()
    {
        return _delay;
    }

    fun dur delay(dur d)
    {
        d => _delay;
        (_max/_delay) $ int => _reverse.stride;
        <<<"setting delay to dur", _delay, " stride", _reverse.stride()>>>;
        return _delay;
    }

    fun float cutoff()
    {
        return _lpf.freq();
    }

    fun float cutoff(float f)
    {
        return _lpf.freq(f);
    }

    fun float resonance()
    {
        return _lpf.Q();
    }

    fun float resonance(float f)
    {
        return _lpf.Q(f);
    }

    fun static Reverse create()
    {
        Reverse reverse;
        return reverse;
    }
}
