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

adc => Foldback foldback => dac;

foldback.stop();
0.8 => foldback.mix;

class Toggle extends Procedure
{
    fun void run()
    {
        foldback.toggle();
        <<<"running", foldback.running()>>>;
    }
}

class ThresholdUp extends Procedure
{
    fun void run()
    {
        foldback.threshold() * 1.1 => foldback.threshold;
        <<<"threshold", foldback.threshold()>>>;
    }
}

class ThresholdDown extends Procedure
{
    fun void run()
    {
        foldback.threshold() * 0.96 => foldback.threshold;
        <<<"threshold", foldback.threshold()>>>;
    }
}

class IndexUp extends Procedure
{
    fun void run()
    {
        foldback.index() * 1.1 => foldback.index;
        <<<"index", foldback.index()>>>;
    }
}

class IndexDown extends Procedure
{
    fun void run()
    {
        foldback.index() * 0.96 => foldback.index;
        <<<"index", foldback.index()>>>;
    }
}

Toggle toggle;
ThresholdUp thresholdUp;
ThresholdDown thresholdDown;
IndexUp indexUp;
IndexDown indexDown;

StompKeyboard stomp;
toggle @=> stomp.button0Down;
thresholdUp @=> stomp.button1Down;
thresholdDown @=> stomp.button2Down;
indexUp @=> stomp.button3Down;
indexDown @=> stomp.button4Down;

stomp.open(0);
