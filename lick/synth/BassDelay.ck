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
// inspired by the documentation accompanying the bass synth
//
// Critter & Guitari Bolsa Bass 
// Buy one here:  http://www.critterandguitari.com/products/bolsa-bass
//

public class BassDelay extends Chubgraph
{
    SinOsc _pulse;
    MonoDelay2 _delay;

    1.0 => float _x;
    1.0 => _delay.mix;
    //0.6 => _delay.feedback;
    //2::second => _delay.max;

    inlet => blackhole;
    _delay => outlet;

    fun void noteOn(int note)
    {
        noteOn(Std.mtof(note));
    }
 
    fun void noteOn(float freq)
    {
        1::second / freq => dur period;

        period * _x => _delay.delay;

        0.0 => _pulse.phase;
        freq => _pulse.freq;
        _pulse => _delay;

        period * 32.0 => now;
        _pulse =< _delay;
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
        Constrain.constrainf(f, 1.0, 4.0) => _x;
        //period * _x => _delay.delay;
    }

    fun float feedback()
    {
        return _delay.feedback();
    }

    fun float feedback(float f)
    {
        return _delay.feedback(f);
    }
}
