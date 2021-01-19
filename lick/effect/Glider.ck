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

public class Glider extends Effect
{
     inlet => Cee chorus => DigitalDelay shortDelay => FilterDelay longDelay => PRCRev reverb => wet;

     {
        800::ms => shortDelay.max;
        160::ms => shortDelay.delay;
        0.8 => shortDelay.feedback;

        2000::ms => longDelay.max;
        400::ms => longDelay.delay;
        0.8 => longDelay.feedback;
     }

     fun static Glider create()
     {
        Glider glider;
        return glider;
     }

     fun static Glider create(dur shortDelay, dur longDelay)
     {
        Glider glider;
        shortDelay => glider.shortDelay.max;
        shortDelay => glider.shortDelay.delay;
        longDelay => glider.longDelay.max;
        longDelay => glider.longDelay.delay;
        return glider;
     }
}
