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

RolandTr909 rolandTr909;

TimeSignature.common(90) @=> TimeSignature ts;

Nyc nyc => dac;
rolandTr909.reconnect(nyc);

Chance chance;

while (true) {

    <<<"normal drum loop">>>;
    // todo:  these sound too hot as-is
    nyc.stop();

    loop();
    loop();

    0.6 + Math.random2f(0.0, 0.4) => nyc.mix;
    <<<"NYC style drum loop, mix", nyc.mix()>>>;
    nyc.start();

    loop();
    loop();
    loop();
    loop();
}

fun loop()
{
    rolandTr909.kickA.play();
    rolandTr909.closedHatA.play();

    ts.e => now;
    rolandTr909.closedHatB.play();
    ts.e => now;

    rolandTr909.kickB.play();
    rolandTr909.snareA.play();

    ts.e => now;
    rolandTr909.closedHatB.play();
    ts.e => now;

    rolandTr909.kickB.play();
    rolandTr909.closedHatA.play();

    ts.e => now;
    rolandTr909.closedHatB.play();
    ts.e => now;

    rolandTr909.kickA.play();
    rolandTr909.snareA.play();

    ts.e => now;
    if (chance.often())
    {
       rolandTr909.openHat.play();
    }
    else
    {
       rolandTr909.closedHatA.play();
    }
    ts.e => now;
 }
 