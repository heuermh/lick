/*

    LiCK  Library for ChucK.
    Copyright (c) 2007-2024 held jointly by the individual authors.

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
// Designing a TR-606 style hi-hat from scratch
// https://www.youtube.com/watch?v=zbBY7JL9nnQ
//

public class Nks extends Chugraph
{
    SqrOsc _noise0;
    SqrOsc _noise1;
    SqrOsc _noise2;
    SqrOsc _noise3;
    SqrOsc _noise4;
    SqrOsc _noise5;

    // or use mixer?
    1.0f/6.0f => _noise0.gain;
    1.0f/6.0f => _noise1.gain;
    1.0f/6.0f => _noise2.gain;
    1.0f/6.0f => _noise3.gain;
    1.0f/6.0f => _noise4.gain;
    1.0f/6.0f => _noise5.gain;

    // helps reduce rhythmic clicking
    Math.random2f(0.0f, 1.0f) => _noise0.phase;
    Math.random2f(0.0f, 1.0f) => _noise1.phase;
    Math.random2f(0.0f, 1.0f) => _noise2.phase;
    Math.random2f(0.0f, 1.0f) => _noise3.phase;
    Math.random2f(0.0f, 1.0f) => _noise4.phase;
    Math.random2f(0.0f, 1.0f) => _noise5.phase;

    Gain _mix;
    _noise0 => _mix;
    _noise1 => _mix;
    _noise2 => _mix;
    _noise3 => _mix;
    _noise4 => _mix;
    _noise5 => _mix;

    // resonant bandpass filter
    _mix => BPF _bpf;
    7000.0f => _bpf.freq;
    4.0f => _bpf.Q;

    // vca; this needs some distortion
    _bpf => Envelope _env;
    180.0::ms => _env.duration;

    // resonant 2nd order high pass filter
    _env  => HPF _hpf => outlet;
    3400.0f => _hpf.freq;
    4.0 => _hpf.Q;


    0 => static int OPEN;
    1 => static int CLOSED;

    OPEN => int _state;
    float _freq;
    dur _closedDecay;
    dur _openDecay;
    float _bandpassCutoff;
    float _bandpassResonance;
    float _highpassCutoff;
    float _highpassResonance;
    float _accent;

    _createChord() @=> Chord _chord;

    {
        klein();

        60::ms => closedDecay;
        180::ms => openDecay;

        7000.0f => bandpassCutoff;
        4.0f => bandpassResonance;
        3400.0f => highpassCutoff;
        4.0f => highpassResonance;

        1.0f => accent;
    }


    fun void play()
    {
        _accent => _env.value;
        _env.keyOff();
    }

    fun void open()
    {
        OPEN => _state;
        _openDecay => _env.duration;
    }

    fun void opened()
    {
        open();
    }

    fun void playOpen()
    {
        open();
        play();
    }

    fun void close()
    {
        closed();
    }

    fun void closed()
    {
        CLOSED => _state;
        _closedDecay => _env.duration;
    }

    fun void playClosed()
    {
        closed();
        play();
    }

    fun int state()
    {
        return _state;
    }

    fun float freq()
    {
        return _freq;
    }

    fun float freq(float f)
    {
        f => _freq;
        f => _chord.root;
        _chord.valueAt(0) => _noise0.freq;
        _chord.valueAt(1) => _noise1.freq;
        _chord.valueAt(2) => _noise2.freq;
        _chord.valueAt(3) => _noise3.freq;
        _chord.valueAt(4) => _noise4.freq;
        _chord.valueAt(5) => _noise5.freq;
        return f;
    }

    fun dur closedDecay()
    {
        return _closedDecay;
    }

    fun dur closedDecay(dur d)
    {
        d => _closedDecay;
        return d;
    }

    fun dur openDecay()
    {
        return _openDecay;
    }

    fun dur openDecay(dur d)
    {
        d => _openDecay;
        return d;
    }

    fun float bandpassCutoff()
    {
        return _bandpassCutoff;
    }

    fun float bandpassCutoff(float f)
    {
        f => _bandpassCutoff;
        f => _bpf.freq;
        return f;
    }

    fun float bandpassResonance()
    {
        return _bandpassResonance;
    }

    fun float bandpassResonance(float f)
    {
        f => _bandpassResonance;
        f => _bpf.Q;
        return f;
    }

    fun float highpassCutoff()
    {
        return _highpassCutoff;
    }

    fun float highpassCutoff(float f)
    {
        f => _highpassCutoff;
        f => _hpf.freq;
        return f;
    }

    fun float highpassResonance()
    {
        return _highpassResonance;
    }

    fun float highpassResonance(float f)
    {
        f => _highpassResonance;
        f => _hpf.Q;
        return f;
    }

    fun float accent()
    {
        return _accent;
    }

    fun float accent(float f)
    {
        f => _accent;
        return _accent;
    }

    fun void original() {
        245.0f => freq;
        /*
        245.0f => _noise0.freq;
        306.0f => _noise1.freq;
        365.0f => _noise2.freq;
        415.0f => _noise3.freq;
        437.0f => _noise4.freq;
        619.0f => _noise5.freq;
        */
    }

    fun void klein() {
        123.0f => freq;
        /*        
        123.0f => _noise0.freq;
        150.0f => _noise1.freq;
        180.0f => _noise2.freq;
        219.0f => _noise3.freq;
        240.0f => _noise4.freq;
        261.0f => _noise5.freq;
        */
    }

    fun static Chord _createChord() {
        Intervals.unison() @=> Interval i0;
        Intervals.interval(306, 245) @=> Interval i1;
        Intervals.interval(365, 245) @=> Interval i2;
        Intervals.interval(415, 245) @=> Interval i3;
        Intervals.interval(437, 245) @=> Interval i4;
        Intervals.interval(619, 245) @=> Interval i5;

        return Chords.chord(245.0f, i0, i1, i2, i3, i4, i5);
    }
}