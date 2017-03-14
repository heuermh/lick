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

public class BassDelay2 extends Chubgraph
{
    SinOsc _pulse;
    ADSR _adsr;
    MonoDelay2 _delay;

    0.8 => _pulse.gain;

    8::ms => _adsr.attackTime;
    8::ms => _adsr.decayTime;
    10::ms => _adsr.releaseTime;
    0.8 => _adsr.sustainLevel;

    100::ms => dur _period;

    1.0 => float _x;
    1.0 => _delay.mix;

    inlet => blackhole;
    _pulse => _adsr => _delay => outlet;

    fun void noteOn(int note)
    {
        noteOn(Std.mtof(note));
    }
 
    fun void noteOn(float freq)
    {
        (1::second / freq) * 10 => _period;
        freq => _pulse.freq;

        0.0 => _delay.gain;
        _period * _x => _delay.delay;
        10::ms => now;
        1.0 => _delay.gain;

        1 => _adsr.keyOn;
        (_period - _adsr.attackTime() - _adsr.decayTime()) => now;
        1 => _adsr.keyOff;
    }

    fun void noteOff()
    {
        // empty
    }

    fun float x() // delay time, factor, weight, multiplier?
    {
        return _x;
    }

    fun float x(float f)
    {
        Math.max(1.0, f) => _x;
    }

    fun float feedback()
    {
        return _delay.feedback();
    }

    fun float feedback(float f)
    {
        return _delay.feedback(f);
    }

    fun dur max()
    {
        return _delay.max();
    }

    fun dur max(dur d)
    {
        return _delay.max(d);
    }
}
