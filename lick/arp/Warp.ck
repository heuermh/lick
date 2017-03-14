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

//
// pattern warp, based on Shruthi user manual
// http://mutable-instruments.net/shruthi1/manual
//
// Olivier Gillet, Mutable instruments SARL 2011-2013.
// Except where otherwise noted, content on this site is licensed under a cc-by-sa 3.0 license.
//
// As such, this class is dual licensed GPL v3.0 or later as described above
// and also under the cc-by-sa 3.0 license per the Share Alike clause
//

public class Warp
{

    // 01234567
    fun static Pattern forward(Pattern p)
    {
        return Patterns.pattern(p.get(0), p.get(1), p.get(2), p.get(3), p.get(4), p.get(5), p.get(6), p.get(7));
    }

    // 76543210
    fun static Pattern backward(Pattern p)
    {
        return Patterns.pattern(p.get(7), p.get(6), p.get(5), p.get(4), p.get(3), p.get(2), p.get(1), p.get(0));
    }

    // 0123456776543210
    fun static Pattern pingPong1(Pattern p)
    {
        return Patterns.pattern(p.get(0), p.get(1), p.get(2), p.get(3), p.get(4), p.get(5), p.get(6), p.get(7),
                                p.get(7), p.get(6), p.get(5), p.get(4), p.get(3), p.get(2), p.get(1), p.get(0));
    }

    // 01234567654321
    fun static Pattern pingPong2(Pattern p)
    {
        Pattern pattern;
        pattern.size(14);
        pattern.pattern.set(0, p.get(0));
        pattern.pattern.set(1, p.get(1));
        pattern.pattern.set(2, p.get(2));
        pattern.pattern.set(3, p.get(3));
        pattern.pattern.set(4, p.get(4));
        pattern.pattern.set(5, p.get(5));
        pattern.pattern.set(6, p.get(6));
        pattern.pattern.set(7, p.get(7));
        pattern.pattern.set(8, p.get(6));
        pattern.pattern.set(9, p.get(5));
        pattern.pattern.set(10, p.get(4));
        pattern.pattern.set(11, p.get(3));
        pattern.pattern.set(12, p.get(2));
        pattern.pattern.set(13, p.get(1));
        return pattern;
    }

    // 0010120123012340123450123456 012345671234567234567345674567567677
    fun static Pattern glass(Pattern p)
    {
        Pattern pattern;
        pattern.size(64);
        pattern.pattern.set(0, p.get(0));
        pattern.pattern.set(1, p.get(0));
        pattern.pattern.set(2, p.get(1));
        pattern.pattern.set(3, p.get(0));
        pattern.pattern.set(4, p.get(1));
        pattern.pattern.set(5, p.get(2));
        pattern.pattern.set(6, p.get(0));
        pattern.pattern.set(7, p.get(1));
        pattern.pattern.set(8, p.get(2));
        pattern.pattern.set(9, p.get(3));
        pattern.pattern.set(10, p.get(0));
        pattern.pattern.set(11, p.get(1));
        pattern.pattern.set(12, p.get(2));
        pattern.pattern.set(13, p.get(3));
        pattern.pattern.set(14, p.get(4));
        pattern.pattern.set(15, p.get(0));
        pattern.pattern.set(16, p.get(1));
        pattern.pattern.set(17, p.get(2));
        pattern.pattern.set(18, p.get(3));
        pattern.pattern.set(19, p.get(4));
        pattern.pattern.set(20, p.get(5));
        pattern.pattern.set(21, p.get(0));
        pattern.pattern.set(22, p.get(1));
        pattern.pattern.set(23, p.get(2));
        pattern.pattern.set(24, p.get(3));
        pattern.pattern.set(25, p.get(4));
        pattern.pattern.set(26, p.get(5));
        pattern.pattern.set(27, p.get(6));

        pattern.pattern.set(28, p.get(0));
        pattern.pattern.set(29, p.get(1));
        pattern.pattern.set(30, p.get(2));
        pattern.pattern.set(31, p.get(3));
        pattern.pattern.set(32, p.get(4));
        pattern.pattern.set(33, p.get(5));
        pattern.pattern.set(34, p.get(6));
        pattern.pattern.set(35, p.get(7));
        pattern.pattern.set(36, p.get(1));
        pattern.pattern.set(37, p.get(2));
        pattern.pattern.set(38, p.get(3));
        pattern.pattern.set(39, p.get(4));
        pattern.pattern.set(40, p.get(5));
        pattern.pattern.set(41, p.get(6));
        pattern.pattern.set(42, p.get(7));
        pattern.pattern.set(43, p.get(2));
        pattern.pattern.set(44, p.get(3));
        pattern.pattern.set(45, p.get(4));
        pattern.pattern.set(46, p.get(5));
        pattern.pattern.set(47, p.get(6));
        pattern.pattern.set(48, p.get(7));
        pattern.pattern.set(49, p.get(3));
        pattern.pattern.set(50, p.get(4));
        pattern.pattern.set(51, p.get(5));
        pattern.pattern.set(52, p.get(6));
        pattern.pattern.set(53, p.get(7));
        pattern.pattern.set(54, p.get(4));
        pattern.pattern.set(55, p.get(5));
        pattern.pattern.set(56, p.get(6));
        pattern.pattern.set(57, p.get(7));
        pattern.pattern.set(58, p.get(5));
        pattern.pattern.set(59, p.get(6));
        pattern.pattern.set(60, p.get(7));
        pattern.pattern.set(61, p.get(6));
        pattern.pattern.set(62, p.get(7));
        pattern.pattern.set(63, p.get(7));
        return pattern;
    }

