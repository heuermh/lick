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

80.0 => float minPitch;
4200.0 => float maxPitch;
0.0 => float minLfoRate;
80.0 => float maxLfoRate;
0.0 => float minLfoDepth;
1.0 => float maxLfoDepth;
0.0 => float minVolume;
1.0 => float maxVolume;

VoiceOfSaturn vos;
TouchOscServer touchOscServer;

class Pitch extends FloatFloatProcedure
{
    fun void run(float x, float y)
    {
        vos.osc1Pitch(minPitch + x * maxPitch);
        vos.osc2Pitch(minPitch + y * maxPitch);
    }
}

class ToggleLfo extends FloatProcedure
{
    fun void run(float value)
    {
        if (value)
        {
            vos.lfoType(vos.SQUARE_LFO);
        }
        else
        {
            vos.lfoType(vos.TRIANGLE_LFO);
        }
    }
}

class LfoRate extends FloatProcedure
{
    fun void run(float value)
    {
        vos.lfoRate(minLfoRate + value * maxLfoRate);
    }
}

class LfoDepth extends FloatProcedure
{
    fun void run(float value)
    {
        vos.lfoDepth(minLfoDepth + value * maxLfoDepth);
    }
}

class Volume extends FloatProcedure
{
    fun void run(float value)
    {
        vos.volume(minVolume + value * maxVolume);
    }
}

Pitch pitch;
ToggleLfo toggleLfo;
LfoRate lfoRate;
LfoDepth lfoDepth;
Volume volume;
touchOscServer.addXYPad("/1/xy1", pitch);
touchOscServer.addToggleButton("/1/toggle1", toggleLfo);
touchOscServer.addRotaryV("/1/rotary1", lfoRate);
touchOscServer.addRotaryV("/1/rotary2", lfoDepth);
touchOscServer.addFaderH("/1/fader1", volume);
touchOscServer.connect();

while (true)
{
    1::second => now;
}
