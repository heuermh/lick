/*

    LiCK  Library for ChucK.
    Copyright (c) 2007-2022 held jointly by the individual authors.

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

/*

   Sonic Youth tunings, based on
   http://www.sonicyouth.com/mustang/tab/tunings.txt
   http://www.sonicyouth.com/mustang/tab/tuningtxt.txt
   http://www.sonicyouth.com/mustang/tab/tuning.html
   http://www.sonicyouth.com/mustang/tab/tuninglist.html
   documents copyright © 1997-2017 chris lawrence (silvercircle@shaw.ca)

*/
public class SYTunings
{
    Tuning _byName[0];
    Tuning _bySong[0];
    0 => int _byNameLoaded;
    0 => int _bySongLoaded;

    fun void _loadByName(Tuning t)
    {
        t @=> _byName[t.name];
    }

    fun void _loadBySong(string song, string artist, string name)
    {
        byName(name) @=> Tuning t;
        t @=> _bySong[song + "-" + artist];
    }

    fun Tuning byName(string name)
    {
        if (!_byNameLoaded)
        {
            _loadByName(_a_a_a_a_b_d());
            1 => _byNameLoaded;
        }
        return _byName[name];
    }

    fun Tuning bySong(string song, string artist)
    {
        if (!_bySongLoaded)
        {
            _loadBySong("Wall of Sound", "Lee", "A A A A B D");
            1 => _bySongLoaded;
        }
        return _bySong[song + "-" + artist];
    }


    // hidden primarily because cannot use e.g. F# in function names

    fun static Tuning _a_a_a_a_b_d()
    {
        return _delta("A A A A B D", 5, 0, 7, 2, 0, -2);
    }

    fun static Tuning _a_a_e_e_fs_a()
    {
        return _delta("A A E E F# A", 5, 0, 2, -3, -5, -7);
    }

    fun static Tuning _a_a_e_e_a_a()
    {
        return _delta("A A E E A A", 5, 0, 2, -3, -2, -7);
    }

    fun static Tuning _a_c_c_g_gs_c()
    {
        return _delta("A C C G G# C", 5, 3, -2, 0, -3, -4);
    }

    fun static Tuning _a_fs_e_fs_e_b()
    {
        return _delta("A F# E F# E B", 5, -3, 2, -1, -7, -5);
    }

    fun static Tuning _b_e_g_d_b_b()
    {
        return _delta("B E G D B B", -5, -5, 0, -5, -12, -17);
    }

    fun static Tuning _c_c_g_d_g_d()
    {
        return _delta("C C G D G D", -4, -9, -7, -5, -4, -2);
    }

    fun static Tuning _c_d_g_a_d_g()
    {
        return _delta("C D G A D G", -4, -7, -7, 2, 3, 3);
    }

    fun static Tuning _c_g_g_d_d_d()
    {
        return _delta("C G G D D D", -4, -2, -7, -5, -9, -14);
    }

    fun static Tuning _c_g_c_c_c_g()
    {
        return _delta("C G C C C G", -4, -2, -2, -7, 1, -9);
    }

    fun static Tuning _c_g_d_c_g_d()
    {
        return _delta("C G D C G D", -4, -2, 0, -7, -4, -2);
    }

    fun static Tuning _c_g_d_g_b_b()
    {
        return _delta("C G D G B B", -4, -2, 0, 0, 0, -5);
    }

    fun static Tuning _c_g_d_g_c_d()
    {
        return _delta("C G D G C D", -4, -2, 0, 0, 1, -2);
    }

    fun static Tuning _c_g_d_a_c_d()
    {
        return _delta("C G D A C D", -4, -2, 0, 2, 1, 2);
    }

    fun static Tuning _c_c_ds_g_g_d()
    {
        return _delta("C C D# G G D", 8, 3, 1, 0, -4, -2);
    }

    fun static Tuning _c_c_e_b_g_d()
    {
        return _delta("C C E B G D", 8, 3, 2, 4, -4, -2);
    }

    fun static Tuning _d_d_a_e_a_d()
    {
        return _delta("D D A E A D", -2, -7, -5, -3, -2, -2);
    }

    fun static Tuning _d_d_a_fs_a_d()
    {
        return _delta("D D A F# A D", -2, -7, -5, -1, -2, -2);
    }

    fun static Tuning _d_d_d_d_e_a()
    {
        return _delta("D D D D E A", -2, -7, 0, -5, -7, -7);
    }

