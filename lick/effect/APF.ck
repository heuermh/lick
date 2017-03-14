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
// See
// http://www.spinsemi.com/knowledge_base/effects.html
//

public class APF extends Effect
{
    Gain _pre;
    Gain _post;
    Gain _forward;
    Gain _reverse;
    Delay _delay;
    Step _forwardCoefficient;
    Step _reverseCoefficient;

    /*

                             -0.5
                               |
                               |
                               v
                 +---------> forward -------+
                 |                          |
                 |                          v
      inlet --> pre -----------> delay --> post --> wet;
                 ^                |
                 |                |
                 +--- reverse <---+
                        ^
                        |
                      +0.5

    */

    inlet => _pre => _delay => _post => wet;
    _pre => _forward => _post;
    _delay => _reverse => _pre;
    _forwardCoefficient => _forward;
    _reverseCoefficient => _reverse;

    {
        // multiply inputs
        3 => _forward.op;
        3 => _reverse.op;

        200::ms => max;
        200::ms => delay;
        -0.5 => forwardCoefficient;
        0.5 => reverseCoefficient;
    }

    fun dur max()
    {
        return _delay.max();
    }

    fun dur max(dur d)
    {
        d => _delay.max;
        return d;
    }

    fun dur delay()
    {
        return _delay.delay();
    }

    fun dur delay(dur d)
    {
        d => _delay.delay;
        return d;
    }

    fun float forwardCoefficient()
    {
        return _forwardCoefficient.last();
    }

    fun float forwardCoefficient(float f)
    {
        f => _forwardCoefficient.next;
        return f;
    }

    fun float reverseCoefficient()
    {
        return _reverseCoefficient.last();
    }

    fun float reverseCoefficient(float f)
    {
        f => _reverseCoefficient.next;
        return f;
    }

    fun static APF create()
    {
        APF apf;
        return apf;
    }

    fun static APF create(dur delay, float coefficient)
    {
        APF apf;
        delay => apf.max;
        delay => apf.delay;
        -1.0 * coefficient => apf.forwardCoefficient;
        coefficient => apf.reverseCoefficient;
        return apf;
    }

    fun static APF create(dur max, dur delay, float forwardCoefficient, float reverseCoefficient)
    {
        APF apf;
        max => apf.max;
        delay => apf.delay;
        forwardCoefficient => apf.forwardCoefficient;
        reverseCoefficient => apf.reverseCoefficient;
        return apf;
    }
}
