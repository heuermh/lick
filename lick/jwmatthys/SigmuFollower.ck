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

public class SigmuFollower extends Chubgraph
{
    Sigmund sigmu;
    FloatProcedure @ gainProcedure;
    FloatProcedure @ pitchProcedure;

    0.0 => float freq;
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
            gainProcedure.run(_gain);
            pitchProcedure.run(freq);
        }
    }

    fun void _sporkAtSampleRate()
    {
        while (true)
        {
            1::samp => now;
            sigmu.freq() => freq;
            sigmu.env() => float db;

            // appears to not be db, rather between ~10.0 to ~95.0
            //dbtogain(db) => _gain;
            db/100.0 => _gain;
        }
    }

    fun static SigmuFollower create(FloatProcedure gainProcedure, FloatProcedure pitchProcedure)
    {
        SigmuFollower follower;
        gainProcedure @=> follower.gainProcedure;
        pitchProcedure @=> follower.pitchProcedure;
        return follower;
    }
}