    // 01122334455667
    fun static Pattern krama(Pattern p)
    {
        Pattern pattern;
        pattern.size(14);
        pattern.pattern.set(0, p.get(0));
        pattern.pattern.set(1, p.get(1));
        pattern.pattern.set(2, p.get(1));
        pattern.pattern.set(3, p.get(2));
        pattern.pattern.set(4, p.get(2));
        pattern.pattern.set(5, p.get(3));
        pattern.pattern.set(6, p.get(3));
        pattern.pattern.set(7, p.get(4));
        pattern.pattern.set(8, p.get(4));
        pattern.pattern.set(9, p.get(5));
        pattern.pattern.set(10, p.get(5));
        pattern.pattern.set(11, p.get(6));
        pattern.pattern.set(12, p.get(6));
        pattern.pattern.set(13, p.get(7));
        return pattern;
    }

    // 011001122112233223344334455445566556677667
    fun static Pattern jata(Pattern p)
    {
        Pattern pattern;
        pattern.size(42);
        pattern.pattern.set(0, p.get(0));
        pattern.pattern.set(1, p.get(1));
        pattern.pattern.set(2, p.get(1));
        pattern.pattern.set(3, p.get(0));
        pattern.pattern.set(4, p.get(0));
        pattern.pattern.set(5, p.get(1));
        pattern.pattern.set(6, p.get(1));
        pattern.pattern.set(7, p.get(2));
        pattern.pattern.set(8, p.get(2));
        pattern.pattern.set(9, p.get(1));
        pattern.pattern.set(10, p.get(1));
        pattern.pattern.set(11, p.get(2));
        pattern.pattern.set(12, p.get(2));
        pattern.pattern.set(13, p.get(3));
        pattern.pattern.set(14, p.get(3));
        pattern.pattern.set(15, p.get(2));
        pattern.pattern.set(16, p.get(2));
        pattern.pattern.set(17, p.get(3));
        pattern.pattern.set(18, p.get(3));
        pattern.pattern.set(19, p.get(4));
        pattern.pattern.set(20, p.get(4));
        pattern.pattern.set(21, p.get(3));
        pattern.pattern.set(22, p.get(3));
        pattern.pattern.set(23, p.get(4));
        pattern.pattern.set(24, p.get(4));
        pattern.pattern.set(25, p.get(5));
        pattern.pattern.set(26, p.get(5));
        pattern.pattern.set(27, p.get(4));
        pattern.pattern.set(28, p.get(4));
        pattern.pattern.set(29, p.get(5));
        pattern.pattern.set(30, p.get(5));
        pattern.pattern.set(31, p.get(6));
        pattern.pattern.set(32, p.get(6));
        pattern.pattern.set(33, p.get(5));
        pattern.pattern.set(34, p.get(5));
        pattern.pattern.set(35, p.get(6));
        pattern.pattern.set(36, p.get(6));
        pattern.pattern.set(37, p.get(7));
        pattern.pattern.set(38, p.get(7));
        pattern.pattern.set(39, p.get(6));
        pattern.pattern.set(40, p.get(6));
        pattern.pattern.set(41, p.get(7));
        return pattern;
    }

