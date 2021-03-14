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

//
// pitch shifter/delay with lots of options
//

public class Breeze extends Effect
{
    Mixer.create(5) @=> Mixer mixer;
    mixer.inputs.get(0) $ Gain @=> Gain delayed;
    mixer.inputs.get(1) $ Gain @=> Gain shifted;
    mixer.inputs.get(2) $ Gain @=> Gain delayedShifted;
    mixer.inputs.get(3) $ Gain @=> Gain octaveUp;
    mixer.inputs.get(4) $ Gain @=> Gain octaveDown;

    mixer => Gain post => wet;

    Mixer.create(4) @=> Mixer feedbackMixer;
    feedbackMixer.inputs.get(0) $ Gain @=> Gain feedback;
    feedbackMixer.inputs.get(1) $ Gain @=> Gain shiftedFeedback;
    feedbackMixer.inputs.get(2) $ Gain @=> Gain octaveUpFeedback;
    feedbackMixer.inputs.get(3) $ Gain @=> Gain octaveDownFeedback;

    inlet => Gain pre;
    feedbackMixer => pre;

    pre => Delay _delay => delayed;
    pre => PitShift _shift => shifted;
    _delay => PitShift _delayShift => delayedShifted;
    pre => PitShift _octaveUpShift => octaveUp;
    pre => PitShift _octaveDownShift => octaveDown;

    post => feedback;
    post => PitShift _feedbackShift => shiftedFeedback;
    post => PitShift _feedbackOctaveUpShift => octaveUpFeedback;
    post => PitShift _feedbackOctaveDownShift => octaveDownFeedback;

    1.0 => float _s;
    1.0 => float _fs;
    Lfo shiftLfo => blackhole;
    Lfo feedbackShiftLfo => blackhole;

    {
        2::second => _delay.max;
        200::ms => _delay.delay;

        0.6 => delayed.gain;
        0.2 => shifted.gain;
        0.1 => delayedShifted.gain;
        0.07 => octaveUp.gain;
        0.03 => octaveDown.gain;

        0.48 => feedback.gain;
        0.16 => shiftedFeedback.gain;
        0.056 => octaveUpFeedback.gain;
        0.024 => octaveDownFeedback.gain;

        _s => _shift.shift;
        2.0 => _octaveUpShift.shift;
        0.5 => _octaveDownShift.shift;

        _fs => _feedbackShift.shift;
        2.0 => _feedbackOctaveUpShift.shift;
        0.5 => _feedbackOctaveDownShift.shift;

        0.05 => shiftLfo.gain;
        4.0 => shiftLfo.rate;
        shiftLfo.smoothSampleHold();

        0.05 => feedbackShiftLfo.gain;
        7.0 => feedbackShiftLfo.rate;
        feedbackShiftLfo.smoothSampleHold();

        spork ~ _updateAtSampleRate();
    }

    fun dur delay()
    {
        return _delay.delay();
    }

    fun dur delay(dur d)
    {
        d => _delay.delay;
    }

    fun dur max()
    {
        return _delay.max();
    }

    fun dur max(dur d)
    {
        d => _delay.max;
    }

    fun float shift()
    {
        return _shift.shift();
    }

    fun float shift(float f)
    {
        f => _s;
        _s => _shift.shift;
        return _s;
    }

    fun float feedbackShift()
    {
        return _feedbackShift.shift();
    }

    fun float feedbackShift(float f)
    {
        f => _fs;
        _fs => _feedbackShift.shift;
        return _fs;
    }

    fun void _updateAtSampleRate()
    {
        while (true)
        {
            1::samp => now;
            _s + shiftLfo.last() => _shift.shift;
            _fs + feedbackShiftLfo.last() => _feedbackShift.shift;
        }
    }

    fun static Breeze breeze()
    {
        Breeze breeze;
        return breeze;
    }

    fun static Breeze create(dur delay)
    {
        Breeze breeze;
        delay => breeze.max;
        delay => breeze.delay;
        return breeze;
    }

    fun static Breeze create(dur max, dur delay)
    {
        Breeze breeze;
        max => breeze.max;
        delay => breeze.delay;
        return breeze;
    }

    fun static Breeze create(dur max, dur delay, float shift, float feedbackShift)
    {
        Breeze breeze;
        max => breeze.max;
        delay => breeze.delay;
        shift => breeze.shift;
        feedbackShift => breeze.feedbackShift;
        return breeze;
    }
}
