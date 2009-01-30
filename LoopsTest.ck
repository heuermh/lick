/*

    LiCK  Library for ChucK.
    Copyright (c) 2007-2009 held jointly by the individual authors.

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

// unit test for Loops
class LoopsTest extends Assert
{
    Procedure g;
    Procedure h;
    Procedure procedure;
    FloatProcedure floatProcedure;

    {
        true => exitOnFailure;
        testAppend();
        testLoop();
        testLoopN();
        testPrepend();

        <<<"LoopsTest ok">>>;
    }

    public void testAppend()
    {
        Loops.append(g, h) @=> Procedure append;
        assertNotNull(append);
        append.run();
    }

    public void testLoop()
    {
        Loops.loop(procedure, 4::ms, 8::ms, 64::ms) @=> Procedure loop;
        assertNotNull(loop);
        loop.run();
    }

    public void testLoopN()
    {
        Loops.loopN(procedure, 4::ms, 8::ms, 8) @=> Procedure loopN;
        assertNotNull(loopN);
        loopN.run();
    }

    public void testPrepend()
    {
        Loops.prepend(g, h) @=> Procedure prepend;
        assertNotNull(prepend);
        prepend.run();
    }
}

LoopsTest loopsTest;
1::second => now;