    // 012210012123321123234432234345543345456654456567765567
    fun static Pattern sikha(Pattern p)
    {
        Pattern pattern;
        pattern.size(54);
        pattern.pattern.set(0, p.get(0));
        pattern.pattern.set(1, p.get(1));
        pattern.pattern.set(2, p.get(2));
        pattern.pattern.set(3, p.get(2));
        pattern.pattern.set(4, p.get(1));
        pattern.pattern.set(5, p.get(0));
        pattern.pattern.set(6, p.get(0));
        pattern.pattern.set(7, p.get(1));
        pattern.pattern.set(8, p.get(2));
        pattern.pattern.set(9, p.get(1));
        pattern.pattern.set(10, p.get(2));
        pattern.pattern.set(11, p.get(3));
        pattern.pattern.set(12, p.get(3));
        pattern.pattern.set(13, p.get(2));
        pattern.pattern.set(14, p.get(1));
        pattern.pattern.set(15, p.get(1));
        pattern.pattern.set(16, p.get(2));
        pattern.pattern.set(17, p.get(3));
        pattern.pattern.set(18, p.get(2));
        pattern.pattern.set(19, p.get(3));
        pattern.pattern.set(20, p.get(4));
        pattern.pattern.set(21, p.get(4));
        pattern.pattern.set(22, p.get(3));
        pattern.pattern.set(23, p.get(2));
        pattern.pattern.set(24, p.get(2));
        pattern.pattern.set(25, p.get(3));
        pattern.pattern.set(26, p.get(4));
        pattern.pattern.set(27, p.get(3));
        pattern.pattern.set(28, p.get(4));
        pattern.pattern.set(29, p.get(5));
        pattern.pattern.set(30, p.get(5));
        pattern.pattern.set(31, p.get(4));
        pattern.pattern.set(32, p.get(3));
        pattern.pattern.set(33, p.get(3));
        pattern.pattern.set(34, p.get(4));
        pattern.pattern.set(35, p.get(5));
        pattern.pattern.set(36, p.get(4));
        pattern.pattern.set(37, p.get(5));
        pattern.pattern.set(38, p.get(6));
        pattern.pattern.set(39, p.get(6));
        pattern.pattern.set(40, p.get(5));
        pattern.pattern.set(41, p.get(4));
        pattern.pattern.set(42, p.get(4));
        pattern.pattern.set(43, p.get(5));
        pattern.pattern.set(44, p.get(6));
        pattern.pattern.set(45, p.get(5));
        pattern.pattern.set(46, p.get(6));
        pattern.pattern.set(47, p.get(7));
        pattern.pattern.set(48, p.get(7));
        pattern.pattern.set(49, p.get(6));
        pattern.pattern.set(50, p.get(5));
        pattern.pattern.set(51, p.get(5));
        pattern.pattern.set(52, p.get(6));
        pattern.pattern.set(53, p.get(7));
        return pattern;
    }

