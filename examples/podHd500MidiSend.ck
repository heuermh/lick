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

PodHd500Midi podHd500;
podHd500.open(0);

<<<"expession pedals:">>>;
for (0 => int i; i < 10; i++)
{
   Math.random2(0, 127) => podHd500.exp1;
   Math.random2(0, 127) => podHd500.exp2;
   200::ms => now;
}
<<<"   ok">>>;

<<<"footswitches:">>>;
podHd500.fs1On();
podHd500.fs2On();
podHd500.fs3On();
podHd500.fs4On();
podHd500.fs5On();
podHd500.fs6On();
podHd500.fs7On();
podHd500.fs8On();
<<<"   ok">>>;

<<<"done">>>;
