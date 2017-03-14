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

public class Princeton extends Effect
{
    0.0 => float _drive;
    0.0 => float _reverb;
    0.0 => float _tone;

    inlet => Amp amp => Cabinet cabinet => GVerb gverb => wet;

    {
        1.0 => amp.bass;
        0.1 => amp.mid;
        0.5 => amp.treble;

        0.6 => amp.drive;
        0.1 => amp.bright;
        0.6 => amp.power;

        "8x" => amp.overName;
        "stanford" => amp.tonestackName;

        "twin A" => cabinet.modelName;

        0.9 => gverb.dry;
        0.02 => gverb.early;
        0.07 => gverb.tail;
        30.0 => gverb.roomsize;
    }


    fun float drive()
    {
        return _drive;
    }

    fun float drive(float f)
    {
        f => _drive;
        Interpolate.linear(f, 0.0, 1.0, 0.6, 1.0) => amp.drive;
        Interpolate.linear(f, 0.0, 1.0, 0.6, 0.7) => amp.power;
        return _drive;
    }

    fun float reverb()
    {
        return _reverb;
    }

    fun float reverb(float f)
    {
        f => _reverb;
        0.9 - Interpolate.linear(f, 0.0, 1.0, 0.0, 0.7) => gverb.dry;
        Interpolate.linear(f, 0.0, 1.0, 0.2, 0.5) => gverb.early;
        Interpolate.linear(f, 0.0, 1.0, 0.7, 1.0) => gverb.tail;
        Interpolate.linear(f, 0.0, 1.0, 30.0, 60.0) => gverb.roomsize;
        return _reverb;
    }

    fun float tone()
    {
        return _tone;
    }

    fun float tone(float f)
    {
        f => _tone;
        Interpolate.linear(f, 0.0, 1.0, 0.1, 0.4) => amp.mid;
        Interpolate.linear(f, 0.0, 1.0, 0.5, 0.9) => amp.treble;
        return _tone;
    }
}
