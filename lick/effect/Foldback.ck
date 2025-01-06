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
// effect wrapper for FoldbackSaturator chugin
//

public class Foldback extends Effect
{
    FoldbackSaturator _fold;

    float _makeupGain;
    float _threshold;
    float _index;

    inlet => _fold => wet;

    {
        1.0 => makeupGain;
        0.6 => threshold;
        2.0 => index;
    }

    fun float makeupGain()
    {
        return _makeupGain;
    }

    fun float makeupGain(float f)
    {
        f => _makeupGain;
        return _makeupGain;
    }

    fun float threshold()
    {
        return _threshold;
    }

    fun float threshold(float f)
    {
        f => _threshold;
        return _threshold;
    }

    fun float index()
    {
        return _index;
    }

    fun float index(float f)
    {
        f => _index;
        return _index;
    }

    fun static Foldback create()
    {
        Foldback foldback;
        return foldback;
    }

    fun static Foldback create(float makeupGain)
    {
        Foldback foldback;
        makeupGain => foldback.makeupGain;
        return foldback;
    }

    fun static Foldback create(float makeupGain, float threshold)
    {
        Foldback foldback;
        makeupGain => foldback.makeupGain;
        threshold => foldback.threshold;
        return foldback;
    }

    fun static Foldback create(float makeupGain, float threshold, float index)
    {
        Foldback foldback;
        makeupGain => foldback.makeupGain;
        threshold => foldback.threshold;
        index => foldback.index;
        return foldback;
    }
}
