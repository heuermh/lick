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

ControlOscServer controlOsc;

class Status extends FloatProcedure
{
    "status" => string status;

    fun void run(float value)
    {
        <<<status, value>>>;
        controlOsc.label("192.168.1.100", 9000, "/status", status + ", " + value);
        controlOsc.label("192.168.1.100", 9000, status + "Label", status + ", " + value);
    }
}

Status toggleButton;
"/toggleButton" => toggleButton.status;

Status momentaryButton;
"/momentaryButton" => momentaryButton.status;

Status latchButton;
"/latchButton" => latchButton.status;

Status contactButton;
"/contactButton" => contactButton.status;

Status visualToggleButton;
"/visualToggleButton" => visualToggleButton.status;

controlOsc.addButton("/toggleButton", toggleButton);
controlOsc.addButton("/momentaryButton", momentaryButton);
controlOsc.addButton("/latchButton", latchButton);
controlOsc.addButton("/contactButton", contactButton);
controlOsc.addButton("/visualToggleButton", visualToggleButton);

<<<"connecting...">>>;
controlOsc.connect();

while (true)
{
    10::second => now;
    <<<"heartbeat">>>;
    controlOsc.button("192.168.1.100", 9000, "/visualToggleButton", 1.0);
}

/*

  save to buttonTest.js

loadedInterfaceName = "buttonTest";
interfaceOrientation = "portrait";

pages = [[
  {
    "name": "toggleButton",
    "type": "Button",
    "mode": "toggle",
    "x": 0.05,
    "y": 0.05,
    "width": 0.9,
    "height": 0.1,
  },
  {
    "name": "toggleButtonLabel",
    "type": "Label",
    "x": 0.05,
    "y": 0.05,
    "width": 0.9,
    "height": 0.1,
    "value": "toggle button",
  },
  {
    "name": "momentaryButton",
    "type": "Button",
    "mode": "momentary",
    "x": 0.05,
    "y": 0.2,
    "width": 0.9,
    "height": 0.1,
  },
  {
    "name": "momentaryButtonLabel",
    "type": "Label",
    "x": 0.05,
    "y": 0.2,
    "width": 0.9,
    "height": 0.1,
    "value": "momentary button"
  },
  {
    "name": "latchButton",
    "type": "Button",
    "mode": "latch",
    "x": 0.05,
    "y": 0.35,
    "width": 0.9,
    "height": 0.1,
  },
  {
    "name": "latchButtonLabel",
    "type": "Label",
    "x": 0.05,
    "y": 0.35,
    "width": 0.9,
    "height": 0.1,
    "value": "latch button"
  },
  {
    "name": "contactButton",
    "type": "Button",
    "mode": "contact",
    "x": 0.05,
    "y": 0.5,
    "width": 0.9,
    "height": 0.1,
  },
  {
    "name": "contactButtonLabel",
    "type": "Label",
    "x": 0.05,
    "y": 0.5,
    "width": 0.9,
    "height": 0.1,
    "value": "contact button",
  },
  {
    "name": "visualToggleButton",
    "type": "Button",
    "mode": "visualToggle",
    "x": 0.05,
    "y": 0.65,
    "width": 0.9,
    "height": 0.1,
  },
  {
    "name": "visualToggleButtonLabel",
    "type": "Label",
    "x": 0.05,
    "y": 0.65,
    "width": 0.9,
    "height": 0.1,
    "value": "visual toggle",
  },
  {
    "name": "refresh",
    "type": "Button",
    "x": .2,
    "y": .8,
    "width": .2,
    "height": .075,
    "startingValue": 0,
    "isLocal": true,
    "mode": "contact",
    "ontouchstart": "interfaceManager.refreshInterface()",
    "stroke": "#aaa",
  },
  {
    "name": "refreshLabel",
    "type": "Label",
    "x": .2,
    "y": .8,
    "width": .2,
    "height": .075,
    "isLocal": true,
    "value": "refresh",
  },
  {
    "name": "tabButton",
    "type": "Button",
    "x": .6,
    "y": .8,
    "width": .2,
    "height": .075,
    "mode": "toggle",
    "stroke": "#aaa",
    "isLocal": true,
    "ontouchstart": "if(this.value == this.max) { control.showToolbar(); } else { control.hideToolbar(); }",
  },
  {
    "name": "tabButtonLabel",
    "type": "Label",
    "x": .6,
    "y": .8,
    "width": .2,
    "height": .075,
    "mode": "contact",
    "isLocal": true,
    "value": "menu",
  },
  {
    "name": "status",
    "type": "Label",
    "x": 0.05,
    "y": 0.9,
    "width": 0.9,
    "height": 0.095,
    "align": "center",
    "backgroundColor": "#00a",
    "value": "buttonTest.js, version 0.1.15",
  },
  ]];

*/