    fun static Tuning _d_d_d_d_a_a()
    {
        return _delta("D D D D A A", -2, -7, 0, -5, -2, -7);
    }

    fun static Tuning _d_ds_as_ds_g_g()
    {
        return _delta("D D# A# D# G G", -2, -6, -4, -4, -4, -9);
    }

    fun static Tuning _d_ds_as_ds_g_c()
    {
        return _delta("D D# A# D# G C", -2, -6, -4, -4, -4, -4);
    }

    fun static Tuning _d_e_g_d_b_b()
    {
        return _delta("D E G D B B", -2, -5, -7, -5, -12, -17);
    }

    fun static Tuning _d_f_c_d_f_f()
    {
        return _delta("D F C D F F", -2, -4, -2, -5, -6, -11);
    }

    fun static Tuning _d_g_d_d_b_b()
    {
        return _delta("D G D D B B", -2, -2, 0, -5, -12, -17);
    }

    fun static Tuning _d_a_a_d_d_a()
    {
        return _delta("D A A D D A", -2, 0, -5, -5, -9, -7);
    }

    fun static Tuning _d_a_d_fs_a_d()
    {
        // open D?
        return _delta("D A D F# A D", -2, 0, 0, -1, -2, -2);
    }

    fun static Tuning _d_a_d_g_g_b()
    {
        return _delta("D A D G G B", -2, 0, 0, 0, -4, -5);
    }

    fun static Tuning _d_a_d_g_b_d()
    {
        return _delta("D A D G B D", -2, 0, 0, 0, 0, -2);
    }

    fun static Tuning _d_a_d_a_b_b()
    {
        return _delta("D A D A B B", -2, 0, 0, 2, 0, -5);
    }

    fun static Tuning _d_a_d_a_b_d()
    {
        return _delta("D A D A B D", -2, 0, 0, 2, 0, -2);
    }

    fun static Tuning _d_as_d_f_c_as()
    {
        return _delta("D A# D F C A#", -2, 1, 0, -2, 1, -6);
    }

    fun static Tuning _ds_ds_a_a_e_e()
    {
        return _delta("D# D# A A E E", -1, -6, -5, -10, -7, -12);
    }

    fun static Tuning _ds_ds_as_ds_g_g()
    {
        return _delta("D# D# A# A# G G", -1, -6, -4, -4, -4, -9);
    }

    fun static Tuning _ds_ds_cs_cs_g_g()
    {
        return _delta("D# D# C# C# G G", -1, -6, -1, -6, -4, -9);
    }

    fun static Tuning _ds_as_d_f_as_c()
    {
        return _delta("D# A# D F A# C", -1, 1, 0, -2, -1, -4);
    }

    fun static Tuning _ds_as_ds_b_cs_fs()
    {
        return _delta("D# A# D# B C# F#", -1, -1, -1, -8, 2, -10);
    }

    fun static Tuning _e_e_b_b_e_fs()
    {
        return _delta("E E B B E F#", 0, -5, -3, -8, -7, -10);
    }

    fun static Tuning _e_e_b_e_b_b()
    {
        return _delta("E E B E B B", 0, -5, -3, -3, 0, -5);
    }

    fun static Tuning _e_e_e_e_fs_fs()
    {
        return _delta("E E E E F# F#", 0, -5, 2, -3, -5, -10);
    }

    fun static Tuning _e_e_b_e_gs_b()
    {
        return _delta("E E B E G# B", 0, -5, -3, -3, -3, -5);
    }

    fun static Tuning _e_e_b_e_b_e()
    {
        return _delta("E E B E B E", 0, -5, -3, -3, 0, 0);
    }

    fun static Tuning _e_e_b_fs_b_e()
    {
        return _delta("E E B F# B E", 0, -5, -3, -1, 0, 0);
    }

    fun static Tuning _e_fs_cs_fs_as_cs()
    {
        return _delta("E F# C# F# A# C#", 0, -3, -1, -1, -1, -3);
    }

    fun static Tuning _e_g_d_g_e_d()
    {
        return _delta("E G D G E D", 0, -2, 0, 0, -7, -2);
    }

    fun static Tuning _e_gs_e_gs_e_gs()
    {
        return _delta("E G# E G# E G#", 0, -1, 2, 1, -7, -8);
    }

    fun static Tuning _e_a_d_e_c_d()
    {
        return _delta("E A D E C D", 0, 0, 0, -3, 1, -2);
    }

