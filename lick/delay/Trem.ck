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

public class Trem extends Chugen
{
    SinOsc sinLfo;
    SqrOsc sqrLfo;
    TriOsc triLfo;
    0.33 => float sinMix;
    0.33 => float sqrMix;
    0.33 => float triMix;
    1.0 => float _rate;
    1.0 => float _depth;

    {
        sinLfo => blackhole;
        sqrLfo => blackhole;
        triLfo => blackhole;

        rate(_rate);
        depth(_depth);
    }

    fun float rate()
    {
        return _rate;
    }

    fun float rate(float rate)
    {
        rate => _rate;
        _rate => sinLfo.freq;
        _rate => sqrLfo.freq;
        _rate => triLfo.freq;
        return _rate;
    }

    fun float depth()
    {
        return _depth;
    }

    fun float depth(float depth)
    {
        depth => _depth;
        _depth * sinMix => sinLfo.gain;
        _depth * sqrMix => sqrLfo.gain;
        _depth * triMix => triLfo.gain;
        return _depth;
    }

    fun void moreSqr()
    {
        if (sqrMix < 1.0)
        {
            Math.max(sqrMix * 1.1, 0.1) => float d;

            d => float sqrWeight;
            Math.max(sinMix - d / 2.0, 0.0) => float sinWeight;
            Math.max(triMix - d / 2.0, 0.0) => float triWeight;

            sqrWeight + sinWeight + triWeight => float totalWeight;
            sqrWeight / totalWeight => sqrMix;
            sinWeight / totalWeight => sinMix;
            triWeight / totalWeight => triMix;
        }
    }

    fun void moreSin()
    {
        if (sinMix < 1.0)
        {
            Math.max(sinMix * 1.1, 0.1) => float d;

            d => float sinWeight;
            Math.max(sqrMix - d / 2.0, 0.0) => float sqrWeight;
            Math.max(triMix - d / 2.0, 0.0) => float triWeight;

            sqrWeight + sinWeight + triWeight => float totalWeight;
            sqrWeight / totalWeight => sqrMix;
            sinWeight / totalWeight => sinMix;
            triWeight / totalWeight => triMix;
        }
    }

    fun void moreTri()
    {
        if (triMix < 1.0)
        {
            Math.max(triMix * 1.1, 0.1) => float d;

            d => float triWeight;
            Math.max(sqrMix - d / 2.0, 0.0) => float sqrWeight;
            Math.max(sinMix - d / 2.0, 0.0) => float sinWeight;

            sqrWeight + sinWeight + triWeight => float totalWeight;
            sqrWeight / totalWeight => sqrMix;
            sinWeight / totalWeight => sinMix;
            triWeight / totalWeight => triMix;
        }
    }

    fun void moreCowbell()
    {
        <<<"Guess what? I got a fever! And the only prescription... is more cowbell!">>>;
    }

    fun float tick(float in)
    {
        sinLfo.last() * sinMix + sqrLfo.last() * sqrMix + triLfo.last() * triMix => float last;
        Interpolate.linear(last, -1.0, 1.0, 0.0, 1.0) => gain;
        return in;
    }
}
