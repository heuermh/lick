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

public class SlewStep extends Chugen
{
    0 => int _samples;
    0.0 => float _last;
    0.0 => float _next;
    10::samp => dur _slew;
    Interpolations.linear() @=> Interpolation _interpolation;


    fun dur slew()
    {
        return _slew;
    }

    fun dur slew(dur d)
    {
        d => _slew;
        return d;
    }

    fun Interpolation interpolation()
    {
        return _interpolation;
    }

    fun Interpolation interpolation(Interpolation i)
    {
        i @=> _interpolation;
        return i;
    }

    fun float next(float f)
    {
        _next => _last;
        0 => _samples;
        f => _next;
        return f;
    }

    fun float tick(float in)
    {
        // have to count samples rather than calculate difference from now
        //   since now doesn't work in the tick method in a Chugen
        //   see https://github.com/spencersalazar/chuck/issues/28

        Constrain.constrainf((_samples * 1::samp) / _slew, 0.0, 1.0) => float f;
        _interpolation.evaluate(f) => float v;
        _samples++;
        return Constrain.constrainf(_last + v * (_next - _last), -1.0, 1.0);
    }


    fun static SlewStep create()
    {
        SlewStep slewStep;
        return slewStep;
    }

    fun static SlewStep create(dur slew)
    {
        SlewStep slewStep;
        slew => slewStep.slew;
        return slewStep;
    }

    fun static SlewStep create(dur slew, Interpolation interpolation)
    {
        SlewStep slewStep;
        slew => slewStep.slew;
        interpolation => slewStep.interpolation;
        return slewStep;
    }
}
