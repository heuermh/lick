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

SinOsc sin => MotelSix six => dac;

0.8 => sin.gain;
220.0 => sin.freq;

8.0 => six.rate;
1::second => six.attack;
3::second => six.release;

<<<"ready">>>;
for (0 => int i; i < 10; i++)
{
    for (0 => int j; j < 20; j++)
    {
        200::ms => now;
        <<<six._state, six._last, six._tremolo.gain(), six._tremolo.depth(), six._tremolo.rate(), six._pitchShift.shift()>>>;
    }
    six.trigger();
}
<<<"done">>>;
