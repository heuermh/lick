/*

    LiCK  Library for ChucK.
    Copyright (c) 2007-2024 held jointly by the individual authors.

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

adc => Verb verb => dac;

verb.stop();
0.8 => verb.mix;

class Toggle extends Procedure
{
    fun void run()
    {
        verb.toggle();
        <<<"running", verb.running()>>>;
    }
}

class DecayUp extends Procedure
{
    fun void run()
    {
        verb.decay() * 1.1 => verb.decay;
        <<<"decay", verb.decay()>>>;
    }
}

class DecayDown extends Procedure
{
    fun void run()
    {
        verb.decay() * 0.96 => verb.decay;
        <<<"decay", verb.decay()>>>;
    }
}

class FeedbackUp extends Procedure
{
    fun void run()
    {
        verb.feedback() * 1.1 => verb.feedback;
        <<<"feedback", verb.feedback()>>>;
    }
}

class FeedbackDown extends Procedure
{
    fun void run()
    {
        verb.feedback() * 0.96 => verb.feedback;
        <<<"feedback", verb.feedback()>>>;
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
