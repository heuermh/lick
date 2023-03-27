/*

    LiCK  Library for ChucK.
    Copyright (c) 2007-2023 held jointly by the individual authors.

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

<<<"demo">>>;
AkaiMpc60 akaiMpc60;
//akaiMpc60.demo();

<<<"demo with ecco">>>;
TimeSignature.common(110) @=> TimeSignature ts;
Ecco.even(ts) @=> Ecco ecco;
ecco => dac;
0.8 => ecco.mix;
0.4 => ecco.feedback1;
0.3 => ecco.feedback2;
0.2 => ecco.feedback3;
0.1 => ecco.feedback4;
akaiMpc60.reconnect(ecco);
akaiMpc60.demo();

1::minute => now;
<<<"done">>>;
