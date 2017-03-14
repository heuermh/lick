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

//
// similar to Electro-Harmonix Freeze Sound Retainer
//   buy one here http://www.ehx.com/products/freeze
//

public class Freeze extends Effect
{
    8 => int _size;
    ArrayList _lisas;
    400::ms => dur _rate;
    40::ms => dur _recRamp;
    100::ms => dur _attack;
    800::ms => dur _decay;
    0.20 => float _spread;
    0 => int _index;

    0 => static int THAWED;
    1 => static int FREEZING;
    2 => static int FROZEN;
    3 => static int THAWING;

    THAWED => int _state;

    // must call this after ctr
    fun void init()
    {
        0 => _running;

        for (0 => int i; i < _size; i++)
        {
            inlet => LiSa lisa => wet;
            _rate => lisa.duration;
            1 => lisa.loop;
            0 => lisa.play;
            1 => lisa.record;
            _recRamp => lisa.recRamp;
            lisa.voiceGain(0, 1.0);
            _lisas.add(lisa);
        }

        spork ~ _update();
    }

    fun void _update()
    {
        while (true)
        {
            _rate/_size => now;

            if (_state == THAWED)
            {
                _lisas.get(_index) $ LiSa @=> LiSa lisa;

                // only randomly update (1.0 - spread) at any one time
                if (Math.randomf() > (1.0 - _spread))
                {
                    0 => lisa.record;
                    lisa.clear();

                    0::samp => lisa.recPos;
                    1 => lisa.record;
                }

                _index + 1 => _index;
                if (_index == _size)
                {
                    0 => _index;
                }
            }
        }
    }

    fun dur attack()
    {
        return _attack;
    }

    fun dur attack(dur d)
    {
        d => _attack;
        return d;
    }

    fun dur decay()
    {
        return _decay;
    }

    fun dur decay(dur d)
    {
        d => _decay;
        return d;
    }

    fun float spread()
    {
        return _spread;
    }

    fun float spread(float f)
    {
        Constrain.constrainf(f, 0.0, 1.0) => _spread;
        return _spread;
    }

    fun void freeze()
    {
        if (_state == THAWED)
        {
            FREEZING => _state;
            _lisas.iterator() @=> Iterator iterator;
            while (iterator.hasNext())
            {
                iterator.next() $ LiSa @=> LiSa lisa;
                0::samp => lisa.playPos;
                _attack => lisa.rampUp;
                0 => lisa.record;
            }
            FROZEN => _state;
        }
    }

    fun void thaw()
    {
        if (_state == FROZEN)
        {
            THAWING => _state;
            _lisas.iterator() @=> Iterator iterator;
            while (iterator.hasNext())
            {
                iterator.next() $ LiSa @=> LiSa lisa;
                _decay => lisa.rampDown;
            }
            THAWED => _state;
        }
    }

    fun static Freeze create()
    {
        Freeze freeze;
        freeze.init();
        return freeze;
    }

    fun static Freeze create(int size, dur rate)
    {
        Freeze freeze;
        size => freeze._size;
        rate => freeze._rate;
        freeze.init();
        return freeze;
    }

    fun static Freeze create(int size, dur rate, dur attack, dur decay, float spread)
    {
        Freeze freeze;
        size => freeze._size;
        rate => freeze._rate;
        attack => freeze.attack;
        decay => freeze.decay;
        spread => freeze.spread;
        freeze.init();
        return freeze;
    }
}
