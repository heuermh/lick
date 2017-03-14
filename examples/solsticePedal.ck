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

adc => Solstice solstice => dac;

0.8 => solstice.mix;

class Toggle extends Procedure
{
    fun void run()
    {
        solstice.toggle();
        <<<"running", solstice.running()>>>;
    }
}

class IncreaseFeedback extends Procedure
{
    fun void run()
    {
        Constrain.constrainf(solstice.feedback1() * 1.1, 0.1, 0.5) => solstice.feedback1;
        Constrain.constrainf(solstice.feedback2() * 1.1, 0.1, 0.5) => solstice.feedback2;
        <<<"feedback1", solstice.feedback1(), "feedback2", solstice.feedback2()>>>;
    }
}

class DecreaseFeedback extends Procedure
{
    fun void run()
    {
        Constrain.constrainf(solstice.feedback1() * 0.9, 0.1, 0.5) => solstice.feedback1;
        Constrain.constrainf(solstice.feedback2() * 0.9, 0.1, 0.5) => solstice.feedback2;
        <<<"feedback1", solstice.feedback1(), "feedback2", solstice.feedback2()>>>;
    }
}

Toggle toggle;
IncreaseFeedback increaseFeedback;
DecreaseFeedback decreaseFeedback;

StompKeyboard stomp;
toggle @=> stomp.button0Down;
increaseFeedback @=> stomp.button1Down;
decreaseFeedback @=> stomp.button2Down;

stomp.open(0);
