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

// fixed head tap tempo tape-style delay
public class Electoronic extends Feedback
{
    TimeSignature @ ts;
    AnalogDelay.create() @=> AnalogDelay head1;
    AnalogDelay.create() @=> AnalogDelay head2;
    AnalogDelay.create() @=> AnalogDelay head3;    

    pre => head1 => post;
    pre => head2 => post;
    pre => head3 => post;

    {
        1.0 => head1.mix;
        0.0 => head1.feedback;

        1.0 => head2.mix;
        0.0 => head2.feedback;

        1.0 => head3.mix;
        0.0 => head3.feedback;

        0.1 => short;
        0.3 => medium;
        0.6 => long;
    }

    fun void _init()
    {
        ts.s => head1.max;
        ts.s => head1.delay;

        ts.dotted(ts.e) => head2.max;
        ts.dotted(ts.e) => head2.delay;

        ts.q => head3.max;
        ts.q => head3.max;
    }

    fun float short()
    {
        return head1.gain();
    }

    fun float short(float f)
    {
        f => head1.gain;
        return f;
    }

    fun float medium()
    {
        return head2.gain();
    }

    fun float medium(float f)
    {
        f => head2.gain;
        return f;
    }

    fun float long()
    {
        return head3.gain();
    }

    fun float long(float f)
    {
        f => head3.gain;
        return f;
    }

    fun static Electoronic create(TimeSignature ts)
    {
        Electoronic electoronic;
        ts @=> electoronic.ts;
        electoronic._init();
        return electoronic;
    }
}