    // 0110012210012122112332112323322344322 34344334554334545544566544565665567765567
    fun static Pattern ghana(Pattern p)
    {
        Pattern pattern;
        pattern.size(78);
        pattern.pattern.set(0, p.get(0));
        pattern.pattern.set(1, p.get(1));
        pattern.pattern.set(2, p.get(1));
        pattern.pattern.set(3, p.get(0));
        pattern.pattern.set(4, p.get(0));
        pattern.pattern.set(5, p.get(1));
        pattern.pattern.set(6, p.get(2));
        pattern.pattern.set(7, p.get(2));
        pattern.pattern.set(8, p.get(1));
        pattern.pattern.set(9, p.get(0));
        pattern.pattern.set(10, p.get(0));
        pattern.pattern.set(11, p.get(1));
        pattern.pattern.set(12, p.get(2));
        pattern.pattern.set(13, p.get(1));
        pattern.pattern.set(14, p.get(2));
        pattern.pattern.set(15, p.get(2));
        pattern.pattern.set(16, p.get(1));
        pattern.pattern.set(17, p.get(1));
        pattern.pattern.set(18, p.get(2));
        pattern.pattern.set(19, p.get(3));
        pattern.pattern.set(20, p.get(3));
        pattern.pattern.set(21, p.get(2));
        pattern.pattern.set(22, p.get(1));
        pattern.pattern.set(23, p.get(1));
        pattern.pattern.set(24, p.get(2));
        pattern.pattern.set(25, p.get(3));
        pattern.pattern.set(26, p.get(2));
        pattern.pattern.set(27, p.get(3));
        pattern.pattern.set(28, p.get(3));
        pattern.pattern.set(29, p.get(2));
        pattern.pattern.set(30, p.get(2));
        pattern.pattern.set(31, p.get(3));
        pattern.pattern.set(32, p.get(4));
        pattern.pattern.set(33, p.get(4));
        pattern.pattern.set(34, p.get(3));
        pattern.pattern.set(35, p.get(2));
        pattern.pattern.set(36, p.get(2));

        pattern.pattern.set(37, p.get(3));
        pattern.pattern.set(38, p.get(4));
        pattern.pattern.set(39, p.get(3));
        pattern.pattern.set(40, p.get(4));
        pattern.pattern.set(41, p.get(4));
        pattern.pattern.set(42, p.get(3));
        pattern.pattern.set(43, p.get(3));
        pattern.pattern.set(44, p.get(4));
        pattern.pattern.set(45, p.get(5));
        pattern.pattern.set(46, p.get(5));
        pattern.pattern.set(47, p.get(4));
        pattern.pattern.set(48, p.get(3));
        pattern.pattern.set(49, p.get(3));
        pattern.pattern.set(50, p.get(4));
        pattern.pattern.set(51, p.get(5));
        pattern.pattern.set(52, p.get(4));
        pattern.pattern.set(53, p.get(5));
        pattern.pattern.set(54, p.get(5));
        pattern.pattern.set(55, p.get(4));
        pattern.pattern.set(56, p.get(4));
        pattern.pattern.set(57, p.get(5));
        pattern.pattern.set(58, p.get(6));
        pattern.pattern.set(59, p.get(6));
        pattern.pattern.set(60, p.get(5));
        pattern.pattern.set(61, p.get(4));
        pattern.pattern.set(62, p.get(4));
        pattern.pattern.set(63, p.get(5));
        pattern.pattern.set(64, p.get(6));
        pattern.pattern.set(65, p.get(5));
        pattern.pattern.set(66, p.get(6));
        pattern.pattern.set(67, p.get(6));
        pattern.pattern.set(68, p.get(5));
        pattern.pattern.set(69, p.get(5));
        pattern.pattern.set(70, p.get(6));
        pattern.pattern.set(71, p.get(7));
        pattern.pattern.set(72, p.get(7));
        pattern.pattern.set(73, p.get(6));
        pattern.pattern.set(74, p.get(5));
        pattern.pattern.set(75, p.get(5));
        pattern.pattern.set(76, p.get(6));
        pattern.pattern.set(77, p.get(7));
        return pattern;
    }

