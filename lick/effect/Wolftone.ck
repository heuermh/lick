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

public class Wolftone extends Effect
{
    Delay _delay;
    PitShift _pitchShift;
    Phase _phase;
    Intervals.wolfFourth() @=> Interval _interval;

    inlet => _delay => _pitchShift => _phase => wet;

    {
        2000::ms => _delay.max;
        18::ms => _delay.delay;
        1.0 => _pitchShift.mix;
        _interval.evaluate(1.0) => _pitchShift.shift;
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

    fun Interval interval()
    {
        return _interval;
    }

    fun Interval interval(Interval i)
    {
        i @=> _interval;
        _interval.evaluate(1.0) => _pitchShift.shift;
        return i;
    }

    fun int phase()
    {
        return _phase.phase();
    }

    fun int phase(int i)
    {
        return _phase.phase(i);
    }

    fun void togglePhase()
    {
        _phase.toggle();
    }

    fun static Wolftone create()
    {
        Wolftone wolftone;
        return wolftone;
    }

    fun static Wolftone create(Interval interval)
    {
        Wolftone wolftone;
        wolftone.interval(interval);
        return wolftone;
    }
}
