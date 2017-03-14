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

// interacts with the Loopy iOS app over MIDI
public class LoopyMidi extends Loopy
{
    MidiOut out;
    ControlChangeMidiMsg ccMsg;

    // map CC number to Loopy action
    0 => int SELECT_NEXT_TRACK;
    1 => int SELECT_PREVIOUS_TRACK;
    2 => int TOGGLE_MUTE;
    3 => int TOGGLE_MUTE_AND_PLAY_NEXT_TRACK;
    4 => int TOGGLE_RECORD;
    5 => int TOGGLE_RECORD_SELECT_NEXT_TRACK;
    6 => int TOGGLE_RECORD_MUTE_SELECT_NEXT_TRACK;
    7 => int TOGGLE_RECORD_MUTE_RECORD_NEXT_TRACK;
    8 => int TOGGLE_RECORD_OVERDUB;
    9 => int TOGGLE_RECORD_WITHOUT_COUNT_IN;
    10 => int TOGGLE_REVERSE;
    11 => int CLEAR_TRACK;
    12 => int RERECORD_TRACK;
    13 => int SOLO_TRACK;
    14 => int TOGGLE_MUTE_ALL_TRACKS;
    15 => int CLEAR_ALL_TRACKS;
    16 => int SELECT_TRACK;
    17 => int TAP_TEMPO;
    18 => int DOUBLE_CLOCK_LENGTH;
    19 => int HALVE_CLOCK_LENGTH;
    20 => int TOGGLE_SESSION_PAUSE;
    21 => int TOGGLE_SESSION_PAUSE_RESTART;
    22 => int RESTART_SESSION;
    23 => int RESET_SESSION;
    24 => int TOGGLE_TRACK_SYNC;
    25 => int CANCEL_PENDING_ACTIONS;
    26 => int TOGGLE_METRONOME;
    27 => int TOGGLE_FADING;
    // CC value to trigger Loopy action
    65 => int CC_VALUE;

    fun void open(int device)
    {
        out.open(device);
    }

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

    fun void toggleRecordMuteSelectNextTrack()
    {
        _cc(TOGGLE_RECORD_MUTE_SELECT_NEXT_TRACK);
    }

    fun void toggleRecordMuteRecordNextTrack()
    {
        _cc(TOGGLE_RECORD_MUTE_RECORD_NEXT_TRACK);
    }

    fun void toggleRecordOverdub()
    {
        _cc(TOGGLE_RECORD_OVERDUB);
    }

    fun void toggleRecordWithoutCountIn()
    {
        _cc(TOGGLE_RECORD_WITHOUT_COUNT_IN);
    }

    fun void toggleReverse()
    {
        _cc(TOGGLE_REVERSE);
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

    fun void toggleMetronome()
    {
        _cc(TOGGLE_METRONOME);
    }

    fun void toggleFading()
    {
        _cc(TOGGLE_FADING);
    }
}