    // 01012301234501234567234567456767
    fun static Pattern glass2(Pattern p)
    {
        Pattern pattern;
        pattern.size(32);
        pattern.pattern.set(0, p.get(0));
        pattern.pattern.set(1, p.get(1));
        pattern.pattern.set(2, p.get(0));
        pattern.pattern.set(3, p.get(1));
        pattern.pattern.set(4, p.get(2));
        pattern.pattern.set(5, p.get(3));
        pattern.pattern.set(6, p.get(0));
        pattern.pattern.set(7, p.get(1));
        pattern.pattern.set(8, p.get(2));
        pattern.pattern.set(9, p.get(3));
        pattern.pattern.set(10, p.get(4));
        pattern.pattern.set(11, p.get(5));
        pattern.pattern.set(12, p.get(0));
        pattern.pattern.set(13, p.get(1));
        pattern.pattern.set(14, p.get(2));
        pattern.pattern.set(15, p.get(3));
        pattern.pattern.set(16, p.get(4));
        pattern.pattern.set(17, p.get(5));
        pattern.pattern.set(18, p.get(6));
        pattern.pattern.set(19, p.get(7));
        pattern.pattern.set(20, p.get(2));
        pattern.pattern.set(21, p.get(3));
        pattern.pattern.set(22, p.get(4));
        pattern.pattern.set(23, p.get(5));
        pattern.pattern.set(24, p.get(6));
        pattern.pattern.set(25, p.get(7));
        pattern.pattern.set(26, p.get(4));
        pattern.pattern.set(27, p.get(5));
        pattern.pattern.set(28, p.get(6));
        pattern.pattern.set(29, p.get(7));
        pattern.pattern.set(30, p.get(6));
        pattern.pattern.set(31, p.get(7));
        return pattern;
    }

    // 012323454567
    fun static Pattern krama2(Pattern p)
    {
        Pattern pattern;
        pattern.size(12);
        pattern.pattern.set(0, p.get(0));
        pattern.pattern.set(1, p.get(1));
        pattern.pattern.set(2, p.get(2));
        pattern.pattern.set(3, p.get(3));
        pattern.pattern.set(4, p.get(2));
        pattern.pattern.set(5, p.get(3));
        pattern.pattern.set(6, p.get(4));
        pattern.pattern.set(7, p.get(5));
        pattern.pattern.set(8, p.get(4));
        pattern.pattern.set(9, p.get(5));
        pattern.pattern.set(10, p.get(6));
        pattern.pattern.set(11, p.get(7));
        return pattern;
    }

    // 012323010123234545232345456767454567
    fun static Pattern jata2(Pattern p)
    {
        Pattern pattern;
        pattern.size(36);
        pattern.pattern.set(0, p.get(0));
        pattern.pattern.set(1, p.get(1));
        pattern.pattern.set(2, p.get(2));
        pattern.pattern.set(3, p.get(3));
        pattern.pattern.set(4, p.get(2));
        pattern.pattern.set(5, p.get(3));
        pattern.pattern.set(6, p.get(0));
        pattern.pattern.set(7, p.get(1));
        pattern.pattern.set(8, p.get(0));
        pattern.pattern.set(9, p.get(1));
        pattern.pattern.set(10, p.get(2));
        pattern.pattern.set(11, p.get(3));
        pattern.pattern.set(12, p.get(2));
        pattern.pattern.set(13, p.get(3));
        pattern.pattern.set(14, p.get(4));
        pattern.pattern.set(15, p.get(5));
        pattern.pattern.set(16, p.get(4));
        pattern.pattern.set(17, p.get(5));
        pattern.pattern.set(18, p.get(2));
        pattern.pattern.set(19, p.get(3));
        pattern.pattern.set(20, p.get(2));
        pattern.pattern.set(21, p.get(3));
        pattern.pattern.set(22, p.get(4));
        pattern.pattern.set(23, p.get(5));
        pattern.pattern.set(24, p.get(4));
        pattern.pattern.set(25, p.get(5));
        pattern.pattern.set(26, p.get(6));
        pattern.pattern.set(27, p.get(7));
        pattern.pattern.set(28, p.get(6));
        pattern.pattern.set(29, p.get(7));
        pattern.pattern.set(30, p.get(4));
        pattern.pattern.set(31, p.get(5));
        pattern.pattern.set(32, p.get(4));
        pattern.pattern.set(33, p.get(5));
        pattern.pattern.set(34, p.get(6));
        pattern.pattern.set(35, p.get(7));
        return pattern;
    }

