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

public class BassDelay3 extends Chubgraph
{
    32 => static int VOICES;

    0 => int _voice;
    SawOsc _pulse[VOICES];
    ADSR _adsr[VOICES];
    MonoDelay2 _delay[VOICES];

    1.0 => float _x;
    100::ms => dur _period;

    inlet => blackhole;

    {
        for (0 => int i; i < VOICES; i++)
        {
            0.8 => _pulse[i].gain;

            8::ms => _adsr[i].attackTime;
            8::ms => _adsr[i].decayTime;
            10::ms => _adsr[i].releaseTime;
            0.8 => _adsr[i].sustainLevel;

            1.0 => _delay[i].mix;
            0.8 => _delay[i].gain;
            //1.0 / VOICES => _delay[i].gain;

            _pulse[i] => _adsr[i] => _delay[i] => outlet;
        }
    }

    fun void noteOn(int note)
    {
        noteOn(Std.mtof(note));
    }

    fun int _nextVoice()
    {
        _voice + 1 => _voice;
        if (_voice == VOICES)
        {
            0 => _voice;
        }
    }
 
    fun void noteOn(float freq)
    {
        (1::second / freq) * 10 => _period;

        _nextVoice();
        freq => _pulse[_voice].freq;
        _period * _x => _delay[_voice].delay;

        1 => _adsr[_voice].keyOn;
        (_period - _adsr[_voice].attackTime() - _adsr[_voice].decayTime()) => now;
        1 => _adsr[_voice].keyOff;
    }

    fun void noteOff()
    {
        // empty
    }

    fun float x() // delay time, factor, weight, multiplier?
    {
        return _x;
    }

    fun float x(float f)
    {
        Constrain.constrainf(f, 1.0, 4.0) => _x;
    }

    fun float feedback()
    {
        return _delay[0].feedback();
    }

    fun float feedback(float f)
    {
        for (0 => int i; i < VOICES; i++)
        {
            Constrain.constrainf(f, 0.01, 0.999) => _delay[i].feedback;
        }
        return f;
    }

    fun dur max()
    {
        return _delay[0].max();
    }

    fun dur max(dur d)
    {
        for (0 => int i; i < VOICES; i++)
        {
            d => _delay[i].max;
        }
        return d;
    }
}
