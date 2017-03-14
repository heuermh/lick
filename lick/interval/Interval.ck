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

    fun int isAscending()
    {
        return (antecedent > consequent);
    }

    fun Interval asc()
    {
        return ascending();
    }

    fun Interval ascending()
    {
        if (isDescending())
        {
            antecedent => float tmp;
            consequent => antecedent;
            tmp => consequent;
        }
        return this;
    }

    fun int isDescending()
    {
        return (antecedent < consequent);
    }

    fun Interval desc()
    {
        return descending();
    }

    fun Interval descending()
    {
        if (isAscending())
        {
            antecedent => float tmp;
            consequent => antecedent;
            tmp => consequent;
        }
        return this;
    }

    fun Interval inversion()
    {
        /*
          For intervals identified by their ratio, the inversion is determined by
          reversing the ratio and multiplying by 2. For example, the inversion of a
          5:4 ratio is an 8:5 ratio.

          http://en.wikipedia.org/wiki/Interval_(music)#Inversion
        */
        antecedent => float tmp;
        consequent * 2.0 => antecedent;
        tmp => consequent;
        return this;
    }
}