    // 012345452301012345234567674523234567
    fun static Pattern sikha2(Pattern p)
    {
        Pattern pattern;
        pattern.size(36);
        pattern.pattern.set(0, p.get(0));
        pattern.pattern.set(1, p.get(1));
        pattern.pattern.set(2, p.get(2));
        pattern.pattern.set(3, p.get(3));
        pattern.pattern.set(4, p.get(4));
        pattern.pattern.set(5, p.get(5));
        pattern.pattern.set(6, p.get(4));
        pattern.pattern.set(7, p.get(5));
        pattern.pattern.set(8, p.get(2));
        pattern.pattern.set(9, p.get(3));
        pattern.pattern.set(10, p.get(0));
        pattern.pattern.set(11, p.get(1));
        pattern.pattern.set(12, p.get(0));
        pattern.pattern.set(13, p.get(1));
        pattern.pattern.set(14, p.get(2));
        pattern.pattern.set(15, p.get(3));
        pattern.pattern.set(16, p.get(4));
        pattern.pattern.set(17, p.get(5));
        pattern.pattern.set(18, p.get(2));
        pattern.pattern.set(19, p.get(3));
        pattern.pattern.set(20, p.get(4));
        pattern.pattern.set(21, p.get(5));
        pattern.pattern.set(22, p.get(6));
        pattern.pattern.set(23, p.get(7));
        pattern.pattern.set(24, p.get(6));
        pattern.pattern.set(25, p.get(7));
        pattern.pattern.set(26, p.get(4));
        pattern.pattern.set(27, p.get(5));
        pattern.pattern.set(28, p.get(2));
        pattern.pattern.set(29, p.get(3));
        pattern.pattern.set(30, p.get(2));
        pattern.pattern.set(31, p.get(3));
        pattern.pattern.set(32, p.get(4));
        pattern.pattern.set(33, p.get(5));
        pattern.pattern.set(34, p.get(6));
        pattern.pattern.set(35, p.get(7));
        return pattern;
    }

    // 01232301012345452301012345 23454523234567674523234567
    fun static Pattern ghana2(Pattern p)
    {
        Pattern pattern;
        pattern.size(52);
        pattern.pattern.set(0, p.get(0));
        pattern.pattern.set(1, p.get(1));
        pattern.pattern.set(2, p.get(2));
        pattern.pattern.set(3, p.get(3));
        pattern.pattern.set(4, p.get(2));
        pattern.pattern.set(5, p.get(3));
        pattern.pattern.set(6, p.get(0));
        pattern.pattern.set(7, p.get(1));
        pattern.pattern.set(8, p.get(0));
        pattern.pattern.set(9, p.get(1));
        pattern.pattern.set(10, p.get(2));
        pattern.pattern.set(11, p.get(3));
        pattern.pattern.set(12, p.get(4));
        pattern.pattern.set(13, p.get(5));
        pattern.pattern.set(14, p.get(4));
        pattern.pattern.set(15, p.get(5));
        pattern.pattern.set(16, p.get(2));
        pattern.pattern.set(17, p.get(3));
        pattern.pattern.set(18, p.get(0));
        pattern.pattern.set(19, p.get(1));
        pattern.pattern.set(20, p.get(0));
        pattern.pattern.set(21, p.get(1));
        pattern.pattern.set(22, p.get(2));
        pattern.pattern.set(23, p.get(3));
        pattern.pattern.set(24, p.get(4));
        pattern.pattern.set(25, p.get(5));

        pattern.pattern.set(26, p.get(2));
        pattern.pattern.set(27, p.get(3));
        pattern.pattern.set(28, p.get(4));
        pattern.pattern.set(29, p.get(5));
        pattern.pattern.set(30, p.get(4));
        pattern.pattern.set(31, p.get(5));
        pattern.pattern.set(32, p.get(2));
        pattern.pattern.set(33, p.get(3));
        pattern.pattern.set(34, p.get(2));
        pattern.pattern.set(35, p.get(3));
        pattern.pattern.set(36, p.get(4));
        pattern.pattern.set(37, p.get(5));
        pattern.pattern.set(38, p.get(6));
        pattern.pattern.set(39, p.get(7));
        pattern.pattern.set(40, p.get(6));
        pattern.pattern.set(41, p.get(7));
        pattern.pattern.set(42, p.get(4));
        pattern.pattern.set(43, p.get(5));
        pattern.pattern.set(44, p.get(2));
        pattern.pattern.set(45, p.get(3));
        pattern.pattern.set(46, p.get(2));
        pattern.pattern.set(47, p.get(3));
        pattern.pattern.set(48, p.get(4));
        pattern.pattern.set(49, p.get(5));
        pattern.pattern.set(50, p.get(6));
        pattern.pattern.set(51, p.get(7));
        return pattern;
    }

