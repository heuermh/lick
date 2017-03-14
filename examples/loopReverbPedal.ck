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

adc => LoopReverb loopReverb => dac;

0.9 => loopReverb.mix;

class Toggle extends Procedure
{
    fun void run()
    {
        loopReverb.toggle();
        <<<"running", loopReverb.running()>>>;
    }
}

class IncreaseFeedback extends Procedure
{
    fun void run()
    {
        Constrain.constrainf(loopReverb.feedback() * 1.1, 0.0, 1.0) => loopReverb.feedback;
        <<<"feedback", loopReverb.feedback()>>>;
    }
}

class DecreaseFeedback extends Procedure
{
    fun void run()
    {
        Constrain.constrainf(loopReverb.feedback() * 0.9, 0.0, 1.0) => loopReverb.feedback;
        <<<"feedback", loopReverb.feedback()>>>;
    }
}

class IncreaseCoefficient extends Procedure
{
    fun void run()
    {
        Constrain.constrainf(loopReverb.coefficient() * 1.05, 0.0, 1.0) => loopReverb.coefficient;
        <<<"coefficient", loopReverb.coefficient()>>>;
    }
}

class DecreaseCoefficient extends Procedure
{
    fun void run()
    {
        Constrain.constrainf(loopReverb.coefficient() * 0.95, 0.0, 1.0) => loopReverb.coefficient;
        <<<"coefficient", loopReverb.coefficient()>>>;
    }
}

class Panic extends Procedure
{
    fun void run()
    {
        <<<"panic!">>>;
        0.05 => loopReverb.feedback;
        <<<"feedback", loopReverb.feedback()>>>;
        0.5 => loopReverb.coefficient;
        <<<"coefficient", loopReverb.coefficient()>>>;
    }
}

Toggle toggle;
IncreaseFeedback increaseFeedback;
DecreaseFeedback decreaseFeedback;
IncreaseCoefficient increaseCoefficient;
DecreaseCoefficient decreaseCoefficient;
Panic panic;

StompKeyboard stomp;
toggle @=> stomp.button0Down;
increaseFeedback @=> stomp.button1Down;
decreaseFeedback @=> stomp.button2Down;
increaseCoefficient @=> stomp.button3Down;
decreaseCoefficient @=> stomp.button4Down;
panic @=> stomp.button5Down;

stomp.open(0);
