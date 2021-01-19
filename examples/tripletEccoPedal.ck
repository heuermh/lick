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

TimeSignature.common(80) @=> TimeSignature ts;
Ecco.triplet(ts) @=> Ecco ecco;

0.3 => ecco.mix;

0.2 => ecco.mix1;
0.4 => ecco.mix2;
0.4 => ecco.mix3;
0.6 => ecco.mix4;

0.2 => ecco.feedback1;
0.3 => ecco.feedback2;
0.2 => ecco.feedback3;
0.1 => ecco.feedback4;

ecco.stop();

class Toggle extends Procedure
{
    fun void run()
    {
        ecco.toggle();
        <<<"running", ecco.running()>>>;
    }
}

adc => ecco => dac;

Toggle toggle;

StompKeyboard stomp;
toggle @=> stomp.button0Down;

<<<"ready">>>;
stomp.open(0);
