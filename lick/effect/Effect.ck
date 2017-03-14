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

//
// abstract class Effect
// to use, chuck inlet to effect to wet, e.g.
// inlet => MyEffect effect => wet;
//

public class Effect extends Chubgraph
{
    Gain dry;
    Gain wet;

    0.0 => float _dryGain;
    1.0 => float _wetGain;

    _dryGain => dry.gain;
    _wetGain => wet.gain;

    // chuck inlet to effect to wet
    wet => outlet;
    inlet => dry => outlet;

    // running by default
    true => int _running;

    fun float mix(float f)
    {
        f => _wetGain;
        1.0 - f => _dryGain;

        _wetGain => wet.gain;
        _dryGain => dry.gain;
        return _wetGain;
    }

    fun float mix()
    {
        return _wetGain;
    }

    fun void start()
    {
        if (!_running)
        {
            _dryGain => dry.gain;
            _wetGain => wet.gain;
            true => _running;
        }
    }

    fun void stop()
    {
        if (_running)
        {
            1.0 => dry.gain;
            0.0 => wet.gain;
            false => _running;
        }
    }

    fun void toggle()
    {
        if (_running)
        {
            stop();
        }
        else
        {
            start();
        }
    }

    fun int running()
    {
        return _running;
    }
}
