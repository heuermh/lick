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

TimeSignature.common(200) @=> TimeSignature t;

SinOsc sin => ADSR adsr;

220.0 => sin.freq;
0.8 => sin.gain;
adsr.set(t.s, t.h, 0.8, t.h);

Clip clip;
Dist dist;
AtanDist atanDist;
TanhDist tanhDist;
RibbonDist ribbonDist;
FrostburnDist frostburnDist;
KijjazDist kijjazDist;
KijjazDist2 kijjazDist2;
KijjazDist3 kijjazDist3;
KijjazDist4 kijjazDist4;


<<<"dry">>>;
adsr => dac;
adsr.keyOn();
t.w => now;
adsr.keyOff();
t.w => now;

<<<"clip">>>;
clip.range(0.6);
adsr =< dac;
adsr => clip => dac;
adsr.keyOn();
t.w => now;
adsr.keyOff();
t.w => now;

<<<"dist">>>;
adsr =< clip;
clip =< dac;
adsr => dist => dac;
adsr.keyOn();
t.w => now;
adsr.keyOff();
t.w => now;

<<<"atan dist">>>;
adsr =< dist;
dist =< dac;
adsr => atanDist => dac;
adsr.keyOn();
t.w => now;
adsr.keyOff();
t.w => now;

<<<"tanh dist">>>;
adsr =< atanDist;
atanDist =< dac;
adsr => tanhDist => dac;
adsr.keyOn();
t.w => now;
adsr.keyOff();
t.w => now;

<<<"ribbon dist">>>;
adsr =< tanhDist;
tanhDist =< dac;
adsr => ribbonDist => dac;
adsr.keyOn();
t.w => now;
adsr.keyOff();
t.w => now;

<<<"frostburn dist">>>;
adsr =< ribbonDist;
ribbonDist =< dac;
adsr => frostburnDist => dac;
adsr.keyOn();
t.w => now;
adsr.keyOff();
t.w => now;

<<<"kijjaz dist">>>;
adsr =< frostburnDist;
frostburnDist =< dac;
adsr => kijjazDist => dac;
adsr.keyOn();
t.w => now;
adsr.keyOff();
t.w => now;

<<<"kijjaz dist 2">>>;
adsr =< kijjazDist;
kijjazDist =< dac;
adsr => kijjazDist2 => dac;
adsr.keyOn();
t.w => now;
adsr.keyOff();
t.w => now;

<<<"kijjaz dist 3">>>;
adsr =< kijjazDist2;
kijjazDist2 =< dac;
adsr => kijjazDist3 => dac;
adsr.keyOn();
t.w => now;
adsr.keyOff();
t.w => now;

<<<"kijjaz dist 4">>>;
adsr =< kijjazDist3;
kijjazDist3 =< dac;
adsr => kijjazDist4 => dac;
adsr.keyOn();
t.w => now;
adsr.keyOff();
t.w => now;

<<<"dry">>>;
adsr =< kijjazDist4;
kijjazDist4 =< dac;
adsr => dac;
adsr.keyOn();
t.w => now;
adsr.keyOff();
t.w => now;

<<<"done">>>;
