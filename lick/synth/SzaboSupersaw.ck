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

// approximation of supersaw, coefficients from Szabo
// https://www.adamszabo.com/internet/adam_szabo_how_to_emulate_the_super_saw.pdf

public class SzaboSupersaw extends Chugraph
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
        f * 0.88997686 => saw1.freq;
        f * 0.93711560 => saw2.freq;
        f * 0.98047643 => saw3.freq;
        f => saw4.freq;
        f * 1.01991221 => saw5.freq;
        f * 1.06216538 => saw6.freq;
        f * 1.10745242 => saw7.freq;
        return f;
    }
}