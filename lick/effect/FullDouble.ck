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

public class FullDouble extends Feedback
{
    LPF _lpf1;
    LPF _lpf2;
    Delay _delay;

    0 => static int SHORT;
    1 => static int LONG;
    SHORT => int _mode;

    0 => static int OFF;
    1 => static int ON;
    2 => static int RECOVERING;
    OFF => static int _slam;

    now => time _last;
    100::ms => dur _rate;
    10::second => dur _length;
    0.0 => float _lastFeedback;

    /*

        pre --> lpf 7238.0 Hz --> delay --> lpf 10266.6 Hz --> post

     */
    pre => _lpf1 => _delay => _lpf2 => post;
    feedbackOut => feedbackIn;

    {
        7238.0 => _lpf1.freq;
        10266.6 => _lpf2.freq;
        100::ms => _delay.max;

        0.0 => feedback;
        SHORT => mode;

        spork ~ _sporkAtRate();
    }

    fun void short()
    {
        mode(SHORT);
    }

    fun void long()
    {
        mode(LONG);
    }

    fun int mode()
    {
        return _mode;
    }

    fun int mode(int i)
    {
        i => _mode;
        if (SHORT == _mode)
        {
            50::ms => _delay.delay;
        }
        else if (LONG == _mode)
        {
            100::ms => _delay.delay;
        }
        return _mode;
    }

    fun int slam()
    {
        if (ON == _slam)
        {
            now => _last;
            RECOVERING => _slam;
        }
        else if (OFF == _slam)
        {
            feedback() => _lastFeedback;
            0.998 => feedback;
            ON => _slam;
        }
        else if (RECOVERING == _slam)
        {
            // don't reset last feedback
            0.998 => feedback;
            ON => _slam;
        }
        return _slam;
    }

    fun void _sporkAtRate()
    {
        while (true)
        {
            now => time current;
            if (_slam == RECOVERING)
            {
                if (current < (_last + _length))
                {
                    feedback() - _lastFeedback => float f;
                    (_length - (current - _last))/_length => float v;
                    _lastFeedback + (v * f) => feedback;

                    <<<"slam recovering, feedback", feedback()>>>;
                }
                else
                {
                    OFF => _slam;
                    <<<"slam off">>>;
                }
            }
            _rate => now;
        }
    }
}
