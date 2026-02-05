/*

    LiCK  Library for ChucK.
    Copyright (c) 2007-2026 held jointly by the individual authors.

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

// New York style drum compression effect
public class Nyc extends Effect
{
    LPF _low;
    Gain _mid;
    HPF _high;
    Gain _post;
    Limit limit;

    /*

      inlet --> limit --> _high --> _post --> wet
                  |                   |
                  +-----> _mid -------+
                  |                   |
                  +-----> _low -------+
        
    */
    inlet => limit => _high => _post => wet;
    limit => _mid => _post;
    limit => _low => _post;

    float _lowGain;
    float _midGain;
    float _highGain;

    {
        low(0.55);
        mid(0.10);
        high(0.35);

        100::ms => limit.attackTime;
        2::second => limit.releaseTime;
    }

    fun float low()
    {
        return _lowGain;
    }

    fun float low(float f)
    {
        f => _lowGain;
        f => _low.gain;
        return f;
    }

    fun float mid()
    {
        return _midGain;
    }

    fun float mid(float f)
    {
        f => _midGain;
        f => _mid.gain;
        return f;
    }

    fun float high()
    {
        return _highGain;
    }

    fun float high(float f)
    {
        f => _highGain;
        f => _high.gain;
        return f;
    }

    fun static Nyc create()
    {
        Nyc nyc;
        return nyc;
    }

    fun static Nyc create(float low, float mid, float high)
    {
        Nyc nyc;
        low => nyc.low;
        mid => nyc.mid;
        high => nyc.high;
        return nyc;
    }

    fun static Nyc create(float low, float mid, float high, float threshold, dur attackTime, dur releaseTime)
    {
        Nyc nyc;
        low => nyc.low;
        mid => nyc.mid;
        high => nyc.high;
        threshold => nyc.limit.threshold;
        attackTime => nyc.limit.attackTime;
        releaseTime => nyc.limit.releaseTime;
        return nyc;
    }
}