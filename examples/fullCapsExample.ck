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

// full C*APS for electric guitar example, may bring CPU to its knees

adc => NoiseGate noiseGate => ParametricEq eq => Saturate saturate => Amp amp => Cabinet cabinet => Scape scape => Plate plate => dac;

"imperial" => noiseGate.mainsName;
12.0 => eq.aGain;
-20.0 => eq.dGain;
0.2 => saturate.bias;
"rectify" => saturate.modeName;
"twin" => amp.tonestackName;
"twin A" => cabinet.modelName;

while (true)
{
    1::minute => now;
}
