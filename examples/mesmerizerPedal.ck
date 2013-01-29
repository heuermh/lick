/*

    LiCK  Library for ChucK.
    Copyright (c) 2007-2013 held jointly by the individual authors.

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

adc => Mesmerizer mesmerizer => dac;

class Toggle extends Procedure
{
    fun void run()
    {
        mesmerizer.toggle();
        <<<"running", mesmerizer.running>>>;
    }
}

class IncreaseLfoFreq extends Procedure
{
    fun void run()
    {
        mesmerizer._lfoFreq * 1.1 => float lfoFreq;
        lfoFreq => mesmerizer.lfoFreq;
        <<<"lfo freq", lfoFreq>>>;
    }
}

class DecreaseLfoFreq extends Procedure
{
    fun void run()
    {
        mesmerizer._lfoFreq * 0.9 => float lfoFreq;
        lfoFreq => mesmerizer.lfoFreq;
        <<<"lfo freq", lfoFreq>>>;
    }
}

class IncreasePhasorLfoDepth extends Procedure
{
    fun void run()
    {
        mesmerizer._phasorLfoDepth * 1.1 => float phasorLfoDepth;
        phasorLfoDepth => mesmerizer.phasorLfoDepth;
        <<<"phasor lfo depth", phasorLfoDepth>>>;
    }
}

class DecreasePhasorLfoDepth extends Procedure
{
    fun void run()
    {
        mesmerizer._phasorLfoDepth * 0.9 => float phasorLfoDepth;
        phasorLfoDepth => mesmerizer.phasorLfoDepth;
        <<<"phasor lfo depth", phasorLfoDepth>>>;
    }
}

Toggle toggle;
IncreaseLfoFreq increaseLfoFreq;
DecreaseLfoFreq decreaseLfoFreq;
IncreasePhasorLfoDepth increasePhasorLfoDepth;
DecreasePhasorLfoDepth decreasePhasorLfoDepth;

StompKeyboard stomp;
toggle @=> stomp.button0Down;
increaseLfoFreq @=> stomp.button1Down;
decreaseLfoFreq @=> stomp.button2Down;
increasePhasorLfoDepth @=> stomp.button3Down;
decreasePhasorLfoDepth @=> stomp.button4Down;

stomp.open(0);