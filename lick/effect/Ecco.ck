/*

    LiCK  Library for ChucK.
    Copyright (c) 2007-2021 held jointly by the individual authors.

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

public class Ecco extends Effect
{
    TimeSignature @ ts;
    float _lowPassCutoff;
    float _lowPassResonance;
    float _highPassCutoff;
    float _highPassResonance;
    float _anticipation;
    float _delay;

    Gain pre;
    Gain post;

    Delay _head1;
    HPF _hpf1;
    LPF _lpf1;
    Gain _feedback1;
    Gain _mix1;
    HumanizedDurProvider @ _dur1;

    Delay _head2;
    HPF _hpf2;
    LPF _lpf2;
    Gain _feedback2;
    Gain _mix2;
    HumanizedDurProvider @ _dur2;

    Delay _head3;
    HPF _hpf3;
    LPF _lpf3;
    Gain _feedback3;
    Gain _mix3;
    HumanizedDurProvider @ _dur3;

    Delay _head4;
    HPF _hpf4;
    LPF _lpf4;
    Gain _feedback4;
    Gain _mix4;
    HumanizedDurProvider @ _dur4;

    inlet => pre;

    pre => _head1 => _lpf1 => _hpf1 => _mix1 => post;
    _hpf1 => _feedback1 => pre;

    pre => _head2 => _lpf2 => _hpf2 => _mix2 => post;
    _hpf2 => _feedback2 => pre;

    pre => _head3 => _lpf3 => _hpf3 => _mix3 => post;
    _hpf3 => _feedback3 => pre;

    pre => _head4 => _lpf4 => _hpf4 => _mix4 => post;
    _hpf4 => _feedback4 => pre;

    post => wet;

    fun void _init()
    {
        20000.0 => lowPassCutoff;
        20.0 => highPassCutoff;

        0.25 => mix1;
        0.25 => mix2;
        0.25 => mix3;
        0.25 => mix4;

        0.10 => feedback1;
        0.10 => feedback2;
        0.10 => feedback3;
        0.10 => feedback4;

        0.0 => anticipation;
        0.05 => delay;

        update();
    }

    fun float update() {
        ts.w => _head1.max;
        ts.w => _head2.max;
        ts.w => _head3.max;
        ts.w => _head4.max;

        _dur1.evaluate() => dur d1;
        d1 => _head1.delay;

        _dur2.evaluate() => dur d2;
        d2 => _head2.delay;

        _dur3.evaluate() => dur d3;
        d3 => _head3.delay;

        _dur4.evaluate() => dur d4;
        d4 => _head4.delay;
    }

    fun void panic() {
        0.0 => feedback1;
        0.0 => feedback2;
        0.0 => feedback3;
        0.0 => feedback4;
    }

    fun float lowPassCutoff() {
        return _lowPassCutoff;
    }

    fun float lowPassCutoff(float f) {
        f => _lowPassCutoff;
        _lowPassCutoff => _lpf1.freq;
        _lowPassCutoff => _lpf2.freq;
        _lowPassCutoff => _lpf3.freq;
        _lowPassCutoff => _lpf4.freq;
        return _lowPassCutoff;
    }

    fun float lowPassResonance() {
        return _lowPassResonance;
    }

    fun float lowPassResonance(float f) {
        f => _lowPassResonance;
        _lowPassResonance => _lpf1.Q;
        _lowPassResonance => _lpf2.Q;
        _lowPassResonance => _lpf3.Q;
        _lowPassResonance => _lpf4.Q;
        return _lowPassResonance;
    }

    fun float highPassCutoff() {
        return _highPassCutoff;
    }

    fun float highPassCutoff(float f) {
        f => _highPassCutoff;
        _highPassCutoff => _hpf1.freq;
        _highPassCutoff => _hpf2.freq;
        _highPassCutoff => _hpf3.freq;
        _highPassCutoff => _hpf4.freq;
        return _highPassCutoff;
    }

    fun float highPassResonance() {
        return _highPassResonance;
    }

    fun float highPassResonance(float f) {
        f => _highPassResonance;
        _highPassResonance => _hpf1.Q;
        _highPassResonance => _hpf2.Q;
        _highPassResonance => _hpf3.Q;
        _highPassResonance => _hpf4.Q;
        return _highPassResonance;
    }

    fun float anticipation() {
        return _anticipation;
    }

    fun float anticipation(float f) {
        f => _anticipation;
        _anticipation => _dur1.anticipation;
        _anticipation => _dur2.anticipation;
        _anticipation => _dur3.anticipation;
        _anticipation => _dur4.anticipation;
        return _anticipation;
    }

    fun float delay() {
        return _delay;
    }

    fun float delay(float f) {
        f => _delay;
        _delay => _dur1.delay;
        _delay => _dur2.delay;
        _delay => _dur3.delay;
        _delay => _dur4.delay;
        return _delay;
    }

    fun float mix1() {
        return _mix1.gain();
    }

    fun float mix1(float f) {
        f => _mix1.gain;
        return f;
    }

    fun float feedback1() {
        return _feedback1.gain();
    }

    fun float feedback1(float f) {
        f => _feedback1.gain;
        return f;
    }

    fun float mix2() {
        return _mix2.gain();
    }

    fun float mix2(float f) {
        f => _mix2.gain;
        return f;
    }

    fun float feedback2() {
        return _feedback2.gain();
    }

    fun float feedback2(float f) {
        f => _feedback2.gain;
        return f;
    }

    fun float mix3() {
        return _mix3.gain();
    }

    fun float mix3(float f) {
        f => _mix3.gain;
        return f;
    }

    fun float feedback3() {
        return _feedback3.gain();
    }

    fun float feedback3(float f) {
        f => _feedback3.gain;
        return f;
    }

    fun float mix4() {
        return _mix4.gain();
    }

    fun float mix4(float f) {
        f => _mix4.gain;
        return f;
    }

    fun float feedback4() {
        return _feedback4.gain();
    }

    fun float feedback4(float f) {
        f => _feedback4.gain;
        return f;
    }

    fun static Ecco even(TimeSignature ts) {
        Ecco ecco;
        ts @=> ecco.ts;
        ts.sixteenthProvider() @=> ecco._dur1;
        ts.eighthProvider() @=> ecco._dur2;
        ts.dottedEighthProvider() @=> ecco._dur3;
        ts.quarterProvider() @=> ecco._dur4;
        ecco._init();
        return ecco;
    }

    fun static Ecco triplet(TimeSignature ts) {
        Ecco ecco;
        ts @=> ecco.ts;
        ts.tripletSixteenthProvider() @=> ecco._dur1;
        ts.tripletEighthProvider() @=> ecco._dur2;
        ts.tripletQuarterProvider() @=> ecco._dur3;
        ts.quarterProvider() @=> ecco._dur4;
        ecco._init();
        return ecco;
     }
}
