/*

    LiCK  Library for ChucK.
    Copyright (c) 2007-2012 held jointly by the individual authors.

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

TimeSignature.common(120) @=> TimeSignature t;

<<<"waiting one whole note . . .",now>>>;
t.w => now;
<<<"done",now>>>;

<<<"changing tempo to 60 bpm immediately">>>;
t.tempo(60);

<<<"waiting one whole note . . .",now>>>;
t.w => now;
<<<"done",now>>>;

<<<"changing tempo back to 120 bpm immediately">>>;
t.tempo(120);

<<<"waiting one whole note . . .",now>>>;
t.w => now;
<<<"done",now>>>;

<<<"sporking tempo change to 60 bpm over four whole notes (at current tempo). . .",now>>>;
CubicIn cubicIn;
CubicOut cubicOut;
60 => int foo;
<<<"foo",foo>>>;
spork ~ t._tempo(foo, t.w * 4, cubicOut);
//t._tempo(foo, t.w * 4, cubicOut);

<<<"waiting one whole note . . .",now>>>;
t.w => now;
<<<"done",now>>>;

<<<"waiting one whole note . . .",now>>>;
t.w => now;
<<<"done",now>>>;

<<<"waiting one whole note . . .",now>>>;
t.w => now;
<<<"done",now>>>;

<<<"waiting one whole note . . .",now>>>;
t.w => now;
<<<"done",now>>>;

<<<"waiting one whole note . . .",now>>>;
t.w => now;
<<<"done",now>>>;

//1::minute => now;

<<<"ok">>>;