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

public class Graphs
{
    fun static void breadthFirstSearch(Graph graph, Node node, UnaryProcedure procedure)
    {
        // todo: need Queue<Node>
    }

    fun static void depthFirstSearch(Graph graph, Node node, UnaryProcedure procedure)
    {
        // todo: need Map<Node, Boolean> for visited, or use list of visited nodes
    }

   fun static void randomWalk(Graph graph, UnaryProcedure procedure)
   {
        // todo:  cycle detection?
        graph.nodes.sample() $ Node @=> Node node;
        while (!node.outEdges.isEmpty())
        {
            node.outEdges.sample() $ Edge @=> Edge edge;
            edge.target @=> node;
            procedure.run(node);
        }
   }
}
