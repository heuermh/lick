/*

    LiCK  Library for ChucK.
    Copyright (c) 2007-2010 held jointly by the individual authors.

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

public class VoiceOfSaturn
{
    PulseOsc osc1;
    SqrOsc osc2;
    SqrOsc sqrLfo;
    TriOsc triLfo;
    Gain master;

    0 => int OFF; // or boolean false
    1 => int ON; // or boolean false
    ON => int _osc2Mode;

    0 => int SQUARE_LFO;
    1 => int TRIANGLE_LFO;
    ON => int _lfoMode;
    SQUARE_LFO => int _lfoType;

    {
        220.0 => osc1.freq;
        0.8 => osc1.gain;
        0.5 => osc1.width;
        20.0 => osc2.freq;
        0.8 => osc2.gain;
        1.0 => sqrLfo.freq;
        0.8 => sqrLfo.gain;
        1.0 => triLfo.freq;
        0.8 => triLfo.gain;
        1.0 => master.gain;

        osc1 => master;
        osc2 => blackhole;
        sqrLfo => blackhole;
        triLfo => blackhole;

        spork ~ updateAtSampleRate();
    }

    fun void updateAtSampleRate()
    {
        while (true)
        {
            if (_osc2Mode == ON)
            {
                ((osc2.last() + 2.0) / 2.0) * 0.5 => osc1.width;
            }
            if (_lfoMode == ON)
            {
                // todo  the docu describes this as amplitude mod
                // but the video shows this is modulating the freq
                if (_lfoType == SQUARE_LFO)
                {
                    ((sqrLfo.last() + 1.0) / 2.0) * 0.8 => osc1.gain;
                }
                if (_lfoType == TRIANGLE_LFO)
                {
                    ((triLfo.last() + 1.0) / 2.0) * 0.8 => osc1.gain;
                }
            }
            1::samp => now;
        }
    }

    fun void osc1Pitch(float pitch)
    {
        pitch => osc1.freq;
    }

    fun void osc2Pitch(float pitch)
    {
        pitch => osc2.freq;
    }

    fun void osc2Mode(int mode)
    {
        mode => _osc2Mode;
    }

    fun void oscRange(float range)
    {
        // todo  don't know what this does
        // video shows this also modulates frequency
    }

    fun void volume(float volume)
    {
        volume => master.gain;
    }

    fun void lfoRate(float rate)
    {
        rate => sqrLfo.freq;
        rate => triLfo.freq;
    }

    fun void lfoDepth(float depth)
    {
        depth => sqrLfo.gain;
        depth => triLfo.gain;
    }

    fun void lfoType(int type)
    {
        type => _lfoType;
    }

    fun void lfoMode(int mode)
    {
        mode => _lfoMode;
    }
}