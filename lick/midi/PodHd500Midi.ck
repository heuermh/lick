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

// send MIDI to POD HD500/HD500x hardware
public class PodHd500Midi
{
    // mapping
    1 => static int EXP1_CC;
    2 => static int EXP2_CC;
    51 => static int FS1_CC;
    52 => static int FS2_CC;
    53 => static int FS3_CC;
    54 => static int FS4_CC;
    55 => static int FS5_CC;
    56 => static int FS6_CC;
    57 => static int FS7_CC;
    58 => static int FS8_CC;
    59 => static int EXP_TOE_SWITCH_CC;
    63 => static int LOOPER_FS1_CC; // undo
    62 => static int LOOPER_FS2_CC; // play once
    67 => static int LOOPER_FS3_CC; // pre/post
    60 => static int LOOPER_FS5_CC; // rec/overdub
    61 => static int LOOPER_FS6_CC; // play/stop
    68 => static int LOOPER_FS7_CC; // full/half speed
    65 => static int LOOPER_FS8_CC; // forward/reverse
    99 => static int LOOPER_CC;
    64 => static int TAP_CC;
    69 => static int TUNER_CC;

    0 => static int OFF;
    127 => static int ON;

    MidiOut out;
    ControlChangeMidiMsg ccMsg;

    fun void open(int device)
    {
        out.open(device);
    }

    fun void exp1(int i)
    {
        ccMsg.number(EXP1_CC);
        ccMsg.value(i);
        out.send(ccMsg);
    }

    fun void exp2(int i)
    {
        ccMsg.number(EXP2_CC);
        ccMsg.value(i);
        out.send(ccMsg);
    }

    fun void fs1On()
    {
        fs1(ON);
    }

    fun void fs1Off()
    {
        fs1(OFF);
    }

    fun void fs1(int i)
    {
        ccMsg.number(FS1_CC);
        ccMsg.value(i);
        out.send(ccMsg);
    }

    fun void fs2On()
    {
        fs2(ON);
    }

    fun void fs2Off()
    {
        fs2(OFF);
    }

    fun void fs2(int i)
    {
        ccMsg.number(FS2_CC);
        ccMsg.value(i);
        out.send(ccMsg);
    }

    fun void fs3On()
    {
        fs3(ON);
    }

    fun void fs3Off()
    {
        fs3(OFF);
    }

    fun void fs3(int i)
    {
        ccMsg.number(FS3_CC);
        ccMsg.value(i);
        out.send(ccMsg);
    }

    fun void fs4On()
    {
        fs4(ON);
    }

    fun void fs4Off()
    {
        fs4(OFF);
    }

    fun void fs4(int i)
    {
        ccMsg.number(FS4_CC);
        ccMsg.value(i);
        out.send(ccMsg);
    }

    fun void fs5On()
    {
        fs5(ON);
    }

    fun void fs5Off()
    {
        fs5(OFF);
    }

    fun void fs5(int i)
    {
        ccMsg.number(FS5_CC);
        ccMsg.value(i);
        out.send(ccMsg);
    }

    fun void fs6On()
    {
        fs6(ON);
    }

    fun void fs6Off()
    {
        fs6(OFF);
    }

    fun void fs6(int i)
    {
        ccMsg.number(FS6_CC);
        ccMsg.value(i);
        out.send(ccMsg);
    }

    fun void fs7On()
    {
        fs7(ON);
    }

    fun void fs7Off()
    {
        fs7(OFF);
    }

    fun void fs7(int i)
    {
        ccMsg.number(FS7_CC);
        ccMsg.value(i);
        out.send(ccMsg);
    }

    fun void fs8On()
    {
        fs8(ON);
    }

    fun void fs8Off()
    {
        fs8(OFF);
    }

    fun void fs8(int i)
    {
        ccMsg.number(FS8_CC);
        ccMsg.value(i);
        out.send(ccMsg);
    }

    fun void expToeSwitchOn()
    {
        expToeSwitch(ON);
    }

    fun void expToeSwitchOff()
    {
        expToeSwitch(OFF);
    }

    fun void expToeSwitch(int i)
    {
        ccMsg.number(EXP_TOE_SWITCH_CC);
        ccMsg.value(i);
        out.send(ccMsg);
    }

    fun void looperOverdub()
    {
        looper(LOOPER_FS5_CC, OFF);
    }

    fun void looperRecord()
    {
        looper(LOOPER_FS5_CC, ON);
    }

    fun void looperStop()
    {
        looper(LOOPER_FS6_CC, OFF);
    }

    fun void looperPlay()
    {
        looper(LOOPER_FS6_CC, ON);
    }

    fun void looperPlayOnce()
    {
        looper(LOOPER_FS2_CC, ON);
    }

    fun void looperUndo()
    {
        looper(LOOPER_FS1_CC, ON);
    }

    fun void looperForward()
    {
        looper(LOOPER_FS8_CC, OFF);
    }

    fun void looperReverse()
    {
        looper(LOOPER_FS8_CC, ON);
    }

    fun void looperPre()
    {
        looper(LOOPER_FS3_CC, OFF);
    }

    fun void looperPost()
    {
        looper(LOOPER_FS6_CC, ON);
    }

    fun void looperFullSpeed()
    {
        looper(LOOPER_FS7_CC, OFF);
    }

    fun void looperHalfSpeed()
    {
        looper(LOOPER_FS7_CC, ON);
    }

    fun void looperOn()
    {
        looper(LOOPER_CC, ON);
    }

    fun void looperOff()
    {
        looper(LOOPER_CC, OFF);
    }

    fun void looper(int cc, int value)
    {
        ccMsg.number(cc);
        ccMsg.value(value);
        out.send(ccMsg);
    }

    fun void tap()
    {
        ccMsg.number(TAP_CC);
        ccMsg.value(ON);
        out.send(ccMsg);
    }

    fun void tunerOn()
    {
        tuner(ON);
    }

    fun void tunerOff()
    {
        tuner(OFF);
    }

    fun void tuner(int i)
    {
        ccMsg.number(TUNER_CC);
        ccMsg.value(i);
        out.send(ccMsg);
    }
}
