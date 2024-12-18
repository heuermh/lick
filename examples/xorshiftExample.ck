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

Xorshift xorshift0;
Xorshift.create(24) @=> Xorshift xorshift1;
Xorshift.create(24, 79) @=> Xorshift xorshift2;

for (0 => int i; i < 24; i++)
{
    <<<xorshift0.get(), xorshift0.y, (xorshift0.y & xorshift0.MASK), xorshift1.get(), xorshift1.y, (xorshift1.y & xorshift1.MASK), xorshift2.get(), xorshift2.y, (xorshift2.y & xorshift2.MASK)>>>;
}

<<<"done">>>;