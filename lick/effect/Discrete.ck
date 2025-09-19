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

// todo: params need tweaking

public class Discrete extends Effect
{
   DigitalDelay preDelay;
   AnalogDelay line1;
   AnalogDelay line2;
   AnalogDelay line3;
   Gain sum;
   Gain feedback;
   DigitalDelay killDry;
   Gain split;
   Mesmerizer chorus;
   LPF lpf;
   HPF hpf;

   inlet => preDelay => line1 => line2 => line3 => sum;
   sum => killDry => split;
   split => feedback => sum;
   split => chorus => lpf => hpf => wet;

   {
        100::ms => preDelay.max;
        1::second => line1.max;
        1::second => line2.max;
        1::second => line3.max;
        100::ms => killDry.max;

        15::ms => preDelay.delay;
        37::ms => line1.delay;
        67::ms => line2.delay;
        91::ms => line3.delay;
        3::ms => killDry.delay;

        1.0 => preDelay.mix;
        0.1 => line1.mix;
        0.5 => line2.mix;
        0.8 => line3.mix;
        1.0 => killDry.mix;

        0.9 => chorus.mix;
        1.1 => feedback.gain;
   }
}
