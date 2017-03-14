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

// should perhaps be called SigmuEnvelopeFollower?
public class SigmuGainFollower extends Chubgraph
{
    Sigmund sigmu;
    FloatProcedure @ procedure;

    0.0 => float _gain;
    1024::samp => dur rate;

    spork ~ _sporkAtRate();
    spork ~ _sporkAtSampleRate();

    inlet => sigmu => outlet;

    fun void _sporkAtRate()
    {
        while (true)
        {
            rate => now;
            procedure.run(_gain);
        }
    }

    fun void _sporkAtSampleRate()
    {
        while (true)
        {
            1::samp => now;
            sigmu.env() => float db;

            // appears to not be db, rather between ~10.0 to ~95.0
            //dbtogain(db) => _gain;
            db/100.0 => _gain;
        }
    }

    // https://lists.cs.princeton.edu/pipermail/chuck-users/2006-March/000431.html
    fun static float dbtogain(float db)
    {
        return Math.pow(2.0, db/3.0);
    }

    fun static SigmuGainFollower create(FloatProcedure procedure)
    {
        SigmuGainFollower gainFollower;
        procedure @=> gainFollower.procedure;
        return gainFollower;
    }
}
