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

// wraps Spectacle chugin
public class Spekt extends Effect
{
    Spectacle spekt;
    1.0 => spekt.mix;

    inlet => spekt => wet;

    fun void clear()
    {
        spekt.clear();
    }

    fun int fft(int i)
    {
        return spekt.fftlen(i);
    }

    fun int fft()
    {
        return spekt.fftlen();
    }

    fun int overlap(int i)
    {
        return spekt.overlap(i);
    }

    fun int overlap()
    {
        return spekt.overlap();
    }

    fun dur maxDelay(dur d)
    {
        return spekt.delayMax(d);
    }

    fun dur maxDelay()
    {
        return spekt.delayMax();
    }

    fun dur minDelay(dur d)
    {
        return spekt.delayMin(d);
    }

    fun dur minDelay()
    {
        return spekt.delayMin();
    }

    fun float maxFreq(float f)
    {
        return spekt.freqMax(f);
    }

    fun float maxFreq()
    {
        return spekt.freqMax();
    }

    fun float minFreq(float f)
    {
        return spekt.freqMin(f);
    }

    fun float minFreq()
    {
        return spekt.freqMin();
    }

    fun void range(float min, float max)
    {
        spekt.range(min, max);
    }

    fun int bands(int i)
    {
        return spekt.bands(i);
    }

    fun int bands()
    {
        return spekt.bands();
    }

    // uniform delay
    fun dur delay(dur d)
    {
        return spekt.delay(d);
    }

    // uniform eq
    fun float eq(float f)
    {
        return spekt.eq(f);
    }

    // uniform feedback
    fun float feedback(float f)
    {
        return spekt.feedback(f);
    }

    // or use tables . . .

    fun void randomDelay()
    {
        spekt.table("delay", "random");
    }

    fun void ascendingDelay()
    {
        spekt.table("delay", "ascending");
    }

    fun void descendingDelay()
    {
        spekt.table("delay", "descending");
    }

    fun void randomEq()
    {
        spekt.table("eq", "random");
    }

    fun void ascendingEq()
    {
        spekt.table("eq", "ascending");
    }

    fun void descendingEq()
    {
        spekt.table("eq", "descending");
    }

    fun void randomFeedback()
    {
        spekt.table("feedback", "random");
    }

    fun void ascendingFeedback()
    {
        spekt.table("feedback", "ascending");
    }

    fun void descendingFeedback()
    {
        spekt.table("feedback", "descending");
    }
}
