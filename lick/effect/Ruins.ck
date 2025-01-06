/*

    LiCK  Library for ChucK.
    Copyright (c) 2007-2025 held jointly by the individual authors.

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
    Verb reverb;
    Verb up;
    Verb down;
    Harmonizers.asc(Intervals.perfectFifth()) @=> Harmonizer _upShift;
    Harmonizers.desc(Intervals.perfectFourth()) @=> Harmonizer _downShift;
    Gain _pre;
    Gain _post;

    20::ms => dur _predelay;

    inlet => _pre => reverb => _post => wet;
    _pre => _upShift => up => _post;
    _pre => _downShift => down => _post;
        
    {
        1.0 => reverb.mix;
        1.0 => up.mix;
        1.0 => down.mix;
        1.0 => _upShift.mix;
        1.0 => _downShift.mix;

        0.6 => reverb.gain;
        0.2 => up.gain;
        0.2 => down.gain;

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
            _predelay + (_lfo.last() * _predelay) => up.predelay;
            _predelay - (_lfo.last() * _predelay) => down.predelay;
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
