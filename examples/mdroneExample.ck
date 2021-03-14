/*

    LiCK  Library for ChucK.
    Copyright (c) 2007-2021 held jointly by the individual authors.

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

Mdrone md => dac;

// TODO unruly filter, _do not use headphones!_

Lfo cutoff => blackhole;
//Lfo resonance => blackhole;

cutoff.sin();
0.01 => cutoff.rate;
1.0 => cutoff.gain;

//resonance.tri();
//0.03 => resonance.rate;
//1.0 => resonance.gain;

spork ~ _tickAtSampleRate();

fun void _tickAtSampleRate()
{
    while (true)
    {
        1::samp => now;
        Interpolate.linear(cutoff.last(), -1.0, 1.0, 110.0, 110000.0) => md.cutoff;
        //Interpolate.linear(resonance.last(), -1.0, 1.0, 0.01, 1.00) => md.resonance;
    }
}

<<<"ready">>>;
for (0 => int i; i < 60; i++)
{
    <<<md.cutoff(), md.resonance()>>>;
    2::second => now;
}
<<<"done">>>;
