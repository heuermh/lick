/*

    LiCK  Library for ChucK.
    Copyright (c) 2007-2014 held jointly by the individual authors.

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
   http://www.sonicyouth.com/mustang/tab/tuning.html
   documents copyright © 1997-2012 chris lawrence (silvercircle@shaw.ca)

*/
public class SYTunings
{
    int _s[1];
    int _a[1];
    Tuning @ _t[1][1];

    {
        <<<"initializer...", _s, _a, _t>>>;
        // songs
        0 => _s["The Burning Spear"];

        // artists
        //2 => _a["k"];
        //2 => _a["kim"];
        //2 => _a["K"];
        //2 => _a["Kim"];
        //2 => _a["Kim Gordon"];
        //1 => _a["l"];
        //1 => _a["lee"];
        //1 => _a["L"];
        //1 => _a["Lee"];
        //1 => _a["Lee Ranaldo"];
        //0 => _a["t"];
        //0 => _a["thurston"];
        //0 => _a["T"];
        0 => _a["Thurston"];
        //0 => _a["Thurston Moore"];

        // tunings
        _store("The Burning Spear", "T", _std());
        <<<"initializer done">>>;
    }

    fun Tuning tuning(string song, string artist)
    {
        <<<"tuning", song, artist, _s, _a, _t>>>;
        _s[song] => int s;
        _a[artist] => int a;
        return _t[s][a];
    }

    fun void _store(string song, string artist, Tuning tuning)
    {
        <<<"store", song, artist>>>;
        _s[song] => int s;
        _a[artist] => int a;
        <<<"s", s, "a", a>>>;
        tuning @=> _t[s][a];
    }

    fun static Tuning _std()
    {
        return Tunings.std();
    }

    fun static Tuning _create(string name, int s1, int s2, int s3, int s4, int s5, int s6)
    {
        return Tuning.create(name, s1, s2, s3, s4, s5, s6);
    }

    fun static Tuning _delta(string name, int d1, int d2, int d3, int d4, int d5, int d6)
    {
        return Tuning.create(name, 52 + d1, 57 + d2, 62 + d3, 67 + d4, 71 + d5, 76 + d6);
    }
}