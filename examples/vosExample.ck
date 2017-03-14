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

VoiceOfSaturn vos;
vos.osc1Pitch(80.0);
vos.osc2Pitch(24.0);
vos.lfoDepth(0.6);
vos.lfoRate(20.0);
vos.volume(0.8);
vos.master => dac;

fun void changeOsc1Pitch()
{
  for (1 => int i; i < 200; i++)
  {
    vos.osc1Pitch(80.0 + (i + 1.0));
    500::ms => now;
  }
}

fun void changeOsc2Pitch()
{
  for (1 => int i; i < 200; i++)
  {
    vos.osc2Pitch(i + 1.0);
    500::ms => now;
  }
}

fun void changeLfoRate()
{
  for (1 => int i; i < 200; i++)
  {
    vos.lfoRate(50.0 / i);
    500::ms => now;
  }
}

spork ~ changeOsc1Pitch();
spork ~ changeOsc2Pitch();
spork ~ changeLfoRate();

120::second => now;
