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

adc => Expo expo => dac;

10 => int reps;
1.0 => float durcurve;
1.0 => float ampcurve;

class Toggle extends Procedure
{
    fun void run()
    {
        expo.toggle();
        <<<"running", expo.running()>>>;
    }
}
class MoreReps extends Procedure
{
    fun void run()
    {
        reps + 1 => reps;
        reps => expo.reps;
        <<<"reps", expo.reps()>>>;
    }
}
class LessReps extends Procedure
{
    fun void run()
    {
        Math.max(0, reps - 1) $ int => reps;
        reps => expo.reps;
        <<<"reps", expo.reps()>>>;
    }
}
class MoreDurCurve extends Procedure
{
    fun void run()
    {
        durcurve * 2.0 => durcurve;
        durcurve => expo.durcurve;
        <<<"durcurve", expo.durcurve()>>>;
    }
}
class LessDurCurve extends Procedure
{
    fun void run()
    {
        durcurve / 4.0 => durcurve;
        durcurve => expo.durcurve;
        <<<"durcurve", expo.durcurve()>>>;
    }
}
class MoreAmpCurve extends Procedure
{
    fun void run()
    {
        ampcurve * 2.0 => ampcurve;
        ampcurve => expo.ampcurve;
        <<<"ampcurve", expo.ampcurve()>>>;
    }
}
class LessAmpCurve extends Procedure
{
    fun void run()
    {
        ampcurve / 4.0 => ampcurve;
        ampcurve => expo.ampcurve;
        <<<"ampcurve", expo.ampcurve()>>>;
    }
}

Toggle toggle;
MoreReps moreReps;
LessReps lessReps;
MoreDurCurve moreDurCurve;
LessDurCurve lessDurCurve;
MoreAmpCurve moreAmpCurve;
LessAmpCurve lessAmpCurve;

StompKeyboard stomp;
toggle @=> stomp.button0Down;
moreReps @=> stomp.button1Down;
//lessReps @=> stomp.button2Down;
moreDurCurve @=> stomp.button2Down;
lessDurCurve @=> stomp.button3Down;
moreAmpCurve @=> stomp.button4Down;
lessAmpCurve @=> stomp.button5Down;

stomp.open(0);
