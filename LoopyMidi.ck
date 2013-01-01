/*

    LiCK  Library for ChucK.
    Copyright (c) 2007-2013 held jointly by the individual authors.

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

// interacts with the Loopy iOS app over MIDI
public class LoopyMidi extends Loopy
{
    MidiOut out;
    ControlChangeMidiMsg ccMsg;

    // map CC number to Loopy action
    0 => int SELECT_NEXT_TRACK;
    1 => int SELECT_PREVIOUS_TRACK;
    2 => int TOGGLE_MUTE;
    3 => int TOGGLE_RECORD;
    4 => int TOGGLE_RECORD_SELECT_NEXT_TRACK;
    5 => int TOGGLE_RECORD_OVERDUB;
    6 => int TOGGLE_RECORD_WITHOUT_COUNT_IN;
    7 => int CLEAR_TRACK;
    8 => int RERECORD_TRACK;
    9 => int SOLO_TRACK;
    10 => int TOGGLE_MUTE_ALL_TRACKS;
    11 => int CLEAR_ALL_TRACKS;
    12 => int SELECT_TRACK;
    13 => int TAP_TEMPO;
    14 => int DOUBLE_CLOCK_LENGTH;
    15 => int HALVE_CLOCK_LENGTH;
    16 => int TOGGLE_SESSION_PAUSE;
    17 => int TOGGLE_SESSION_PAUSE_RESTART;
    18 => int RESTART_SESSION;
    19 => int RESET_SESSION;
    20 => int TOGGLE_TRACK_SYNC;
    21 => int CANCEL_PENDING_ACTIONS;
    // CC value to trigger Loopy action
    65 => int CC_VALUE;

    fun void _cc(int number)
    {
        ccMsg.number(number);
        ccMsg.value(CC_VALUE);
        out.send(ccMsg);
    }

    fun void selectNextTrack()
    {
        _cc(SELECT_NEXT_TRACK);
    }

    fun void selectPreviousTrack()
    {
        _cc(SELECT_PREVIOUS_TRACK);
    }

    fun void toggleMute()
    {
        _cc(TOGGLE_MUTE);
    }

    fun void toggleRecord()
    {
        _cc(TOGGLE_RECORD);
    }

    fun void toggleRecordSelectNextTrack()
    {
        _cc(TOGGLE_RECORD_SELECT_NEXT_TRACK);
    }

    fun void toggleRecordOverdub()
    {
        _cc(TOGGLE_RECORD_OVERDUB);
    }

    fun void toggleRecordWithoutCountIn()
    {
        _cc(TOGGLE_RECORD_WITHOUT_COUNT_IN);
    }

    fun void clearTrack()
    {
        _cc(CLEAR_TRACK);
    }

    fun void rerecordTrack()
    {
        _cc(RERECORD_TRACK);
    }

    fun void soloTrack()
    {
        _cc(SOLO_TRACK);
    }

    fun void toggleMuteAllTracks()
    {
        _cc(TOGGLE_MUTE_ALL_TRACKS);
    }

    fun void clearAllTracks()
    {
        _cc(CLEAR_ALL_TRACKS);
    }

    fun void selectTrack()
    {
        _cc(SELECT_TRACK);
    }

    fun void tapTempo()
    {
        _cc(TAP_TEMPO);
    }

    fun void doubleClockLength()
    {
        _cc(DOUBLE_CLOCK_LENGTH);
    }

    fun void halveClockLength()
    {
        _cc(HALVE_CLOCK_LENGTH);
    }

    fun void toggleSessionPause()
    {
        _cc(TOGGLE_SESSION_PAUSE);
    }

    fun void toggleSessionPauseRestart()
    {
        _cc(TOGGLE_SESSION_PAUSE_RESTART);
    }

    fun void restartSession()
    {
        _cc(RESTART_SESSION);
    }

    fun void resetSession()
    {
        _cc(RESET_SESSION);
    }

    fun void toggleTrackSync()
    {
        _cc(TOGGLE_TRACK_SYNC);
    }

    fun void cancelPendingActions()
    {
        _cc(CANCEL_PENDING_ACTIONS);
    }
}