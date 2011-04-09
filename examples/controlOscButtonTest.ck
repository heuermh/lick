/*

    LiCK  Library for ChucK.
    Copyright (c) 2007-2011 held jointly by the individual authors.

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
        //controlOsc.label(status, status + ", " + value);
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
}