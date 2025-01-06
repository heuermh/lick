/*

    LiCK  Library for ChucK.
    Copyright (c) 2007-2025 held jointly by the individual authors.

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
// idea from Plaits
// pichenettes/eurorack/plaits/dsp/oscillator/string_synth_oscillator.h
//
// A mixture of 7 sawtooth and square waveforms in the style of divide-down organs
// 0-6 are Saw 8', Square 8', Saw 4', Square 4', Saw 2', Square 2', Saw 1'
//

public class Banks extends Chugraph
{
    SawOsc _saw8;
    SqrOsc _sqr8;
    SawOsc _saw4;
    SqrOsc _sqr4;
    SawOsc _saw2;
    SqrOsc _sqr2;
    SawOsc _saw1;

    float _freq8;
    float _freq4;
    float _freq2;
    float _freq1;

    Mixer.create(7) @=> Mixer _mixer;

    _mixer => outlet;

    {
        _saw8 => _mixer.input(0);
        _sqr8 => _mixer.input(1);
        _saw4 => _mixer.input(2);
        _sqr4 => _mixer.input(3);
        _saw2 => _mixer.input(4);
        _sqr2 => _mixer.input(5);
        _saw1 => _mixer.input(6);

        _mixer.distribute(1.0);
    }

    fun float freq()
    {
        return _freq8;
    }

    fun float freq(float f)
    {
        return bankFreqs(f, f/2.0, f/4.0, f/8.0);
    }

    fun float bankFreqs(float freq8, float freq4, float freq2, float freq1)
    {
        freq8 => _freq8;
        freq4 => _freq4;
        freq2 => _freq2;
        freq1 => _freq1;

        freq8 => _saw8.freq;
        freq8 => _sqr8.freq;

        // prevent div down freqs lower than 10 hz
        if (freq4 < 0.1)
        {
            freq8 => _saw4.freq;
            freq8 => _sqr4.freq;                        
            freq8 => _saw2.freq;
            freq8 => _sqr2.freq;                        
            freq8 => _saw1.freq;
        }
        else if (freq2 < 0.1)
        {
            freq4 => _saw2.freq;
            freq4 => _sqr2.freq;                        
            freq4 => _saw1.freq;
        }
        else if (freq1 < 0.1)
        {
            freq2 => _saw1.freq;
        }
        else
        {
            freq4 => _saw4.freq;
            freq4 => _sqr4.freq;                        
            freq2 => _saw2.freq;
            freq2 => _sqr2.freq;                        
            freq1 => _saw1.freq;
        }
        return _freq8;
    }

    fun void bankGains(float saw8, float sqr8, float saw4, float sqr4, float saw2, float sqr2, float saw1)
    {
        saw8 => _mixer.input(0).gain;
        sqr8 => _mixer.input(1).gain;
        saw4 => _mixer.input(2).gain;
        sqr4 => _mixer.input(3).gain;
        saw2 => _mixer.input(4).gain;
        sqr2 => _mixer.input(5).gain;
        saw1 => _mixer.input(6).gain;

        _mixer.normalize();
    }

    fun static Banks create()
    {
        Banks banks;
        return banks;
    }

    fun static Banks create(float saw8, float sqr8, float saw4, float sqr4, float saw2, float sqr2, float saw1)
    {
        Banks banks;
        banks.bankGains(saw8, sqr8, saw4, sqr4, saw2, sqr2, saw1);
        return banks;
    }
}
