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

adc => Hall hall => dac;

hall.stop();
0.8 => hall.mix;

class Toggle extends Procedure
{
    fun void run()
    {
        hall.toggle();
        <<<"running", hall.running()>>>;
    }
}

class DecayUp extends Procedure
{
    fun void run()
    {
        hall.decay() * 1.1 => hall.decay;
        <<<"decay", hall.decay()>>>;
    }
}

class DecayDown extends Procedure
{
    fun void run()
    {
        hall.decay() * 0.96 => hall.decay;
        <<<"decay", hall.decay()>>>;
    }
}

class FeedbackUp extends Procedure
{
    fun void run()
    {
        hall.feedback() * 1.1 => hall.feedback;
        <<<"feedback", hall.feedback()>>>;
    }
}

class FeedbackDown extends Procedure
{
    fun void run()
    {
        hall.feedback() * 0.96 => hall.feedback;
        <<<"feedback", hall.feedback()>>>;
    }
}

Toggle toggle;
DecayUp decayUp;
DecayDown decayDown;
FeedbackUp feedbackUp;
FeedbackDown feedbackDown;

StompKeyboard stomp;
toggle @=> stomp.button0Down;
decayUp @=> stomp.button1Down;
decayDown @=> stomp.button2Down;
feedbackUp @=> stomp.button3Down;
feedbackDown @=> stomp.button4Down;

stomp.open(0);
