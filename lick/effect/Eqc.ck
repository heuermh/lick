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

// eq + compressor of sorts
public class Eqc extends Effect
{
    LPF _low;
    HPF _high;
    BPF _mid;
    Gain _post; // or mixer?
    Comp comp;

    /*

      inlet --> _high --> _post --> comp --> wet
        |                   |
        +-----> _mid -------+
        |                   |
        +-----> _low -------+
        
    */
    inlet => _high => _post => comp => wet;
    inlet => _mid => _post;
    inlet => _low => _post;

    256.0 => static float LOW;
    2567.0 => static float HIGH;

    float _lowGain;
    float _midPeak;
    float _midGain;
    float _highGain;

    {
        LOW => _low.freq;
        HIGH=> _high.freq;

        low(0.33);
        mid(0.33);
        high(0.33);

        midPeak(0.5);
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

    fun float midPeak()
    {
        return _midPeak;
    }

    fun float midPeak(float f)
    {
        f => _midPeak;
        // should this be exp?
        Interpolate.linear(f, 0.0, 1.0, LOW, HIGH) => _mid.freq;
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

    fun static Eqc create()
    {
        Eqc eqc;
        return eqc;
    }

    fun static Eqc create(float low, float mid, float high)
    {
        Eqc eqc;
        low => eqc.low;
        mid => eqc.mid;
        high => eqc.high;
        return eqc;
    }

    fun static Eqc create(float low, float mid, float high, float midPeak)
    {
        Eqc eqc;
        low => eqc.low;
        mid => eqc.mid;
        high => eqc.high;
        midPeak => eqc.midPeak;
        return eqc;
    }

    fun static Eqc create(float low, float mid, float high, float midPeak, float ratio, float threshold, dur attackTime, dur releaseTime)
    {
        Eqc eqc;
        low => eqc.low;
        mid => eqc.mid;
        high => eqc.high;
        midPeak => eqc.midPeak;
        ratio => eqc.comp.ratio;
        threshold => eqc.comp.threshold;
        attackTime => eqc.comp.attackTime;
        releaseTime => eqc.comp.releaseTime;
        return eqc;
    }
}