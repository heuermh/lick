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
vos.master => dac;

class Pitch extends FloatFloatProcedure
{
  fun void run(float deltaX, float deltaY)
  {
    vos.osc1Pitch(vos.osc1Pitch() + deltaX);
    vos.osc2Pitch(vos.osc2Pitch() + deltaY);
  }
}

class Tremelo extends IntProcedure
{
  fun void run(int value)
  {
    if (value == 0)
    {
      vos.lfoRate(vos.lfoRate() + (vos.lfoRate() * 0.1));
    }
    else if (value == 1)
    {
      vos.lfoRate(vos.lfoRate() - (vos.lfoRate() * 0.1));
    }
  }
}

Mouse mouse;
Pitch pitch;
Tremelo tremelo;
pitch @=> mouse.mouseMotion;
tremelo @=> mouse.buttonDown;
mouse.open(0);
