/*

    LiCK  Library for ChucK.
    Copyright (c) 2007-2024 held jointly by the individual authors.

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

// analog-style delay with HPF pre filter and LPF recovery filter
public class RecoveryDelay extends Feedback
{
    Delay _delay;
    LPF _lpf;
    HPF _hpf;

    pre => _hpf => _delay => _lpf => post;
    feedbackOut => feedbackIn;

    {
        0.8 => feedback;
        1000.0 => lowPassCutoff;
        1.0 => lowPassResonance;
        200.0 => highPassCutoff;
        1.0 => highPassResonance;

        2::second => max;
        200::ms => delay;
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

    fun static RecoveryDelay create()
    {
        RecoveryDelay recoveryDelay;
        return recoveryDelay;
    }

    fun static RecoveryDelay create(dur delay, float feedback)
    {
        RecoveryDelay recoveryDelay;
        delay => recoveryDelay.delay;
        feedback => recoveryDelay.feedback;
        return recoveryDelay;
    }

    fun static RecoveryDelay create(dur delay, float feedback, float lowPassCutoff, float lowPassResonance, float highPassCutoff, float highPassResonance)
    {
        RecoveryDelay recoveryDelay;
        delay => recoveryDelay.delay;
        feedback => recoveryDelay.feedback;
        lowPassCutoff => recoveryDelay.lowPassCutoff;
        lowPassResonance => recoveryDelay.lowPassResonance;
        highPassCutoff => recoveryDelay.highPassCutoff;
        highPassResonance => recoveryDelay.highPassResonance;
        return recoveryDelay;
    }
}
