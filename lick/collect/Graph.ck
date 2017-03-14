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

public class Graph
{
    ArrayList nodes;
    ArrayList edges;

    fun int n()
    {
        return nodes.size();
    }

    fun int e()
    {
        return edges.size();
    }

    fun void clear()
    {
        nodes.clear();
        edges.clear();
    }

    fun Node createNode(Object value)
    {
        Node node;
        value @=> node.value;
        nodes.add(node);
        return node;
    }

    fun Edge createEdge(Node source, Node target, Object value)
    {
        Edge edge;
        source @=> edge.source;
        target @=> edge.target;
        value @=> edge.value;
        source.outEdges.add(edge);
        target.inEdges.add(edge);
        return edge;
    }

    fun void forEachNode(UnaryProcedure procedure)
    {
        nodes.forEach(procedure);
    }

    fun void forEachNode(UnaryPredicate predicate, UnaryProcedure procedure)
    {
        nodes.forEach(predicate, procedure);
    }

    fun void forEachNodeValue(UnaryProcedure procedure)
    {
        nodes.iterator() @=> Iterator iterator;
        while (iterator.hasNext())
        {
            iterator.next() @=> Object value;
            procedure.run(value);
        }
    }

    fun void forEachNodeValue(UnaryPredicate predicate, UnaryProcedure procedure)
    {
        nodes.iterator() @=> Iterator iterator;
        while (iterator.hasNext())
        {
            iterator.next() @=> Object value;
            if (predicate.test(value))
            {
                procedure.run(value);
            }
        }
    }
    
    fun void forEachEdge(UnaryProcedure procedure)
    {
        edges.forEach(procedure);
    }

    fun void forEachEdge(UnaryPredicate predicate, UnaryProcedure procedure)
    {
        edges.forEach(predicate, procedure);
    }

    fun void forEachEdgeValue(UnaryProcedure procedure)
    {
        edges.iterator() @=> Iterator iterator;
        while (iterator.hasNext())
        {
            iterator.next() @=> Object value;
            procedure.run(value);
        }
    }

    fun void forEachEdgeValue(UnaryPredicate predicate, UnaryProcedure procedure)
    {
        edges.iterator() @=> Iterator iterator;
        while (iterator.hasNext())
        {
            iterator.next() @=> Object value;
            if (predicate.test(value))
            {
                procedure.run(value);
            }
        }
    }
}
