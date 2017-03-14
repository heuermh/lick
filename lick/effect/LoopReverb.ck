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
// See
// http://www.spinsemi.com/knowledge_base/effects.html
//

public class LoopReverb extends Effect
{
    inlet => Gain in1 => APF d1 => APF d2 => Delay d3 => Gain out1;
    inlet => Gain in2 => APF d4 => APF d5 => Delay d6 => Gain out2;
    inlet => Gain in3 => APF d7 => APF d8 => Delay d9 => Gain out3;
    inlet => Gain in4 => APF d10 => APF d11 => Delay d12 => Gain out4;

    out1 => Gain mix1 => wet;
    out2 => Gain mix2 => wet;
    out3 => Gain mix3 => wet;
    out4 => Gain mix4 => wet;

    out1 => LPF lpf1 => Gain feedback1 => in2;
    out2 => LPF lpf2 => Gain feedback2 => in3;
    out3 => LPF lpf3 => Gain feedback3 => in4;
    out4 => LPF lpf4 => Gain feedback4 => in1;

    {
        0.25 => in1.gain;
        0.25 => in2.gain;
        0.25 => in3.gain;
        0.25 => in4.gain;

        0.25 => mix1.gain;
        0.25 => mix2.gain;
        0.25 => mix3.gain;
        0.25 => mix4.gain;

        10000.0 => lpf1.freq;
        10000.0 => lpf2.freq;
        10000.0 => lpf3.freq;
        10000.0 => lpf4.freq;

        0.20 => feedback1.gain;
        0.20 => feedback2.gain;
        0.20 => feedback3.gain;
        0.20 => feedback4.gain;

        220::ms => d1.max;
        220::ms => d2.max;
        220::ms => d3.max;
        220::ms => d4.max;
        220::ms => d5.max;
        220::ms => d6.max;
        220::ms => d7.max;
        220::ms => d8.max;
        220::ms => d9.max;
        220::ms => d10.max;
        220::ms => d11.max;
        220::ms => d12.max;

        181::ms => d1.delay;
        182::ms => d2.delay;
        183::ms => d3.delay;
        188::ms => d4.delay;
        189::ms => d5.delay;
        190::ms => d6.delay;
        201::ms => d7.delay;
        202::ms => d8.delay;
        203::ms => d9.delay;
        218::ms => d10.delay;
        219::ms => d11.delay;
        220::ms => d12.delay;
    }

    fun float feedback()
    {
        return feedback1.gain();
    }

    fun float feedback(float f)
    {
        f => feedback1.gain;
        f => feedback2.gain;
        f => feedback3.gain;
        f => feedback4.gain;
        return f;
    }

    fun float coefficient()
    {
        return d1.reverseCoefficient();
    }

    fun float coefficient(float f)
    {
        f => d1.reverseCoefficient;
        -1.0 * f => d1.forwardCoefficient;

        f => d2.reverseCoefficient;
        -1.0 * f => d2.forwardCoefficient;

        f => d4.reverseCoefficient;
        -1.0 * f => d4.forwardCoefficient;

        f => d5.reverseCoefficient;
        -1.0 * f => d5.forwardCoefficient;

        f => d7.reverseCoefficient;
        -1.0 * f => d7.forwardCoefficient;

        f => d8.reverseCoefficient;
        -1.0 * f => d8.forwardCoefficient;

        f => d10.reverseCoefficient;
        -1.0 * f => d10.forwardCoefficient;

        f => d11.reverseCoefficient;
        -1.0 * f => d11.forwardCoefficient;
    }

    fun static LoopReverb create()
    {
        LoopReverb loopReverb;
        return loopReverb;
    }
}
