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

// emulates the Loopy iOS app
public class Loopy
{

    fun void open(int device)
    {
        <<<"open", device>>>;
    }

    fun void selectNextTrack()
    {
        <<<"select next track">>>;
    }

    fun void selectPreviousTrack()
    {
        <<<"select previous track">>>;
    }

    fun void toggleMute()
    {
        <<<"toggle mute">>>;
    }

    // or muteAndUnmuteNextMutedTrack() ?
    fun void muteAndPlayNextMutedTrack()
    {
        <<<"mute and play next muted track">>>;
    }

    fun void toggleRecord()
    {
        <<<"toggle record">>>;
    }

    fun void toggleRecordSelectNextTrack()
    {
        <<<"toggle record select next track">>>;
    }

    fun void toggleRecordMuteSelectNextTrack()
    {
        <<<"toggle record mute select next track">>>;
    }

    fun void toggleRecordMuteRecordNextTrack()
    {
        <<<"toggle record mute record next track">>>;
    }

    fun void toggleRecordOverdub()
    {
        <<<"toggle record overdub">>>;
    }

    fun void toggleRecordWithoutCountIn()
    {
        <<<"toggle record without count in/out">>>;
    }

    fun void toggleReverse()
    {
        <<<"toggle reverse">>>;
    }

    fun void clearTrack()
    {
        <<<"clear track">>>;
    }

    fun void rerecordTrack()
    {
        <<<"rerecord track">>>;
    }

    fun void soloTrack()
    {
        <<<"solo track">>>;
    }

    fun void toggleMuteAllTracks()
    {
        <<<"toggle mute all tracks">>>;
    }

    fun void clearAllTracks()
    {
        <<<"clear all tracks">>>;
    }

    fun void selectTrack()
    {
        <<<"select track">>>;
    }

    fun void tapTempo()
    {
        <<<"tap tempo">>>;
    }

    fun void doubleClockLength()
    {
        <<<"double clock length">>>;
    }

    fun void halveClockLength()
    {
        <<<"halve clock length">>>;
    }

    fun void toggleSessionPause()
    {
        <<<"toggle session pause">>>;
    }

    fun void toggleSessionPauseRestart()
    {
        <<<"toggle session pause restart">>>;
    }

    fun void restartSession()
    {
        <<<"restart session">>>;
    }

    fun void resetSession()
    {
        <<<"reset session">>>;
    }

    fun void toggleTrackSync()
    {
        <<<"toggle track sync">>>;
    }

    fun void cancelPendingActions()
    {
        <<<"cancel pending actions">>>;
    }

    fun void toggleMetronome()
    {
        <<<"toggle metronome">>>;
    }

    fun void toggleFading()
    {
        <<<"toggle fading">>>;
    }
}
