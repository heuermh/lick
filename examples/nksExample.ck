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

Nks nks => dac;
Sometimes sometimes;

60::ms => nks.closedDecay;

for (0 => int i; i < 64; i++)
{
    if (i % 8 == 0)
    {
        80.0f + Math.random2f(0.0f, 120.0f) => nks.freq;
    }
    if (i % 4 == 0)
    {
        7000.0f + Math.random2f(-500.0f, 1000.0f) => nks.bandpassCutoff;
        3400.0f + Math.random2f(-1200.0f, 3000.0f) => nks.highpassCutoff;
    }
    60::ms + (Math.random2f(-10.0f, 20.0f) * 1::ms) => nks.closedDecay;
    180::ms + (Math.random2f(-20.0f, 20.0f) * 1::ms) => nks.openDecay;
 
    0.6f + Math.random2f(0.0f, 0.5f) => nks.accent;

    <<<"freq", nks.freq(), "closedDecay", nks.closedDecay(), "openDecay", nks.openDecay(), "state", nks.state(), "bpfCutoff", nks.bandpassCutoff(), "bpfResonance", nks.bandpassResonance(), "hpfCutoff", nks.highpassCutoff(), "hpfResonance", nks.highpassResonance(), "accent", nks.accent()>>>;

    if (sometimes.test())
    {
        nks.playOpen();
    }
    else
    {
        nks.playClosed();
    }
    200::ms => now;
}
<<<"done">>>;
