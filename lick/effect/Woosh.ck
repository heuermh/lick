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

public class Woosh extends Feedback
{
    Noise _noise;
    EnvelopeTrigger _env;
    BPF _filter;
    Redshift _phaser;
    Delay _delay;

    /*

       pre --> env follower --> blackhole;
       pre --> pitch follower --> blackhole;

       pre --> noise --> env adsr --> filter --> phaser --> post
        |                                                     |
        |                                                     |
        +-------- feedbackIn <-- delay <-- feedbackOut -------|

       pitch follower --> filter freq

    */

    //pre => _env.env => blackhole;
    //pre => _noise => _env.env => _filter => _phaser => post;
    pre => _noise => _filter => post;
    feedbackOut => _delay => feedbackIn;

    {
        0.2 => _phaser.depth;
        0.5 => _phaser.rate;
        _phaser.sinLfo();

        4400.0 => _filter.freq;
        12::ms => _delay.delay;

        1.0 => mix;
        0.1 => feedback;
    }

    fun static Woosh create()
    {
        Woosh woosh;
        return woosh;
    }
}
