/*

    LiCK  Library for ChucK.
    Copyright (c) 2007-2014 held jointly by the individual authors.

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
// something like the Electro-Harmonix Freeze Sound Retainer
//
public class Freeze extends Effect
{
    8 => int _size;
    ArrayList _lisas;
    400::ms => dur _rate;
    0 => int _index;

    // need to call this after ctr
    fun void init()
    {
        0 => _running;

        for (0 => int i; i < _size; i++)
        {
            inlet => LiSa lisa => wet;
            _rate => lisa.duration;
            1 => lisa.loop;
            0 => lisa.play;
            1 => lisa.record;
            lisa.voiceGain(0, 1.0);
            _lisas.add(lisa);
            //<<<"created lisa", i, lisa>>>;
        }

        spork ~ _update();
    }

    fun void _update()
    {
        while (true)
        {
            _rate/_size => now;

            if (!_running)
            {
                _lisas.get(_index) $ LiSa @=> LiSa lisa;
                //<<<"updating lisa", _index, lisa>>>;

                0 => lisa.record;
                lisa.clear();

                0::samp => lisa.recPos;
                1 => lisa.record;

                _index + 1 => _index;
                if (_index == _size)
                {
                    0 => _index;
                }
            }
        }
    }

    fun void start()
    {
        if (!_running)
        {
            _lisas.iterator() @=> Iterator iterator;
            while (iterator.hasNext())
            {
                iterator.next() $ LiSa @=> LiSa lisa;
                0::samp => lisa.playPos;
                1 => lisa.play;
                0 => lisa.record;
                //<<<"playing lisa", lisa>>>;
            }
            1 => _running;
        }
    }

    fun void stop()
    {
        if (_running)
        {
            _lisas.iterator() @=> Iterator iterator;
            while (iterator.hasNext())
            {
                iterator.next() $ LiSa @=> LiSa lisa;
                0 => lisa.play;
                1 => lisa.record;
                //<<<"stopping lisa", lisa>>>;
            }
            0 => _running;
        }
    }

    fun static Freeze create(int z, dur d)
    {
        Freeze freeze;
        z => freeze._size;
        d => freeze._rate;
        freeze.init();
        return freeze;
    }
}