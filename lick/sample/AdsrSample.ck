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

public class AdsrSample
{
    1.0 => float rate;
    0.8 => float gain;
    "Sample" => string name;
    SndBuf buf => ADSR adsr => dac;

    {
        0.0 => buf.gain;
        1 => buf.loop;
        adsr.set(20::ms, 20::ms, 0.9, 400::ms);
    }

    fun void keyOn()
    {
        0 => buf.pos;
        rate => buf.rate;
        gain => buf.gain;
        adsr.keyOn(1);
    }

    fun void keyOff()
    {
        adsr.keyOff(1);
    }
}
