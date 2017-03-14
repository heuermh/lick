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

TimeSignature.common(120) @=> TimeSignature t;

<<<"intial tempo",t.bpm,"bpm">>>;

<<<"   waiting one whole note . . .",now>>>;
t.w => now;
<<<"   done",now>>>;


t.tempo(60);

<<<"   waiting one whole note . . .",now>>>;
t.w => now;
<<<"   done",now>>>;


<<<"\ncurrent tempo",t.bpm,"bpm">>>;

<<<"sporking tempo increase by 2.0 over one measure (at current tempo) . . .",now>>>;
spork ~ t.accel(2.0);

<<<"   waiting one quarter note . . .",now>>>;
t.q => now;
<<<"   done",now>>>;

<<<"   waiting one quarter note . . .",now>>>;
t.q => now;
<<<"   done",now>>>;

<<<"   waiting one quarter note . . .",now>>>;
t.q => now;
<<<"   done",now>>>;

<<<"   waiting one quarter note . . .",now>>>;
t.q => now;
<<<"   done",now>>>;

<<<"   waiting one whole note . . .",now>>>;
t.w => now;
<<<"   done",now>>>;


<<<"\ncurrent tempo",t.bpm,"bpm">>>;

<<<"sporking tempo decrease by 0.5 over one measure (at current tempo) . . .",now>>>;
spork ~ t.decel(0.5);

<<<"   waiting one quarter note . . .",now>>>;
t.q => now;
<<<"   done",now>>>;

<<<"   waiting one quarter note . . .",now>>>;
t.q => now;
<<<"   done",now>>>;

<<<"   waiting one quarter note . . .",now>>>;
t.q => now;
<<<"   done",now>>>;

<<<"   waiting one quarter note . . .",now>>>;
t.q => now;
<<<"   done",now>>>;

<<<"   waiting one whole note . . .",now>>>;
t.w => now;
<<<"   done",now>>>;


<<<"\ncurrent tempo",t.bpm,"bpm">>>;

<<<"sporking tempo increase by 2.0 over two whole notes (at current tempo) . . .",now>>>;
spork ~ t.accel(2.0, t.w * 2);

<<<"   waiting one quarter note . . .",now>>>;
t.q => now;
<<<"   done",now>>>;

<<<"   waiting one quarter note . . .",now>>>;
t.q => now;
<<<"   done",now>>>;

<<<"   waiting one quarter note . . .",now>>>;
t.q => now;
<<<"   done",now>>>;

<<<"   waiting one quarter note . . .",now>>>;
t.q => now;
<<<"   done",now>>>;

<<<"   waiting one quarter note . . .",now>>>;
t.q => now;
<<<"   done",now>>>;

<<<"   waiting one quarter note . . .",now>>>;
t.q => now;
<<<"   done",now>>>;

<<<"   waiting one quarter note . . .",now>>>;
t.q => now;
<<<"   done",now>>>;

<<<"   waiting one quarter note . . .",now>>>;
t.q => now;
<<<"   done",now>>>;

<<<"   waiting one whole note . . .",now>>>;
t.w => now;
<<<"   done",now>>>;


<<<"\ncurrent tempo",t.bpm,"bpm">>>;

<<<"sporking tempo decrease by 0.5 over two whole notes (at current tempo) . . .",now>>>;
spork ~ t.decel(0.5, t.w * 2);

<<<"   waiting one quarter note . . .",now>>>;
t.q => now;
<<<"   done",now>>>;

<<<"   waiting one quarter note . . .",now>>>;
t.q => now;
<<<"   done",now>>>;

<<<"   waiting one quarter note . . .",now>>>;
t.q => now;
<<<"   done",now>>>;

<<<"   waiting one quarter note . . .",now>>>;
t.q => now;
<<<"   done",now>>>;

<<<"   waiting one quarter note . . .",now>>>;
t.q => now;
<<<"   done",now>>>;

<<<"   waiting one quarter note . . .",now>>>;
t.q => now;
<<<"   done",now>>>;

<<<"   waiting one quarter note . . .",now>>>;
t.q => now;
<<<"   done",now>>>;

<<<"   waiting one quarter note . . .",now>>>;
t.q => now;
<<<"   done",now>>>;

<<<"   waiting one whole note . . .",now>>>;
t.w => now;
<<<"   done",now>>>;


<<<"\ncurrent tempo",t.bpm,"bpm">>>;

<<<"sporking tempo change to 120 bpm over four whole notes (at current tempo) . . .",now>>>;
CubicOut cubicOut;
spork ~ t.tempo(120, t.w * 4, cubicOut);

<<<"   waiting one whole note . . .",now>>>;
t.w => now;
<<<"   done",now>>>;

<<<"   waiting one whole note . . .",now>>>;
t.w => now;
<<<"   done",now>>>;

<<<"   waiting one whole note . . .",now>>>;
t.w => now;
<<<"   done",now>>>;

<<<"   waiting one whole note . . .",now>>>;
t.w => now;
<<<"   done",now>>>;

<<<"   waiting one whole note . . .",now>>>;
t.w => now;
<<<"   done",now>>>;

<<<"   waiting one whole note . . .",now>>>;
t.w => now;
<<<"   done",now>>>;


<<<"\ncurrent tempo",t.bpm,"bpm">>>;

<<<"ok">>>;
