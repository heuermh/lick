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

public class LoopBuilder
{
    Procedure _procedure;
    FloatProcedure _floatProcedure;

    fun LoopBuilder append(dur wait)
    {
        Loops.append(_procedure, wait) @=> _procedure;
        return this;
    }

    fun LoopBuilder append(Procedure procedure)
    {
        Loops.append(_procedure, procedure) @=> _procedure;
        return this;
    }

    fun LoopBuilder append(Procedure procedure, dur wait)
    {
        Loops.append(_procedure, Loops.loop(procedure, wait)) @=> _procedure;
        return this;
    }

    fun LoopBuilder append(Procedure procedure, dur wait, dur length)
    {
        Loops.append(_procedure, Loops.loop(procedure, wait, length)) @=> _procedure;
        return this;
    }

    fun LoopBuilder append(Procedure procedure, dur offset, dur wait, dur length)
    {
        Loops.append(_procedure, Loops.loop(procedure, offset, wait, length)) @=> _procedure;
        return this;
    }

    fun LoopBuilder append(Procedure procedure, int n)
    {
        Loops.append(_procedure, Loops.loop(procedure, n)) @=> _procedure;
        return this;
    }

    fun LoopBuilder append(Procedure procedure, dur wait, int n)
    {
        Loops.append(_procedure, Loops.loop(procedure, wait, n)) @=> _procedure;
        return this;
    }

    fun LoopBuilder append(Procedure procedure, dur offset, dur wait, int n)
    {
        Loops.append(_procedure, Loops.loop(procedure, offset, wait, n)) @=> _procedure;
        return this;
    }

    fun Procedure build()
    {
        return _procedure;
    }

/*

  todo:  need FloatProcedure Append and such

    fun LoopBuilder append(FloatProcedure floatProcedure)
    {
        Loops.append(_floatProcedure, floatProcedure) @=> _floatProcedure;
        return this;
    }

    fun LoopBuilder append(FloatProcedure floatProcedure, dur wait)
    {
        Loops.append(_floatProcedure, Loops.loop(floatProcedure, wait)) @=> _floatProcedure;
        return this;
    }

    fun LoopBuilder append(FloatProcedure floatProcedure, dur wait, dur length)
    {
        Loops.append(_floatProcedure, Loops.loop(floatProcedure, wait, length)) @=> _floatProcedure;
        return this;
    }

    fun LoopBuilder append(FloatProcedure floatProcedure, dur offset, dur wait, dur length)
    {
        Loops.append(_floatProcedure, Loops.loop(floatProcedure, offset, wait, length)) @=> _floatProcedure;
        return this;
    }

    fun LoopBuilder append(FloatProcedure floatProcedure, int n)
    {
        Loops.append(_floatProcedure, Loops.loop(floatProcedure, n)) @=> _floatProcedure;
        return this;
    }

    fun LoopBuilder append(FloatProcedure floatProcedure, dur wait, int n)
    {
        Loops.append(_floatProcedure, Loops.loop(floatProcedure, wait, n)) @=> _floatProcedure;
        return this;
    }

    fun LoopBuilder append(FloatProcedure floatProcedure, dur offset, dur wait, int n)
    {
        Loops.append(_floatProcedure, Loops.loop(floatProcedure, offset, wait, n)) @=> _floatProcedure;
        return this;
    }

    fun Procedure buildProcedure()
    {
        return build();
    }

    fun FloatProcedure buildFloatProcedure()
    {
        return _floatProcedure;
    }
*/
}
