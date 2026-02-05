/*

    LiCK  Library for ChucK.
    Copyright (c) 2007-2026 held jointly by the individual authors.

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
// See
// [Figure 4 - a patch diagram from Allen Strange's Electronic Music: Systems, Techniques, and Controls]
// https://www.perfectcircuit.com/signal/modular-synthesizer-notation
//

public class Strange extends Chugraph
{
    float _resonance;

    SawOsc _osc;
    BPF _a;
    BPF _b;
    BPF _c;
    ADSR adsr;
    Gain _mix;
    inlet => blackhole;
    _mix => adsr => outlet;
    _osc => _a => _mix;
    _osc => _b => _mix;
    _osc => _c => _mix;

    {
        32.0 => resonance;

        adsr.set(120::ms, 10::ms, 0.8, 60::ms);

        ee();
    }

    fun void ee()
    {
        270.0 => _a.freq;
        1990.0 => _b.freq;
        3010.0 => _c.freq;

        0.33 => _a.gain;
        0.33 => _b.gain;
        0.33 => _c.gain;
    }

    fun void i()
    {
        390.0 => _a.freq;
        1840.0 => _b.freq;
        2550.0 => _c.freq;

        0.33 => _a.gain;
        0.33 => _b.gain;
        0.33 => _c.gain;
    }

    fun void e()
    {
        530.0 => _a.freq;
        1720.0 => _b.freq;
        2480.0 => _c.freq;

        0.33 => _a.gain;
        0.33 => _b.gain;
        0.33 => _c.gain;
    }

    fun void ae()
    {
        660.0 => _a.freq;
        1090.0 => _b.freq;
        2410.0 => _c.freq;

        0.33 => _a.gain;
        0.33 => _b.gain;
        0.33 => _c.gain;
    }

    fun void ah()
    {
        730.0 => _a.freq;
        1840.0 => _b.freq;
        2440.0 => _c.freq;

        0.33 => _a.gain;
        0.33 => _b.gain;
        0.33 => _c.gain;
    }

    fun void aw()
    {
        570.0 => _a.freq;
        1020.0 => _b.freq;
        2410.0 => _c.freq;

        0.33 => _a.gain;
        0.33 => _b.gain;
        0.33 => _c.gain;
    }

    fun void u()
    {
        440.0 => _a.freq;
        870.0 => _b.freq;
        2240.0 => _c.freq;

        0.33 => _a.gain;
        0.33 => _b.gain;
        0.33 => _c.gain;
    }

    fun void oo()
    {
        300.0 => _a.freq;
        1190.0 => _b.freq;
        2240.0 => _c.freq;

        0.33 => _a.gain;
        0.33 => _b.gain;
        0.33 => _c.gain;
    }

    fun void a()
    {
        640.0 => _a.freq;
        1350.0 => _b.freq;
        2390.0 => _c.freq;

        0.33 => _a.gain;
        0.33 => _b.gain;
        0.33 => _c.gain;
    }

    fun void er()
    {
        490.0 => _a.freq;
        1690.0 => _c.freq;

        0.50 => _a.gain;
        0.0 => _b.gain;
        0.50 => _c.gain;
    }

    fun float freq()
    {
        return _osc.freq();
    }

    fun float freq(float f)
    {
        f => _osc.freq;
        return f;
    }

    fun float resonance()
    {
        return _resonance;
    }

    fun float resonance(float f)
    {
        f => _resonance;
        f => _a.Q;
        f => _b.Q;
        f => _c.Q;
        return f;
    }

    fun void keyOn()
    {
        adsr.keyOn();
    }

    fun void keyOff()
    {
        adsr.keyOff();
    }
}
