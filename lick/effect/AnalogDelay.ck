/*

    LiCK  Library for ChucK.
    Copyright (c) 2007-2015 held jointly by the individual authors.

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

// analog-style delay with dist and filter
public class AnalogDelay extends Effect
{
    Delay _delay;
    Gain _pre;
    Gain _post;
    Gain _feedback;
    LPF _lpf;
    WaveShaper @ _dist;

    0.2 => _feedback.gain;
    20000.0 => _lpf.freq;
    1.0 => _lpf.Q;

    inlet => _pre => _delay;
    _post => _feedback => _pre;
    _post => wet;

    fun void _init()
    {
        _delay => _dist => _lpf => _post;
    }

    fun dur delay()
    {
        return _delay.delay();
    }

    fun dur delay(dur d)
    {
        return _delay.delay(d);
    }

    fun dur max()
    {
        return _delay.max();
    }

    fun dur max(dur d)
    {
        return _delay.max(d);
    }

    fun float feedback()
    {
        return _feedback.gain();
    }

    fun float feedback(float f)
    {
        return _feedback.gain(f);
    }

    fun float cutoff()
    {
        return _lpf.freq();
    }

    fun float cutoff(float f)
    {
        return _lpf.freq(f);
    }

    fun float resonance()
    {
        return _lpf.Q();
    }

    fun float resonance(float f)
    {
        return _lpf.Q(f);
    }

    fun static AnalogDelay create()
    {
        Dist dist;
        return create(dist);
    }

    fun static AnalogDelay create(WaveShaper ws)
    {
        AnalogDelay analogDelay;
        ws @=> analogDelay._dist;
        analogDelay._init();
        return analogDelay;
    }
}
