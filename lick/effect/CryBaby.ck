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

// Super-simple wah-wah pedal class
// by Perry R. Cook, October 2013
//     this one originally used Chuggraph extension, extended to use Effect
// Based on Julius O. Smith's experiments
// with his own CryBaby.  See:
// https://ccrma.stanford.edu/realsimple/faust_strings/faust_strings.pdf

public class CryBaby extends LfoEffect {
    inlet => ResonZ wah => wet;
    3.0 => wah.Q;
    1000.0 => wah.freq;
    
    [460.0,840,2250] @=> float freqs[]; // JOS data
    [9.4,4.0,2.0] @=> float Qs[];      // from his pedal
    
    // here we just linearly interpolate JOS data
    // zero is full closed, 1.0 is full "open"
    fun void setWah(float zero2One) {
        if (zero2One < 0.5) {
            2.0 * zero2One => float temp;
            freqs[0] + 
                ((freqs[1]-freqs[0])*temp) 
                => wah.freq;
            Qs[0] + 
                ((Qs[1]-Qs[0])*temp) 
                => wah.Q;
        }
        else  {
            2.0 * (zero2One-0.5) => float temp;
            freqs[1] + 
            ((freqs[2]-freqs[1])*temp) 
            => wah.freq;
            Qs[1] + 
            ((Qs[2]-Qs[1])*temp) 
            => wah.Q;
        }            
//        <<< wah.freq(), wah.Q() >>>;
    }

    fun static CryBaby create()
    {
        CryBaby cryBaby;
        return cryBaby;
    }
}
