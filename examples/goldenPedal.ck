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

TimeSignature.common(110) @=> TimeSignature ts;
Golden.goldenEighths(ts) @=> Golden golden;

0.4 => golden.mix;

0.3 => golden.mix1;
0.2 => golden.mix2;
0.3 => golden.mix3;
0.3 => golden.mix4;

0.2 => golden.feedback1;
0.3 => golden.feedback2;
0.3 => golden.feedback3;
0.1 => golden.feedback4;

golden.stop();

class Toggle extends Procedure
{
    fun void run()
    {
        golden.toggle();
        <<<"running", golden.running()>>>;
    }
}

adc => golden => dac;

Toggle toggle;

StompKeyboard stomp;
toggle @=> stomp.button0Down;

<<<"ready">>>;
stomp.open(0);
