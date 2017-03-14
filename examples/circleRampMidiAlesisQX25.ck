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

CircleRamp circleRamp => Saturate saturate => TubeWarmth tubeWarmth => dac;

circleRamp.adsr.set(5::ms, 100::ms, 0.6, 500::ms);

saturate.stop();
tubeWarmth.stop();

class CircleRampDelay extends IntProcedure
{
    fun void run(int value)
    {
        Interpolate.linear(value, 0.0, 127.0, 0.0, 20.0) * 20::ms => circleRamp.ramp;
        <<<"circleRamp delay", circleRamp.ramp>>>;
    }
}
class CircleRampDetune extends IntProcedure
{
    fun void run(int value)
    {
        Interpolate.linear(value, 0.0, 127.0, 0.0, 8.0) * -1.0 => circleRamp.detune;
        <<<"circleRamp detune", circleRamp.detune>>>;
    }
}
class ToggleSaturate extends Procedure
{
    fun void run()
    {
        saturate.toggle();
        <<<"saturate", saturate.running()>>>;
    }
}
class SaturateBias extends IntProcedure
{
    fun void run(int value)
    {
        Interpolate.linear(value, 0.0, 127.0, 0.0, 1.0) => saturate.bias;
        <<<"saturate bias", saturate.bias()>>>;
    }
}
class SaturateDrive extends IntProcedure
{
    fun void run(int value)
    {
        Interpolate.linear(value, 0.0, 127.0, -24.0, 72.0) => saturate.db;
        <<<"saturate drive, db", saturate.db()>>>;
    }
}
class ToggleTubeWarmth extends Procedure
{
    fun void run()
    {
        tubeWarmth.toggle();
        <<<"tubeWarmth", tubeWarmth.running()>>>;
    }
}
class TubeWarmthDrive extends IntProcedure
{
    fun void run(int value)
    {
        Interpolate.linear(value, 0.0, 127.0, 0.1, 10.0) => tubeWarmth.drive;
        <<<"tubeWarmth drive", tubeWarmth.drive()>>>;
    }
}

-1 => int lastKey;

class KeyOn extends IntIntProcedure
{
    fun void run(int value0, int value1)
    {
        <<<"keyOn", value0, value1>>>;

        if (lastKey >= 0)
        {
            circleRamp.noteOff();
        }
        value0 => lastKey;
        circleRamp.noteOn(value0);
    }
}

class KeyOff extends IntProcedure
{
    fun void run(int value)
    {
        <<<"keyOff", value>>>;
        if (value == lastKey)
        {
            circleRamp.noteOff();
        }
    }
}

KeyOn keyOn;
KeyOff keyOff;
CircleRampDelay circleRampDelay;
CircleRampDetune circleRampDetune;
ToggleSaturate toggleSaturate;
SaturateBias saturateBias;
SaturateDrive saturateDrive;
ToggleTubeWarmth toggleTubeWarmth;
TubeWarmthDrive tubeWarmthDrive;


AlesisQX25 qx25;
keyOn @=> qx25.keyOn;
keyOff @=> qx25.keyOff;
circleRampDelay @=> qx25.rotary1;
circleRampDetune @=> qx25.rotary2;
toggleSaturate @=> qx25.rewind;
saturateBias @=> qx25.rotary3;
saturateDrive @=> qx25.rotary4;
toggleTubeWarmth @=> qx25.fastForward;
tubeWarmthDrive @=> qx25.rotary5;

qx25.open(1);

/*

e.g.

circleRamp delay 6944.881890
circleRamp detune -7.937008
saturate bias 0.039370
saturate drive, db 1.700787
tubeWarmth drive 5.790551

*/