    fun static Tuning _e_b_e_e_a_a()
    {
        return _delta("E B E E A A", 0, 2, 2, -3, -2, -7);
    }

    fun static Tuning _e_b_e_e_a_b()
    {
        return _delta("E B E E A B", 0, 2, 2, -3, -2, -5);
    }

    fun static Tuning _e_b_e_g_g_b()
    {
        return _delta("E B E G G B", 0, 2, 2, 0, -4, -5);
    }

    fun static Tuning _f_g_c_f_a_fs()
    {
        return _delta("F G C F A F#", -11, -14, -2, -2, -2, -10);
    }

    fun static Tuning _f_f_c_c_a_a()
    {
        return _delta("F F C C A A", 1, -4, -2, -7, -2, -7);
    }

    fun static Tuning _f_f_c_g_c_c()
    {
        return _delta("F F C G C C", 1, -4, -2, 0, 1, -4);
    }

    fun static Tuning _f_f_ds_f_as_c()
    {
        return _delta("F F D# F A# C", 1, -4, 1, -2, -1, -4);
    }

    fun static Tuning _fs_fs_fs_fs_e_b()
    {
        return _delta("F# F# F# F# E B", 2, -3, 4, -1, -7, -5);
    }

    fun static Tuning _fs_fs_g_g_a_a()
    {
        return _delta("F# F# G G A A", 2, -3, 5, 0, -2, -7);
    }

    fun static Tuning _fs_fs_a_a_e_e()
    {
        return _delta("F# F# A A E E", 2, -3, -5, -10, -7, -12);
    }

    fun static Tuning _fs_fs_cs_fs_as_cs()
    {
        return _delta("F# F# C# F# A# C#", 2, -3, -1, -1, -1, -3);
    }

    fun static Tuning _fs_fs_cs_cs_cs_cs()
    {
        return _delta("F# F# C# C# C# C#", 2, -3, -1, -6, 2, -3);
    }

    fun static Tuning _fs_a_a_fs_fs_fs()
    {
        return _delta("F# A A F# F# F#", 2, 0, -5, -1, -5, -10);
    }

    fun static Tuning _g_g_c_c_as_as()
    {
        return _delta("G G C C A# A#", 3, -2, -2, -7, -1, -6);
    }

    fun static Tuning _g_g_c_g_c_c()
    {
        return _delta("G G C G C C", 3, -2, -2, 0, 1, -4);
    }

    fun static Tuning _g_g_c_g_c_d()
    {
        return _delta("G G C G C D", 3, -2, -2, 0, 1, -2);
    }

    fun static Tuning _g_g_cs_d_g_g()
    {
        return _delta("G G C# D G G", 3, -2, -1, -5, -4, -9);
    }

    fun static Tuning _g_g_d_d_ds_ds()
    {
        return _delta("G G D D D# D#", 3, -2, 0, -5, -8, -13);
    }

    fun static Tuning _g_g_d_d_f_f()
    {
        return _delta("G G D D F F", 3, -2, 0, -5, -6, -11);
    }

    fun static Tuning _g_g_d_d_g_g()
    {
        return _delta("G G D D G G", 3, -2, 0, -5, -4, -9);
    }

    fun static Tuning _g_g_d_e_g_b()
    {
        return _delta("G G D E G B", 3, -2, 0, -3, -4, -5);
    }

    fun static Tuning _g_g_d_f_f_g()
    {
        return _delta("G G D F F G", 3, -2, 0, -2, -6, -9);
    }

    fun static Tuning _g_g_d_g_g_a()
    {
        return _delta("G G D G G A", 3, -2, 0, 0, -4, -7);
    }

    fun static Tuning _g_g_d_g_b_d()
    {
        return _delta("G G D G B D", 3, -2, 0, 0, 0, -2);
    }

    fun static Tuning _g_g_d_a_g_as()
    {
        return _delta("G G D A G A#", 3, -2, 0, 2, -4, -6);
    }

    fun static Tuning _g_a_b_d_e_g()
    {
        return _delta("G A B D E G", 3, 0, -3, -5, -7, -9);
    }

    fun static Tuning _delta(string name, int d1, int d2, int d3, int d4, int d5, int d6)
    {
        return Tuning.create(name, 52 + d1, 57 + d2, 62 + d3, 67 + d4, 71 + d5, 76 + d6);
    }
}
