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

0.0 => float last;

adc => PitchTrack pt => blackhole;

512 => pt.frame;
4 => pt.overlap;

spork ~ _sporkAtSampleRate();

10::minute => now;

<<<"done">>>;

fun void _sporkAtSampleRate()
{
    while (true)
    {
        1::samp => now;
        pt.get() => float freq;
        if (freq != last)
        {
            <<<now, "freq", freq>>>;
            freq => last;
        }
    }
}
