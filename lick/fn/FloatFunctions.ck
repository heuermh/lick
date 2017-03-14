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

public class FloatFunctions
{
    fun static FloatFunction compose(FloatFunction g, FloatFunction h)
    {
        CompositeFloatFunction composite;
        g @=> composite.g;
        h @=> composite.h;
        return composite;
    }

    fun static FloatFunction condition(Predicate p, FloatFunction f)
    {
        ConditionalFloatFunction conditional;
        p @=> conditional.p;
        f @=> conditional.f;
        return conditional;
    }
    
    fun static FloatFunction identity(FloatFunction fn)
    {
        Identity identity;
        return compose(identity, fn);
    }

    fun static FloatFunction inverse(FloatFunction fn)
    {
        Inverse inverse;
        return compose(inverse, fn);
    }

    fun static FloatFunction negate(FloatFunction fn)
    {
        Negate negate;
        return compose(negate, fn);
    }

    fun static FloatFunction sin(FloatFunction fn)
    {
        Sin sin;
        return compose(sin, fn);
    }

    fun static FloatFunction cos(FloatFunction fn)
    {
        Cos cos;
        return compose(cos, fn);
    }

    fun static FloatFunction tan(FloatFunction fn)
    {
        Tan tan;
        return compose(tan, fn);
    }

    fun static FloatFunction asin(FloatFunction fn)
    {
        Asin asin;
        return compose(asin, fn);
    }

    fun static FloatFunction acos(FloatFunction fn)
    {
        Acos acos;
        return compose(acos, fn);
    }

    fun static FloatFunction atan(FloatFunction fn)
    {
        Atan atan;
        return compose(atan, fn);
    }

    fun static FloatFunction sinh(FloatFunction fn)
    {
        Sinh sinh;
        return compose(sinh, fn);
    }

    fun static FloatFunction cosh(FloatFunction fn)
    {
        Cosh cosh;
        return compose(cosh, fn);
    }

    fun static FloatFunction tanh(FloatFunction fn)
    {
        Tanh tanh;
        return compose(tanh, fn);
    }

    fun static FloatFunction sqrt(FloatFunction fn)
    {
        Sqrt sqrt;
        return compose(sqrt, fn);
    }

    fun static FloatFunction exp(FloatFunction fn)
    {
        Exp exp;
        return compose(exp, fn);
    }

    fun static FloatFunction log(FloatFunction fn)
    {
        Log log;
        return compose(log, fn);
    }

    fun static FloatFunction log2(FloatFunction fn)
    {
        Log2 log2;
        return compose(log2, fn);
    }

    fun static FloatFunction log10(FloatFunction fn)
    {
        Log10 log10;
        return compose(log10, fn);
    }

    fun static FloatFunction floor(FloatFunction fn)
    {
        Floor floor;
        return compose(floor, fn);
    }

    fun static FloatFunction ceil(FloatFunction fn)
    {
        Ceil ceil;
        return compose(ceil, fn);
    }

    fun static FloatFunction round(FloatFunction fn)
    {
        Round round;
        return compose(round, fn);
    }

    fun static FloatFunction trunc(FloatFunction fn)
    {
        Trunc trunc;
        return compose(trunc, fn);
    }
}
