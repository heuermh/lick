/*

    LiCK  Library for ChucK.
    Copyright (c) 2007-2019 held jointly by the individual authors.

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
Ecco.even(ts) @=> Ecco ecco;

0.8 => ecco.mix;
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
