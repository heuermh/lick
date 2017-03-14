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

BeeThree bt => dac;
440 => bt.freq;

class Button extends FloatProcedure
{
    Interval interval;

    fun void run(float value)
    {
        if (value > 0.0)
        {
            interval.evaluate(bt.freq()) => bt.freq;
            <<<bt.freq()>>>;
            bt.noteOn(1.0);
        }
        else
        {
            bt.noteOff(1.0);
        }
    }
}

// left hand (P)IMAC
Button li;
Button lm;
Button la;
Button lc;
Intervals.majorSeventh().desc() @=> li.interval;
Intervals.perfectFifth().desc() @=> lm.interval;
Intervals.perfectFourth().desc() @=> la.interval;
Intervals.majorThird().desc() @=> lc.interval;

// right hand (P)IMAC
Button ri;
Button rm;
Button ra;
Button rc;
Intervals.majorSeventh() @=> ri.interval;
Intervals.perfectFifth() @=> rm.interval;
Intervals.perfectFourth() @=> ra.interval;
Intervals.majorThird() @=> rc.interval;

// thumb
Button p;
Intervals.unison() @=> p.interval;

ControlOscServer controlOsc;
controlOsc.addButton("/li", li);
controlOsc.addButton("/lm", lm);
controlOsc.addButton("/la", la);
controlOsc.addButton("/lc", lc);
controlOsc.addButton("/ri", ri);
controlOsc.addButton("/rm", rm);
controlOsc.addButton("/ra", ra);
controlOsc.addButton("/rc", rc);
controlOsc.addButton("/p", p);

<<<"connecting...">>>;
controlOsc.connect();

while (true)
{
    10::second => now;
    <<<".">>>;
}

/*

  save to interval.js
  (button layout still needs work)


loadedInterfaceName = "interval";
interfaceOrientation = "landscape";

pages = [[
    {
        "name": "lc",
        "label": "-M3",
        "type": "Button",
        "mode": "momentary",
        "bounds": [.02, .56, .1, .2],
    },
    {
        "name": "la",
        "label": "-P4",
        "type": "Button",
        "mode": "momentary",
        "bounds": [.18, .56, .1, .2],
    },
    {
        "name": "lm",
        "label": "-P5",
        "type": "Button",
        "mode": "momentary",
        "bounds": [.34, .56, .1, .2],
    },
    {
        "name": "li",
        "label": "-M7",
        "type": "Button",
        "mode": "momentary",
        "bounds": [.50, .56, .1, .2],
    },
    {
        "name": "ri",
        "label": "+M7",
        "type": "Button",
        "mode": "momentary",
        "bounds": [.40, .23, .1, .2],
    },
    {
        "name": "rm",
        "label": "+P5",
        "type": "Button",
        "mode": "momentary",
        "bounds": [.56, .23, .1, .2],
    },
    {
        "name": "ra",
        "label": "+P4",
        "type": "Button",
        "mode": "momentary",
        "bounds": [.72, .23, .1, .2],
    },
    {
        "name": "rc",
        "label": "+M3",
        "type": "Button",
        "mode": "momentary",
        "bounds": [.88, .23, .1, .2],
    },
    {
        "name": "p",
        "label": "U",
        "type": "Button",
        "mode": "momentary",
        "bounds": [.02, .8, .96, .175],
    },
    {
        "name": "refresh",
        "label": "refresh (0.1.11)",
        "type": "Button",
        "bounds": [.2, .01, .2, .075],
        "startingValue": 0,
        "isLocal": true,
        "mode": "contact",
        "ontouchstart": "interfaceManager.refreshInterface()",
        "stroke": "#aaa",
    },
    {
        "name": "menu",
        "label": "menu",
        "type": "Button",
        "bounds": [.6, .01, .2, .075],
        "mode": "toggle",
        "stroke": "#aaa",
        "isLocal": true,
        "ontouchstart": "if (this.value == this.max) { control.showToolbar(); } else { control.hideToolbar(); }",
    },
    ]];

*/
