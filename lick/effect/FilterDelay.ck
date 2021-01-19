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

// analog-style delay with LPF and HPF filters on feedback loop
public class FilterDelay extends Feedback
{
    Delay _delay;
    LPF _lpf;
    HPF _hpf;

    pre => _delay => post;
    feedbackOut => _lpf => _hpf => feedbackIn;

    {
        0.8 => feedback;
        20000.0 => lowPassCutoff;
        1.0 => lowPassResonance;
        200.0 => highPassCutoff;
        1.0 => highPassResonance;
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

    fun float lowPassCutoff()
    {
        return _lpf.freq();
    }

    fun float lowPassCutoff(float f)
    {
        return _lpf.freq(f);
    }

    fun float lowPassResonance()
    {
        return _lpf.Q();
    }

    fun float lowPassResonance(float f)
    {
        return _lpf.Q(f);
    }

    fun float highPassCutoff()
    {
        return _hpf.freq();
    }

    fun float highPassCutoff(float f)
    {
        return _hpf.freq(f);
    }

    fun float highPassResonance()
    {
        return _hpf.Q();
    }

    fun float highPassResonance(float f)
    {
        return _hpf.Q(f);
    }

    fun static FilterDelay create()
    {
        FilterDelay filterDelay;
        return filterDelay;
    }

    fun static FilterDelay create(dur delay, float feedback)
    {
        FilterDelay filterDelay;
        delay => filterDelay.delay;
        feedback => filterDelay.feedback;
        return filterDelay;
    }

    fun static FilterDelay create(dur delay, float feedback, float lowPassCutoff, float lowPassResonance, float highPassCutoff, float highPassResonance)
    {
        FilterDelay filterDelay;
        delay => filterDelay.delay;
        feedback => filterDelay.feedback;
        lowPassCutoff => filterDelay.lowPassCutoff;
        lowPassResonance => filterDelay.lowPassResonance;
        highPassCutoff => filterDelay.highPassCutoff;
        highPassResonance => filterDelay.highPassResonance;
        return filterDelay;
    }
}
