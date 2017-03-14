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
// Inspired by the Evaton Technologies SDIY MDRONE
// Buy a kit here:  https://foxtonemusic.com/shop/pedals/everything-else/sdiy-mdrone/
//

public class Mdrone extends Chubgraph
{
    SqrOsc _osc1;
    SqrOsc _osc2;
    SqrOsc _osc3;
    Gain _mix;
    Dist _dist;
    BPF _bpf;
    float _freq1;
    float _freq2;
    float _freq3;
    float _gain1;
    float _gain2;
    float _gain3;
    float _cutoff;
    float _resonance;
    float _volume;

    0 => static int OFF;
    1 => static int ON;
    ON => int _mode1;
    ON => int _mode2;
    ON => int _mode3;

    inlet => blackhole;
    _osc1 => _mix;
    _osc2 => _mix;
    _osc3 => _mix;
    _mix => _dist => _bpf => outlet;

    {
        220.0 => freq1;
        220.01 => freq2;
        110.007 => freq3;
        0.33 => gain1;
        0.33 => gain2;
        0.33 => gain3;
        8800.0 => cutoff;
        0.05 => resonance;
        1.0 => volume;

        //spork ~ _tickAtSampleRate();
    }

    fun float freq1()
    {
        return _freq1;
    }

    fun float freq1(float f)
    {
        f => _freq1;
        _freq1 => _osc1.freq;
        return _freq1;
    }

    fun float freq2()
    {
        return _freq2;
    }

    fun float freq2(float f)
    {
        f => _freq2;
        _freq2 => _osc2.freq;
        return _freq2;
    }

    fun float freq3()
    {
        return _freq3;
    }

    fun float freq3(float f)
    {
        f => _freq3;
        _freq3 => _osc3.freq;
        return _freq3;
    }

    fun float gain1()
    {
        return _gain1;
    }

    fun float gain1(float f)
    {
        f => _gain1;
        _gain1 => _osc1.gain;
        return _gain1;
    }

    fun float gain2()
    {
        return _gain2;
    }

    fun float gain2(float f)
    {
        f => _gain2;
        _gain2 => _osc2.gain;
        return _gain2;
    }

    fun float gain3()
    {
        return _gain3;
    }

    fun float gain3(float f)
    {
        f => _gain3;
        _gain3 => _osc3.gain;
        return _gain3;
    }

    fun int mode1()
    {
        return _mode1;
    }

    fun int mode1(int i)
    {
        i => _mode1;
        return _mode1;
    }

    fun int mode2()
    {
        return _mode2;
    }

    fun int mode2(int i)
    {
        i => _mode2;
        return _mode2;
    }

    fun int mode3()
    {
        return _mode3;
    }

    fun int mode3(int i)
    {
        i => _mode3;
        return _mode3;
    }

    fun void toggle1()
    {
        if (ON == _mode1)
        {
            0.0 => _osc1.gain;
            OFF => _mode1;
        }
        else
        {
            _gain1 => _osc1.gain;
            ON => _mode1;
        }
    }

    fun void toggle2()
    {
        if (ON == _mode2)
        {
            0.0 => _osc2.gain;
            OFF => _mode2;
        }
        else
        {
            _gain2 => _osc2.gain;
            ON => _mode2;
        }
    }

    fun void toggle3()
    {
        if (ON == _mode3)
        {
            0.0 => _osc3.gain;
            OFF => _mode3;
        }
        else
        {
            _gain3 => _osc3.gain;
            ON => _mode3;
        }
    }

    fun float cutoff()
    {
        return _cutoff;
    }

    fun float cutoff(float f)
    {
        f => _cutoff;
        _cutoff => _bpf.freq;
        return f;
    }

    fun float resonance()
    {
        return _resonance;
    }

    fun float resonance(float f)
    {
        f => _resonance;
        _resonance => _bpf.Q;
        return _resonance;
    }

    fun float volume()
    {
        return _volume;
    }

    fun float volume(float f)
    {
        f => _volume;
        _volume => outlet.gain;
        return _volume;
    }

    /*
    fun void _tickAtSampleRate()
    {
        while (true)
        {
            1::samp => now;
            if (mode == CV)
            {
                cv1.last() => freq1;
                cv2.last() => freq2;
                cv3.last() => freq3;
                cv4.last() => cutoff;
                cv5.last() => resonance;
                cv6.last() => volume;
            }
            else
            {
                _freq1 => freq1;
                _freq2 => freq2;
                _freq3 => freq3;
                _cutoff => cutoff;
                _resonance => resonance;
                _volume => volume;
            }
        }
    }
    */
}
