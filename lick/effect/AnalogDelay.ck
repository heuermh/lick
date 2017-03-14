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

// analog-style delay with dist and filter
public class AnalogDelay extends Feedback
{
    Delay _delay;
    LPF _lpf;
    WaveShaper @ _dist;

    pre => _delay => post;

    {
        0.2 => feedback;
        20000.0 => cutoff;
        1.0 => resonance;
    }

    // todo: does this need to be lazy or can @'d ugens be replaced at will?
    fun void _init()
    {
        feedbackOut => _dist => _lpf => feedbackIn;
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

    fun static AnalogDelay create(dur delay, float feedback)
    {
        Dist dist;
        return create(dist, delay, feedback);
    }

    fun static AnalogDelay create(dur delay, float feedback, float cutoff, float resonance)
    {
        Dist dist;
        return create(dist, delay, feedback, cutoff, resonance);
    }

    fun static AnalogDelay create(WaveShaper ws)
    {
        AnalogDelay analogDelay;
        ws @=> analogDelay._dist;
        analogDelay._init();
        return analogDelay;
    }

    fun static AnalogDelay create(WaveShaper ws, dur delay, float feedback)
    {
        AnalogDelay analogDelay;
        ws @=> analogDelay._dist;
        analogDelay._init();
        delay => analogDelay.max;
        delay => analogDelay.delay;
        feedback => analogDelay.feedback;
        return analogDelay;
    }

    fun static AnalogDelay create(WaveShaper ws, dur delay, float feedback, float cutoff, float resonance)
    {
        AnalogDelay analogDelay;
        ws @=> analogDelay._dist;
        analogDelay._init();
        delay => analogDelay.max;
        delay => analogDelay.delay;
        feedback => analogDelay.feedback;
        cutoff => analogDelay.cutoff;
        resonance => analogDelay.resonance;
        return analogDelay;
    }
}
