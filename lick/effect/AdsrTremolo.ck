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

public class AdsrTremolo extends Effect
{
    ADSR _adsr;
    float _rate;

    {
        inlet => _adsr => wet;

        spork ~ _updateAtRate();
    }

    fun float rate()
    {
        return _rate;
    }

    fun float rate(float f)
    {
        f => _rate;
        return f;
    }

    fun dur attack()
    {
        return _adsr.attackTime();
    }

    fun dur attack(dur d)
    {
        d => _adsr.attackTime;
        return d;
    }

    fun dur decay()
    {
        return _adsr.decayTime();
    }

    fun dur decay(dur d)
    {
        d => _adsr.decayTime;
        return d;
    }

    fun float sustain()
    {
        return _adsr.sustainLevel();
    }

    fun float sustain(float f)
    {
        f => _adsr.sustainLevel;
        return f;
    }

    fun dur release()
    {
        return _adsr.releaseTime();
    }

    fun dur release(dur d)
    {
        d => _adsr.releaseTime;
        return d;
    }

    fun void scale(float f)
    {
        attack() * f => attack;
        decay() * f => decay;
        release() * f => release;
    }

    fun void _updateAtRate()
    {
        while (true)
        {
            1 => _adsr.keyOn;
            1::second / (2.0 * _rate) => now;
            1 => _adsr.keyOff;
            1::second / (2.0 * _rate) => now;
        }
    }

    fun static AdsrTremolo create()
    {
        AdsrTremolo adsrTremolo;
        return adsrTremolo;
    }

    fun static AdsrTremolo create(dur attack, dur decay, float sustain, dur release)
    {
        AdsrTremolo adsrTremolo;
        attack => adsrTremolo.attack;
        decay => adsrTremolo.decay;
        sustain => adsrTremolo.sustain;
        release => adsrTremolo.release;
        return adsrTremolo;
    }
}
