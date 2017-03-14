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
        testAppendWait();
        testLoopProcedureDur();
        testLoopProcedureDurDur();
        testLoopProcedureDurDurDur();
        testLoopFloatProcedureDur();
        testLoopFloatProcedureDurDur();
        testLoopFloatProcedureDurDurDur();
        testLoopProcedureInt();
        testLoopProcedureDurInt();
        testLoopProcedureDurDurInt();
        testLoopFloatProcedureInt();
        testLoopFloatProcedureDurInt();
        testLoopFloatProcedureDurDurInt();
        testPrepend();
        testPrependWait();

        <<<"LoopsTest ok">>>;
    }

    public void testAppend()
    {
        Loops.append(g, h) @=> Procedure append;
        assertNotNull(append);
        append.run();
    }

    public void testAppendWait()
    {
        Loops.append(g, 64::ms) @=> Procedure append;
        assertNotNull(append);
        append.run();
    }

    public void testLoopProcedureDur()
    {
        Loops.loop(procedure, 64::ms) @=> Procedure loop;
        assertNotNull(loop);
        //loop.run();  don't call, will run forever
    }

    public void testLoopProcedureDurDur()
    {
        Loops.loop(procedure, 8::ms, 64::ms) @=> Procedure loop;
        assertNotNull(loop);
        loop.run();
    }

    public void testLoopProcedureDurDurDur()
    {
        Loops.loop(procedure, 4::ms, 8::ms, 8) @=> Procedure loop;
        assertNotNull(loop);
        loop.run();
    }

    public void testLoopFloatProcedureDur()
    {
        Loops.loop(floatProcedure, 64::ms) @=> Procedure loop;
        assertNotNull(loop);
        //loop.run();  don't call, will run forever
    }

    public void testLoopFloatProcedureDurDur()
    {
        Loops.loop(floatProcedure, 8::ms, 64::ms) @=> Procedure loop;
        assertNotNull(loop);
        loop.run();
    }

    public void testLoopFloatProcedureDurDurDur()
    {
        Loops.loop(floatProcedure, 4::ms, 8::ms, 8) @=> Procedure loop;
        assertNotNull(loop);
        loop.run();
    }

    public void testLoopProcedureInt()
    {
        Loops.loop(procedure, 4) @=> Procedure loop;
        assertNotNull(loop);
        loop.run();
    }

    public void testLoopProcedureDurInt()
    {
        Loops.loop(procedure, 8::ms, 4) @=> Procedure loop;
        assertNotNull(loop);
        loop.run();
    }

    public void testLoopProcedureDurDurInt()
    {
        Loops.loop(procedure, 4::ms, 8::ms, 4) @=> Procedure loop;
        assertNotNull(loop);
        loop.run();
    }

    public void testLoopFloatProcedureInt()
    {
        Loops.loop(floatProcedure, 4) @=> Procedure loop;
        assertNotNull(loop);
        loop.run();
    }

    public void testLoopFloatProcedureDurInt()
    {
        Loops.loop(floatProcedure, 8::ms, 4) @=> Procedure loop;
        assertNotNull(loop);
        loop.run();
    }

    public void testLoopFloatProcedureDurDurInt()
    {
        Loops.loop(floatProcedure, 4::ms, 8::ms, 4) @=> Procedure loop;
        assertNotNull(loop);
        loop.run();
    }

    public void testPrepend()
    {
        Loops.prepend(g, h) @=> Procedure prepend;
        assertNotNull(prepend);
        prepend.run();
    }

    public void testPrependWait()
    {
        Loops.prepend(64::ms, h) @=> Procedure prepend;
        assertNotNull(prepend);
        prepend.run();
    }
}

LoopsTest loopsTest;
1::second => now;
