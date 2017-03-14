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

class MonomeTrigger extends Monome
{
    16 => static int H;
    16 => static int W;
    0 => int step;
    W - 1 => int last;
    Sample samples[W];

    fun void tick()
    {
        ledOff(last, 0);
        ledOn(step, 0);

        step => last;
        step + 1 => step;

        if (step >= W)
        {
            0 => step;
        }
    }

    fun void buttonPressed(int x, int y)
    {
        if (y > 0)
        {
            ledOn(x, y);
            trigger(x, (y / H $ float));
        }
    }

    fun void buttonReleased(int x, int y)
    {
        ledOff(x, y);
    }

    fun void trigger(int index, float velocity)
    {
        samples[index].asFloatProcedure().run(velocity);
    }
}

RolandTr909 rolandTr909;
MonomeTrigger monomeTrigger;

rolandTr909.kickA @=> monomeTrigger.samples[0];
rolandTr909.kickB @=> monomeTrigger.samples[1];
rolandTr909.snareA @=> monomeTrigger.samples[2];
rolandTr909.snareB @=> monomeTrigger.samples[3];
rolandTr909.closedHatA @=> monomeTrigger.samples[4];
rolandTr909.closedHatB @=> monomeTrigger.samples[5];
rolandTr909.openHat @=> monomeTrigger.samples[6];
rolandTr909.crash @=> monomeTrigger.samples[7];
rolandTr909.ride @=> monomeTrigger.samples[8];
rolandTr909.rim @=> monomeTrigger.samples[9];
rolandTr909.clap @=> monomeTrigger.samples[10];
rolandTr909.lowTomA @=> monomeTrigger.samples[11];
rolandTr909.lowTomB @=> monomeTrigger.samples[12];
rolandTr909.middleTomA @=> monomeTrigger.samples[13];
rolandTr909.middleTomB @=> monomeTrigger.samples[14];
rolandTr909.highTomA @=> monomeTrigger.samples[15];

monomeTrigger.connect();

while (true)
{
    200::ms => now;
    monomeTrigger.tick();
}
