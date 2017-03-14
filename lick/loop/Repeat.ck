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

// repeat a procedure n times
public class Repeat extends Procedure
{
    int n;
    dur offset;
    Procedure procedure;
    FloatProcedure floatProcedure;
    DurProvider waitProvider;

    fun void run()
    {
        offset => now;
        for (0 => int i; i < n; i++)
        {
            i / n => float ratio;
            procedure.run();
            floatProcedure.run(ratio);
            waitProvider.evaluate() => dur wait;
            wait => now;
        }
    }
}
