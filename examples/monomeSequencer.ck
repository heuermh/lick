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

class MonomeSequencer extends Monome
{
    16 => static int H;
    32 => static int W;
    0 => int step;
    W - 1 => int last;
    int pattern[W][H];
    W => int length;
    Sample samples[H];

    fun void tick()
    {
        for (1 => int i; i < H; i++)
        {
            if (pattern[step][i] > 0)
            {
                samples[i - 1].play();
            }
        }
        ledOff(last, 0);
        ledOn(step, 0);

        step => last;
        step + 1 => step;

        if (step >= length)
        {
            0 => step;
        }
    }

    fun void buttonPressed(int x, int y)
    {
        if (y == 0)
        {
            x + 1 => length;
        }
        else
        {
            if (pattern[x][y] == 0)
            {
                ledOn(x, y);
                1 => pattern[x][y];
            }
            else
            {
                ledOff(x, y);
                0 => pattern[x][y];
            }
        }
    }
}

RolandTr909 rolandTr909;
MonomeSequencer monomeSequencer;

rolandTr909.kickA @=> monomeSequencer.samples[0];
rolandTr909.kickB @=> monomeSequencer.samples[1];
rolandTr909.snareA @=> monomeSequencer.samples[2];
rolandTr909.snareB @=> monomeSequencer.samples[3];
rolandTr909.closedHatA @=> monomeSequencer.samples[4];
rolandTr909.closedHatB @=> monomeSequencer.samples[5];
rolandTr909.openHat @=> monomeSequencer.samples[6];
rolandTr909.crash @=> monomeSequencer.samples[7];
rolandTr909.ride @=> monomeSequencer.samples[8];
rolandTr909.rim @=> monomeSequencer.samples[9];
rolandTr909.clap @=> monomeSequencer.samples[10];
rolandTr909.lowTomA @=> monomeSequencer.samples[11];
rolandTr909.lowTomB @=> monomeSequencer.samples[12];
rolandTr909.middleTomA @=> monomeSequencer.samples[13];
rolandTr909.middleTomB @=> monomeSequencer.samples[14];

monomeSequencer.connect();

while (true)
{
    50::ms => now;
    monomeSequencer.tick();
}
