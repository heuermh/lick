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

// requires a MIDI loopback device, such as IAC driver on OSX
MidiIn midiIn;
MidiMsg midiInMsg;

midiIn.open(0);
spork ~ listen();

2::second => now;

MidiOut midiOut;
NoteOnMidiMsg noteOn;
NoteOffMidiMsg noteOff;
ControlChangeMidiMsg cc;

midiOut.open(0);

while (true)
{
    1 => int channel;
    //Std.rand2(1, 16) => int channel;
    Std.rand2(45, 61) => int note;
    Std.rand2(10, 127) => int velocity;
    Std.rand2(1, 16) => int number;
    Std.rand2(1, 121) => int value;

    1::second => now;

    <<<"sending noteOn channel", channel, "note", note, "velocity", velocity>>>;
    noteOn.channel(channel);
    noteOn.note(note);
    noteOn.velocity(velocity);
    midiOut.send(noteOn);

    1::second => now;

    <<<"sending noteOff channel", channel, "note", note, "velocity", velocity>>>;
    noteOff.channel(channel);
    noteOff.note(note);
    noteOff.velocity(velocity);
    midiOut.send(noteOff);

    1::second => now;

    <<<"sending controlChange channel", channel, "number", number, "value", value>>>;
    cc.channel(channel);
    cc.number(number);
    cc.value(value);
    midiOut.send(cc);
}

fun void listen()
{
    while (true)
    {
        midiIn => now;
        while (midiIn.recv(midiInMsg))
        {
            <<<midiInMsg.data1, midiInMsg.data2, midiInMsg.data3>>>;
        }
    }
}
