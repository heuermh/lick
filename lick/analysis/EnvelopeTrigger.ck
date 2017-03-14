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

public class EnvelopeTrigger
{
    ADSR adsr;
    EnvelopeFollower env;
    0.001 => float risingThreshold;
    0.000001 => float fallingThreshold;

    {
        1 => adsr.keyOff;
        spork ~ _updateAtRate();
    }

    fun void _updateAtRate()
    {
        while (true)
        {
            if (adsr.state() != 0 && env.last() >= risingThreshold)
            {
                <<<"state",adsr.state(),"last",env.last(),"--> keyOn">>>;
                1 => adsr.keyOn;
            }
            if (adsr.state() < 2 && env.last() <= fallingThreshold)
            {
                <<<"state",adsr.state(),"last",env.last(),"--> keyOff">>>;
                1 => adsr.keyOff;
            }
            env.rate() => now;
        }
    }
}
