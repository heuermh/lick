/*

    LiCK  Library for ChucK.
    Copyright (c) 2007-2021 held jointly by the individual authors.

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

//
// similar to These Ruins mode in Headtrip 2
//
// buy one here:
// https://www.madbeanpedals.com/projects/index.html
//

public class Ruins extends LfoEffect
{
    GVerb reverb;
    GVerb up;
    GVerb down;
    Delay _upPredelay;
    Delay _downPredelay;
    // todo: use harmonizers
    PitShift _upShift;
    PitShift _downShift;
    Intervals.perfectFifth().asc() @=> Interval _upInterval;
    Intervals.perfectFourth().desc() @=> Interval _downInterval;
    Gain _pre;
    Gain _post;

    20::ms => dur _predelay;

    inlet => _pre => reverb => _post => wet;
    _pre => _upPredelay => _upShift => up => _post;
    _pre => _downPredelay => _downShift => down => _post;
        
    {
        0.6 => reverb.gain;
        0.2 => up.gain;
        0.2 => down.gain;

        1::second => _upPredelay.max;
        1::second => _downPredelay.max;

        _upInterval.evaluate(1.0) => _upShift.shift;
        _downInterval.evaluate(1.0) => _downShift.shift;

        0.5 => rate;
        0.1 => depth;
        sinLfo();
    }

    fun dur predelay()
    {
        return _predelay;
    }

    fun dur predelay(dur d)
    {
        d => _predelay;
        return d;
    }

    fun void _updateAtSampleRate()
    {
        while (true)
        {
            1::samp => now;
            // todo: use single lfo or create independent lfo predelayed reverbs?
            _predelay + (_lfo.last() * _predelay) => _upPredelay.delay;
            _predelay - (_lfo.last() * _predelay) => _downPredelay.delay;
        }
    }

    fun static Ruins create()
    {
        Ruins ruins;
        return ruins;
    }

    fun static Ruins create(dur predelay)
    {
        Ruins ruins;
        predelay => ruins.predelay;
        return ruins;
    }
}
