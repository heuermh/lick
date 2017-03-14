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

class Value
{
    0 => int value;
}

class PrintValues extends UnaryProcedure
{
    fun void run(Object arg)
    {
        arg $ Node @=> Node node;
        node.value $ Value @=> Value value;
        <<<value.value>>>;
    }
}

class GraphsTest extends Assert
{
    {
        true => exitOnFailure;
        testRandomWalk();

        <<<"GraphsTest ok">>>;
    }

    fun void testRandomWalk()
    {
        Graph graph;
        //PrintValues printValues;
        UnaryProcedure printValues;
        //<<<"graph", graph>>>;

        // create 10 nodes
        ArrayList nodes;
        for (0 => int i; i < 10; i++)
        {
            Value value;
            i => value.value;
            //<<<"creating node", i>>>;
            graph.createNode(value) @=> Node node;
            nodes.add(node);
        }

        // create 20 edges
        for (0 => int i; i < 20; i++)
        {
            nodes.sample() $ Node @=> Node source;
            nodes.sample() $ Node @=> Node target;
            if (source != target)
            {
                //<<<"creating edge", source, target>>>;
                graph.createEdge(source, target, null);
            }
        }

        // random walk 10 times
        for (0 => int i; i < 10; i++)
        {
            //<<<"random walk", i>>>;
            Graphs.randomWalk(graph, printValues);
        }
    }
}

GraphsTest graphsTest;
1::second => now;
