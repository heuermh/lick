/*

    LiCK  Library for ChucK.
    Copyright (c) 2007-2022 held jointly by the individual authors.

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

public class Caves extends Effect {

    Gain _pre;
    Gain _post;
    DigitalDelay _delay0;
    DigitalDelay _delay1;
    DigitalDelay _delay2;
    DigitalDelay _delay3;
    Hall _reverb0;
    Hall _reverb1;
    Hall _reverb2;
    Hall _reverb3;

    inlet => _pre;
    _pre => _delay0 => _reverb0 => _post;
    _pre => _delay1 => _reverb1 => _post;
    _pre => _delay2 => _reverb2 => _post;
    _pre => _delay3 => _reverb3 => _post;
    _post => outlet;

    {
        1.0 => _delay0.mix;
        1.0 => _delay1.mix;
        1.0 => _delay2.mix;
        1.0 => _delay3.mix;

        0.6 => _delay0.gain;
        0.3 => _delay1.gain;
        0.1 => _delay2.gain;
        0.1 => _delay3.gain;

        2::second => _delay0.max;
        2::second => _delay1.max;
        2::second => _delay2.max;
        2::second => _delay3.max;

        220::ms => _delay0.delay;
        533::ms => _delay1.delay;
        911::ms => _delay2.delay;
        1113::ms => _delay3.delay;

        0.2 => _delay0.feedback;
        0.4 => _delay1.feedback;
        0.6 => _delay2.feedback;
        0.8 => _delay3.feedback;

        0.2 => _reverb0.mix;
        0.4 => _reverb1.mix;
        0.6 => _reverb2.mix;
        0.8 => _reverb3.mix;
    }
}
