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

class ChewFunction extends FloatFunction
{
    Chew @ chew;

    fun float evaluate(float in)
    {
        1.0 - chew.topDepth() => float cutoff0;
        1.0 - chew.topDepth()/2.0 => float dc0;
        -1.0 + chew.bottomDepth() => float cutoff1;
        -1.0 + chew.bottomDepth()/2.0 => float dc1;

        if (in > cutoff0)
        {
            return dc0 + chew._g0.last();
        }
        else if (in < cutoff1)
        {
            return dc1 - chew._g1.last();
        }
        return in;
    }
}

public class Chew extends Effect
{
    ChewFunction _chewFunction;
    Lfo _lfo0 => Gain _g0 => blackhole;
    Lfo _lfo1 => Gain _g1 => blackhole;
    inlet => WaveShaper _waveShaper => wet;

    {
        this @=> _chewFunction.chew;
        _chewFunction @=> _waveShaper.shape;

        _lfo0.tri();
        0.1 => _lfo0.depth;
        4400.0 => _lfo0.rate;

        _lfo1.tri();
        0.1 => _lfo1.depth;
        4400.0 => _lfo1.rate;
    }


    fun float topDepth()
    {
        return _lfo0.depth();
    }

    fun float topDepth(float f)
    {
        f => _lfo0.depth;
        return f;
    }

    fun float topRate()
    {
        return _lfo0.rate();
    }

    fun float topRate(float f)
    {
        f => _lfo0.rate;
        return f;
    }


    fun float bottomDepth()
    {
        return _lfo1.depth();
    }

    fun float bottomDepth(float f)
    {
        f => _lfo1.depth;
        return f;
    }

    fun float bottomRate()
    {
        return _lfo1.rate();
    }

    fun float bottomRate(float f)
    {
        f => _lfo1.rate;
        return f;
    }

    fun static Chew create()
    {
        Chew chew;
        return chew;
    }

    fun static Chew create(float topDepth, float bottomDepth)
    {
        Chew chew;
        topDepth => chew.topDepth;
        bottomDepth => chew.bottomDepth;
        return chew;
    }

    fun static Chew create(float topDepth, float topRate, float bottomDepth, float bottomRate)
    {
        Chew chew;
        topDepth => chew.topDepth;
        topRate => chew.topRate;
        bottomDepth => chew.bottomDepth;
        bottomRate => chew.bottomRate;
        return chew;
    }
}
