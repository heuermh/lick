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

// approximation of supersaw, coefficients from Giulioz
// https://www.youtube.com/watch?v=XM_q5T7wTpQ

public class GiuliozSupersaw extends Chugraph
{
    SawOsc saw1;
    SawOsc saw2;
    SawOsc saw3;
    SawOsc saw4;
    SawOsc saw5;
    SawOsc saw6;
    SawOsc saw7;
    Mixer.create(7) @=> Mixer mixer;
    HPF hpf;

    float _freq;

    mixer => hpf => outlet;

    {
        saw1 => mixer.input(0);
        saw2 => mixer.input(1);
        saw3 => mixer.input(2);
        saw4 => mixer.input(3);
        saw5 => mixer.input(4);
        saw6 => mixer.input(5);
        saw7 => mixer.input(6);
    }

    fun float freq()
    {
        return _freq;
    }

    fun float freq(float f)
    {
        f * (1.0f - 0.10986328125f) => saw1.freq;
        f * (1.0f - 0.0628662109375f) => saw2.freq;
        f * (1.0f - 0.01953125f) => saw3.freq;
        f => saw4.freq;
        f * 1.01953125f => saw5.freq;
        f * 1.062255859375f => saw6.freq;
        f * 1.107421875f => saw7.freq;
        return f;
    }
}
