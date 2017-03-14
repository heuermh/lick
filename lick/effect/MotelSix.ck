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

public class MotelSix extends Effect
{
    0 => static int ATTACK;
    1 => static int RELEASE;
    ATTACK => int _state;

    now => time _last;

    dur _attack;
    dur _gainAttack;
    dur _tremoloDepthAttack;
    dur _tremoloRateAttack;
    dur _pitchShiftAttack;

    dur _release;
    dur _gainRelease;
    dur _tremoloDepthRelease;
    dur _tremoloRateRelease;
    dur _pitchShiftRelease;

    // maximum (fastest) tremolo rate
    float _rate;

    /*
      Gain:
      |***       |    *
      |   *      |    *
      |    *     |   *
      |____*_    |***___
        rel        atk
     */
    Interpolations.exponentialIn() @=> Interpolation _gainAttackRamp;
    Interpolations.exponentialOut() @=> Interpolation _gainReleaseRamp;

    /*
      Tremolo depth:
      |******   |*
      |         |*
      |         | *
      |______   |__***_
        rel        atk
     */
    Interpolations.exponentialIn() @=> Interpolation _tremoloDepthAttackRamp;

    /*
      Tremolo rate:
      |***       |   *
      |   *      |  *
      |    *     | *
      |____*_    |*____
        rel        atk
     */
    Interpolations.linear() @=> Interpolation _tremoloRateAttackRamp;
    Interpolations.exponentialOut() @=> Interpolation _tremoloRateReleaseRamp;

    /*
      Pitch shift:
      |*         |   *
      | *        |  *
      |  *       | *
      |___*_     |*____
        rel        atk

      (interpolation is linear, intervals are not)

     */
    Intervals.octave().desc() @=> Interval _pitchShiftInterval;

    Tremolo _tremolo;
    PitShift _pitchShift;

    inlet => _pitchShift => _tremolo => wet;
    {
        _tremolo.hyperLfo();
        1.0 => _pitchShift.mix;
        0.0 => _pitchShift.shift;

        1.0 => mix;
        8.0 => rate;
        20::ms => attack;
        2::second => release;

        spork ~ _updateAtSampleRate();
    }

    fun dur attack()
    {
        return _attack;
    }

    fun dur attack(dur d)
    {
        d => _attack;
        _attack => _gainAttack;
        _attack => _tremoloDepthAttack;
        _attack => _tremoloRateAttack;
        _attack => _pitchShiftAttack;
        return _attack;
    }

    fun dur release()
    {
        return _release;
    }

    fun dur release(dur d)
    {
        d => _release;
        _release => _gainRelease;
        _release => _tremoloDepthRelease;
        _release => _tremoloRateRelease;
        _release => _pitchShiftRelease;
        return _release;
    }

    fun float rate()
    {
        return _rate;
    }

    fun float rate(float f)
    {
        f => _rate;
        return _rate;
    }

    fun void sawLfo()
    {
        _tremolo.sawLfo();
    }

    fun void sinLfo()
    {
        _tremolo.sinLfo();
    }

    fun void sqrLfo()
    {
        _tremolo.sqrLfo();
    }

    fun void triLfo()
    {
        _tremolo.triLfo();
    }

    fun void hyperLfo()
    {
        _tremolo.hyperLfo();
    }

    fun void sampleHoldLfo()
    {
        _tremolo.sampleHoldLfo();
    }

    fun void smoothSampleHoldLfo()
    {
        _tremolo.smoothSampleHoldLfo();
    }

    fun void lfo(float saw, float sin, float sqr, float tri, float hyper, float sh, float ssh)
    {
        _tremolo.lfo(saw, sin, sqr, tri, hyper, sh, ssh);
    }

    fun void trigger()
    {
        now => _last;
        if (_state == ATTACK)
        {
            RELEASE => _state;
        }
        else
        {
            ATTACK => _state;
        }
        <<<"trigger, state", _state>>>;
    }

    fun void _updateAtSampleRate()
    {
        while (true)
        {
            (now - _last) => dur d;
            // todo:  might sound better to unchuck pitchShift when not attack or release
            if (_state == ATTACK && d < _attack)
            {
                _gainAttackRamp.evaluate(d/_gainAttack) => _tremolo.gain;
                _tremoloDepthAttackRamp.evaluate(1.0 - d/_tremoloDepthAttack) => _tremolo.depth;
                _tremoloRateAttackRamp.evaluate(d/_tremoloRateAttack) * _rate => _tremolo.rate;
                Interpolate.linear(d/_pitchShiftAttack, 0.0, 1.0, _pitchShiftInterval.evaluate(1.0), 1.0) => _pitchShift.shift;
            }
            else if (_state == RELEASE && d < _release)
            {
                _gainReleaseRamp.evaluate(1.0 - d/_gainRelease) => _tremolo.gain;
                1.0 => _tremolo.depth;
                _tremoloRateReleaseRamp.evaluate(1.0 - d/_tremoloRateRelease) * _rate => _tremolo.rate;                
                Interpolate.linear(d/_pitchShiftRelease, 0.0, 1.0, 1.0, _pitchShiftInterval.evaluate(1.0)) => _pitchShift.shift;
            }
            1::samp => now;
        }
        // not close enough
        if (_tremolo.gain() < 0.01)
        {
            0.0 => _tremolo.gain;
        }
        if (_tremolo.depth() < 0.01)
        {
            0.0 => _tremolo.depth;
        }
        if (Math.fabs(1.0 - _pitchShift.shift()) < 0.01)
        {
            1.0 => _pitchShift.shift;
        }
    }
}
