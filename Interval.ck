/*

    LiCK  Library for ChucK.
    Copyright (c) 2007-2011 held jointly by the individual authors.

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

public class Interval extends FloatFunction
{
    1.0 => float antecedent;
    1.0 => float consequent;
    "1:1" => string ratio;
    "Interval" => string name;
    "Interval" => string description;

    fun float evaluate(float value)
    {
        return (antecedent / consequent) * value;
    }

    fun void inversion()
    {
        antecedent => float tmp;
        consequent => antecedent;
        tmp => consequent;
    }
}