    // 0123012345674567
    fun static Pattern glass4(Pattern p)
    {
        Pattern pattern;
        pattern.size(16);
        pattern.pattern.set(0, p.get(0));
        pattern.pattern.set(1, p.get(1));
        pattern.pattern.set(2, p.get(2));
        pattern.pattern.set(3, p.get(3));
        pattern.pattern.set(4, p.get(0));
        pattern.pattern.set(5, p.get(1));
        pattern.pattern.set(6, p.get(2));
        pattern.pattern.set(7, p.get(3));
        pattern.pattern.set(8, p.get(4));
        pattern.pattern.set(9, p.get(5));
        pattern.pattern.set(10, p.get(6));
        pattern.pattern.set(11, p.get(7));
        pattern.pattern.set(12, p.get(4));
        pattern.pattern.set(13, p.get(5));
        pattern.pattern.set(14, p.get(6));
        pattern.pattern.set(15, p.get(7));
        return pattern;
    }

    // 01234567
    fun static Pattern krama4(Pattern p)
    {
        return forward(p);
    }

    // note these last three all are the same

    // 012301234567012345674567
    fun static Pattern jata4(Pattern p)
    {
        Pattern pattern;
        pattern.size(24);
        pattern.pattern.set(0, p.get(0));
        pattern.pattern.set(1, p.get(1));
        pattern.pattern.set(2, p.get(2));
        pattern.pattern.set(3, p.get(3));
        pattern.pattern.set(4, p.get(0));
        pattern.pattern.set(5, p.get(1));
        pattern.pattern.set(6, p.get(2));
        pattern.pattern.set(7, p.get(3));
        pattern.pattern.set(8, p.get(4));
        pattern.pattern.set(9, p.get(5));
        pattern.pattern.set(10, p.get(6));
        pattern.pattern.set(11, p.get(7));
        pattern.pattern.set(12, p.get(0));
        pattern.pattern.set(13, p.get(1));
        pattern.pattern.set(14, p.get(2));
        pattern.pattern.set(15, p.get(3));
        pattern.pattern.set(16, p.get(4));
        pattern.pattern.set(17, p.get(5));
        pattern.pattern.set(18, p.get(6));
        pattern.pattern.set(19, p.get(7));
        pattern.pattern.set(20, p.get(4));
        pattern.pattern.set(21, p.get(5));
        pattern.pattern.set(22, p.get(6));
        pattern.pattern.set(23, p.get(7));
        return pattern;
    }

    // 012345674567012301234567
    fun static Pattern sikha4(Pattern p)
    {
        return jata4(p);
    }

    // 012345674567012301234567
    fun static Pattern ghana4(Pattern p)
    {
        return jata4(p);
    }

    // double 0011..., triple 000111..., etc.
}

