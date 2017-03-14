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
// inspired by http://little-scale.blogspot.com/2013/08/hex-subsonic-waveform-m4l-device.html
//

public class SeptSubGen
{
    20.0 => float _freq;
    2.0 => float _freqSpread;
    0.0 => float _phase;
    0.0 => float _phaseSpread;

    Gain outputL;
    Gain outputR;
    SubGen gen0;
    SubGen gen1;
    SubGen gen2;
    SubGen gen3;
    SubGen gen4;
    SubGen gen5;
    SubGen gen6;

    {
        gen0.outputL => outputL;
        gen0.outputR => outputR;
        gen1.outputL => outputL;
        gen1.outputR => outputR;
        gen2.outputL => outputL;
        gen3.outputR => outputR;
        gen3.outputL => outputL;
        gen3.outputR => outputR;
        gen4.outputL => outputL;
        gen4.outputR => outputR;
        gen5.outputL => outputL;
        gen5.outputR => outputR;
        gen6.outputL => outputL;
        gen6.outputR => outputR;

        1.0 => outputL.gain;
        1.0 => outputL.gain;
    }


    fun float freq()
    {
        return _freq;
    }

    fun float freq(float freq)
    {
        freq => _freq;
        _updateFreq();
        return _freq;
    }

    fun float freqSpread()
    {
        return _freqSpread;
    }

    fun float freqSpread(float freqSpread)
    {
        freqSpread => _freqSpread;
        _updateFreq();
        return _freqSpread;
    }

    fun void _updateFreq()
    {
        _freq => gen0.freq;
        _freq + (_freqSpread * 0.33) => gen1.freq;
        _freq - (_freqSpread * 0.33) => gen2.freq;
        _freq + (_freqSpread * 0.66) => gen3.freq;
        _freq - (_freqSpread * 0.66) => gen4.freq;
        _freq + _freqSpread => gen5.freq;
        _freq - _freqSpread => gen6.freq;

        //<<<gen0.freq(), gen1.freq(), gen2.freq(), gen3.freq(), gen4.freq(), gen5.freq(), gen6.freq()>>>;
    }

    fun float phase()
    {
        return _phase;
    }

    fun float phase(float phase)
    {
        phase => _phase;
        _updatePhase();
        return _phase;
    }

    fun float phaseSpread()
    {
        return _phaseSpread;
    }

    fun float phaseSpread(float phaseSpread)
    {
        phaseSpread => _phaseSpread;
        _updatePhase();
        return _phaseSpread;
    }

    fun void _updatePhase()
    {
        _phase => gen0.phase;
        _phase + (_phaseSpread * 0.33) => gen1.phase;
        _phase - (_phaseSpread * 0.33) => gen2.phase;
        _phase + (_phaseSpread * 0.66) => gen3.phase;
        _phase - (_phaseSpread * 0.66) => gen4.phase;
        _phase + _phaseSpread => gen5.phase;
        _phase - _phaseSpread => gen6.phase;

        //<<<gen0.phase(), gen1.phase(), gen2.phase(), gen3.phase(), gen4.phase(), gen5.phase(), gen6.phase()>>>;
    }
}
