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

public class SubGen
{
    20.0 => float _freq;
    0.0 => float _phase;

    Gain outputL;
    Gain outputR;
    SawOsc sawOsc;
    SinOsc sinOsc;
    SqrOsc sqrOsc;
    TriOsc triOsc;
    Gain mix;
    Pan2 pan;
    StereoDelay delay;

    {
        sawOsc => mix;
        sinOsc => mix;
        sqrOsc => mix;
        triOsc => mix;
        mix => pan.left => delay.inputL;
        mix => pan.right => delay.inputR;
        delay.outputL => outputL;
        delay.outputR => outputR;

        0.0 => sawOsc.gain;
        1.0 => sinOsc.gain;
        0.0 => sqrOsc.gain;
        0.0 => triOsc.gain;
        1.0 => mix.gain;
        1.0 => pan.gain;
        0.0 => pan.pan;
        0.0 => delay.feedbackL.gain;
        0.0 => delay.feedbackR.gain;
        1.0 => delay.inputL.gain;
        1.0 => delay.inputR.gain;
        1.0 => delay.outputL.gain;
        1.0 => delay.outputR.gain;
        1.0 => outputL.gain;
        1.0 => outputR.gain;
    }


    fun float freq()
    {
        return _freq;
    }

    fun float freq(float freq)
    {
        freq => _freq;
        _freq => sawOsc.freq;
        _freq => sinOsc.freq;
        _freq => sqrOsc.freq;
        _freq => triOsc.freq;
        return _freq;
    }

    fun float phase()
    {
        return _phase;
    }

    fun float phase(float phase)
    {
        phase => _phase;
        _phase => sawOsc.phase;
        _phase => sinOsc.phase;
        _phase => sqrOsc.phase;
        _phase => triOsc.phase;
        return _phase;
    }
}
