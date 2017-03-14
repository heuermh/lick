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

//
// similar to Solstice effect by user merlinb
//   http://www.diystompboxes.com/smfforum/index.php?topic=97310.0
//

public class Solstice extends Effect
{
    Gain _pre;
    LPF _lpf1;
    Delay _delay1;
    Gain _feedback1;
    LPF _lpf2;
    Gain _split;
    Delay _delay2;
    Gain _feedback2;

    inlet => _pre => _lpf1 => _delay1 => _lpf2 => _split => _delay2 => _feedback2 => _lpf2;
    _split => _feedback1 => _lpf1;
    _split => wet;

    {
        300::ms => _delay1.max;
        20::ms => _delay1.delay;
        2000::ms => _delay2.max;
        160::ms => _delay2.delay;
        5000.0 => _lpf1.freq;
        2000.0 => _lpf2.freq;
        // careful with these
        0.1 => _feedback1.gain;
        0.2 => _feedback2.gain;
    }

    fun dur delay1()
    {
        return _delay1.delay();
    }

    fun dur delay1(dur d)
    {
        d => _delay1.delay;
        return d;
    }

    fun float lpf1()
    {
        return _lpf1.freq();
    }

    fun float lpf1(float f)
    {
        f => _lpf1.freq;
        return f;
    }

    fun float feedback1()
    {
        return _feedback1.gain();
    }

    fun float feedback1(float f)
    {
        f => _feedback1.gain;
        return f;
    }

    fun dur delay2()
    {
        return _delay2.delay();
    }

    fun dur delay2(dur d)
    {
        d => _delay2.delay;
        return d;
    }

    fun float lpf2()
    {
        return _lpf2.freq();
    }

    fun float lpf2(float f)
    {
        f => _lpf2.freq;
        return f;
    }

    fun float feedback2()
    {
        return _feedback2.gain();
    }

    fun float feedback2(float f)
    {
        f => _feedback2.gain;
        return f;
    }

    fun static Solstice create(dur delay1, float lpf1, float feedback1, dur delay2, float lpf2, float feedback2)
    {
        Solstice solstice;
        delay1 => solstice.delay1;
        lpf1 => solstice.lpf1;
        feedback1 => solstice.feedback1;
        delay2 => solstice.delay2;
        lpf2 => solstice.lpf2;
        feedback2 => solstice.feedback2;
        return solstice;
    }
}
