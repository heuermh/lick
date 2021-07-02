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

adc => FeedbackMachine fm => dac;

fm.cascade(0.8);
fm.delay(1700::ms, 1300::ms, 1100::ms, 700::ms);
fm.mix(0.6);
fm.stop();

class Toggle extends Procedure
{
    fun void run()
    {
        fm.toggle();
        <<<"running", fm.running()>>>;
    }
}

Toggle toggle;
StompKeyboard stomp;
toggle @=> stomp.button0Down;

stomp.open(0);
