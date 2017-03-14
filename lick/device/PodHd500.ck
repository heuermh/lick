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

// receive MIDI from POD HD500/HD500x hardware
public class PodHd500
{
    MidiIn min;
    MidiMsg msg;

    IntProcedure exp1;
    IntProcedure exp2;
    Procedure fs1On;
    Procedure fs1Off;
    Procedure fs2On;
    Procedure fs2Off;
    Procedure fs3On;
    Procedure fs3Off;
    Procedure fs4On;
    Procedure fs4Off;
    Procedure fs5On;
    Procedure fs5Off;
    Procedure fs6On;
    Procedure fs6Off;
    Procedure fs7On;
    Procedure fs7Off;
    Procedure fs8On;
    Procedure fs8Off;
    Procedure expToeSwitchOn;
    Procedure expToeSwitchOff;
    Procedure looperRecord;
    Procedure looperOverdub;
    Procedure looperPlay;
    Procedure looperStop;
    Procedure looperPlayOnce;
    Procedure looperUndo;
    Procedure looperForward;
    Procedure looperReverse;
    Procedure looperPre;
    Procedure looperPost;
    Procedure looperFullSpeed;
    Procedure looperHalfSpeed;
    Procedure looperOn;
    Procedure looperOff;
    Procedure tap;
    Procedure tunerOn;
    Procedure tunerOff;

    fun int open(int device)
    {
        min.open(device);

        while (true)
        {
            min => now;
            while (min.recv(msg))
            {
                msg.data1 => int control;
                msg.data2 => int controlChange;
                msg.data3 => int value;

                // see notes below
                if (control == 176)
                {
                    if (controlChange == 1)
                    {
                        exp1.run(value);
                    }
                    else if (controlChange == 2)
                    {
                        exp2.run(value);
                    }
                    else if (controlChange == 51)
                    {
                        if (value == 0)
                        {
                            fs1Off.run();
                        }
                        else
                        {
                            fs1On.run();
                        }
                    }
                    else if (controlChange == 52)
                    {
                        if (value == 0)
                        {
                            fs2Off.run();
                        }
                        else
                        {
                            fs2On.run();
                        }
                    }
                    else if (controlChange == 53)
                    {
                        if (value == 0)
                        {
                            fs3Off.run();
                        }
                        else
                        {
                            fs3On.run();
                        }
                    }
                    else if (controlChange == 54)
                    {
                        if (value == 0)
                        {
                            fs4Off.run();
                        }
                        else
                        {
                            fs4On.run();
                        }
                    }
                    else if (controlChange == 55)
                    {
                        if (value == 0)
                        {
                            fs5Off.run();
                        }
                        else
                        {
                            fs5On.run();
                        }
                    }
                    else if (controlChange == 56)
                    {
                        if (value == 0)
                        {
                            fs6Off.run();
                        }
                        else
                        {
                            fs6On.run();
                        }
                    }
                    else if (controlChange == 57)
                    {
                        if (value == 0)
                        {
                            fs7Off.run();
                        }
                        else
                        {
                            fs7On.run();
                        }
                    }
                    else if (controlChange == 58)
                    {
                        if (value == 0)
                        {
                            fs8Off.run();
                        }
                        else
                        {
                            fs8On.run();
                        }
                    }
                    else if (controlChange == 59)
                    {
                        if (value == 0)
                        {
                            expToeSwitchOff.run();
                        }
                        else
                        {
                            expToeSwitchOn.run();
                        }
                    }
                    else if (controlChange == 60)
                    {
                        if (value < 64)
                        {
                            looperOverdub.run();
                        }
                        else
                        {
                            looperRecord.run();
                        }
                    }
                    else if (controlChange == 61)
                    {
                        if (value < 64)
                        {
                            looperStop.run();
                        }
                        else
                        {
                            looperPlay.run();
                        }
                    }
                    else if (controlChange == 62)
                    {
                        if (value > 63)
                        {
                            looperPlayOnce.run();
                        }
                    }
                    else if (controlChange == 63)
                    {
                        if (value > 63)
                        {
                            looperUndo.run();
                        }
                    }
                    else if (controlChange == 65)
                    {
                        if (value < 64)
                        {
                            looperForward.run();
                        }
                        else
                        {
                            looperReverse.run();
                        }
                    }
                    else if (controlChange == 66)
                    {
                        if (value < 64)
                        {
                            looperStop.run();
                        }
                        else
                        {
                            looperPlay.run();
                        }
                    }
                    else if (controlChange == 67)
                    {
                        if (value < 64)
                        {
                            looperPre.run();
                        }
                        else
                        {
                            looperPost.run();
                        }
                    }
                    else if (controlChange == 68)
                    {
                        if (value < 64)
                        {
                            looperFullSpeed.run();
                        }
                        else
                        {
                            looperHalfSpeed.run();
                        }
                    }
                    else if (controlChange == 69)
                    {
                        if (value < 64)
                        {
                            looperOff.run();
                        }
                        else
                        {
                            looperOn.run();
                        }
                    }
                    else if (controlChange == 66)
                    {
                        if (value > 63)
                        {
                            tap.run();
                        }
                    }
                    else if (controlChange == 69)
                    {
                        if (value < 64)
                        {
                            tunerOff.run();
                        }
                        else
                        {
                            tunerOn.run();
                        }
                    }
                }
            }
        }
    }
}

/*

  POD HD500 default midi mapping

  Pedal & Footswitch Assignments
  001  0 - 127  EXP-1 Pedal Assignment
  002  0 - 127  EXP-2 Pedal Assignment
  051  0 - 127  Toggles FS1 Assignment On/Off
  052  0 - 127  Toggles FS2 Assignment On/Off
  053  0 - 127  Toggles FS3 Assignment On/Off
  054  0 - 127  Toggles FS4 Assignment On/Off
  055  0 - 127  Toggles FS5 Assignment On/Off
  056  0 - 127  Toggles FS6 Assignment On/Off
  057  0 - 127  Toggles FS7 Assignment On/Off
  058  0 - 127  Toggles FS8 Assignment On/Off
  059  0 - 127  Toggles EXP Toe Switch Assignment On/Off

  Looper Controls
  060  0-63 = Overdub, 64-127 = Record  Looper Record/Overdub Switch
  061  0-63 = Stop, 64-127 = Play  Looper Play/Stop Switch
  062  64-127 = Play Once  Looper Play Once Switch
  063  64-127 = Undo  Looper Undo Switch
  065  0-63 = Forward 64-127 = Reverse  Looper Forward/Reverse Switch
  067  0-63 = Pre 64-127 = Post  Looper Pre/Post Position Switch
  068  0-63 = Full 64-127 = Half  Looper Full/Half Speed Switch
  099  0-63 = Off 64-127 = On  Looper Mode On/Off

  Additional Controls
  064  64-127 = Tap  Tap Tempo - Enter Tap Tempo
  069  0-63 = Off 64-127 = On  Tuner Mode On/Off

*/
