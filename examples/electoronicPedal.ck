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

@import "../lick/device/StompKeyboard"
@import "../lick/duration/TimeSignature"
@import "../lick/effect/Electoronic"

TimeSignature.common(110) @=> TimeSignature ts;
Electoronic.create(ts) @=> Electoronic electoronic;

0.8 => electoronic.mix;
0.9 => electoronic.feedback;

electoronic.stop();

class Toggle extends Procedure
{
    fun void run()
    {
        electoronic.toggle();
        <<<"running", electoronic.running()>>>;
    }
}

adc => electoronic => dac;

Toggle toggle;

StompKeyboard stomp;
toggle @=> stomp.button0Down;

stomp.open(0);
