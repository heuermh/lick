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
// inspired by the descriptions accompanying the guitar effect pedals
//
// PARASIT STUDIO Black Current Vibrato and Stutter
// http://www.parasitstudio.se/building-blog/black-current-vibrato-stutter
//
//  and
//
// PARASIT STUDIO Green Currant Tremolo
// http://www.parasitstudio.se/building-blog/green-currant-vibrato
// Buy one here: http://www.parasitstudio.se/store/p7/Green_Currant_Tremolo_PCB.html
//

public class Currant extends Effect
{
    Invert _invert;
    HPF _hpf;
    Tremolo _tremolo;
    Gain _post;
    Gain _bypass;

    /*

      inlet --> invert --> hpf --> tremolo --> post --> wet
        |                                                ^
        |                                                |
        +----------------> bypass -----------------------+

    */

    inlet => _invert => _hpf => _tremolo => _post => wet;
    inlet => _bypass => wet;

    {
        0.75 => _post.gain;
        0.25 => _bypass.gain;
        500.0 => _hpf.freq;

        lfo(0.05, 0.6, 0.0, 0.1, 0.0, 0.25);
        rate(3.2);
        depth(1.0);
    }

    fun float cutoff()
    {
        return _hpf.freq();
    }

    fun float cutoff(float f)
    {
        f => _hpf.freq;
        return f;
    }

    fun float rate()
    {
        return _tremolo.rate();
    }

    fun float rate(float f)
    {
        return _tremolo.rate(f);
    }

    fun float depth()
    {
        return _tremolo.depth();
    }

    fun float depth(float f)
    {
        return _tremolo.depth(f);
    }

    fun float phase()
    {
        return _tremolo.phase();
    }

    fun float phase(float f)
    {
        return _tremolo.phase(f);
    }

    fun void sawLfo()
    {
        _tremolo.sawLfo();
    }

    fun void sinLfo()
    {
        _tremolo.sinLfo();
    }

    fun void sqrLfo()
    {
        _tremolo.sqrLfo();
    }

    fun void triLfo()
    {
        _tremolo.triLfo();
    }

    fun void hyperLfo()
    {
        _tremolo.hyperLfo();
    }

    fun void sampleHoldLfo()
    {
        _tremolo.sampleHoldLfo();
    }

    fun void smoothSampleHoldLfo()
    {
        _tremolo.smoothSampleHoldLfo();
    }

    // @deprecated
    fun void lfo(float saw, float sin, float sqr, float tri, float sh, float ssh)
    {
        lfo(saw, sin, sqr, tri, 0.0, sh, ssh);
    }

    fun void lfo(float saw, float sin, float sqr, float tri, float hyper, float sh, float ssh)
    {
        _tremolo.lfo(saw, sin, sqr, tri, hyper, sh, ssh);
    }

    fun static Currant create()
    {
        Currant currant;
        return currant;
    }
}
