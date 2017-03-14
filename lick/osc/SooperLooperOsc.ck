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

// interacts with SooperLooper app over OSC
public class SooperLooperOsc extends SooperLooper
{
    OscRecv client;
    OscSend engine;
    6449 => int clientPort;
    "localhost" => string engineHost;
    6450 => int enginePort;

    fun void connect()
    {
        clientPort => client.port;
        client.listen();
        engine.setHost(engineHost, enginePort);
    }

    // for all commands
    fun void downRecord()
    {
        downRecord(-1);
    }

    fun void upRecord()
    {
        upRecord(-1);
    }

    fun void forceUpRecord()
    {
        forceUpRecord(-1);
    }

    fun void hitRecord()
    {
        hitRecord(-1);
    }

    fun void downRecord(int loop)
    {
        "/sl/" + loop + "/down" => string address;
        engine.startMsg(address, "s");
        "record" => engine.addString;
    }

    fun void upRecord(int loop)
    {
        "/sl/" + loop + "/up" => string address;
        engine.startMsg(address, "s");
        "record" => engine.addString;
    }

    fun void forceUpRecord(int loop)
    {
        "/sl/" + loop + "/forceup" => string address;
        engine.startMsg(address, "s");
        "record" => engine.addString;
    }

    fun void hitRecord(int loop)
    {
        "/sl/" + loop + "/hit" => string address;
        engine.startMsg(address, "s");
        "record" => engine.addString;
    }

    fun void downOverdub()
    {
        downOverdub(-1);
    }

    fun void upOverdub()
    {
        upOverdub(-1);
    }

    fun void forceUpOverdub()
    {
        forceUpOverdub(-1);
    }

    fun void hitOverdub()
    {
        hitOverdub(-1);
    }

    fun void downOverdub(int loop)
    {
        "/sl/" + loop + "/down" => string address;
        engine.startMsg(address, "s");
        "overdub" => engine.addString;
    }

    fun void upOverdub(int loop)
    {
        "/sl/" + loop + "/up" => string address;
        engine.startMsg(address, "s");
        "overdub" => engine.addString;
    }

    fun void forceUpOverdub(int loop)
    {
        "/sl/" + loop + "/forceup" => string address;
        engine.startMsg(address, "s");
        "overdub" => engine.addString;
    }

    fun void hitOverdub(int loop)
    {
        "/sl/" + loop + "/hit" => string address;
        engine.startMsg(address, "s");
        "overdub" => engine.addString;
    }

    fun void downMultiply()
    {
        downMultiply(-1);
    }

    fun void upMultiply()
    {
        upMultiply(-1);
    }

    fun void forceUpMultiply()
    {
        forceUpMultiply(-1);
    }

    fun void hitMultiply()
    {
        hitMultiply(-1);
    }

    fun void downMultiply(int loop)
    {
        "/sl/" + loop + "/down" => string address;
        engine.startMsg(address, "s");
        "multiply" => engine.addString;
    }

    fun void upMultiply(int loop)
    {
        "/sl/" + loop + "/up" => string address;
        engine.startMsg(address, "s");
        "multiply" => engine.addString;
    }

    fun void forceUpMultiply(int loop)
    {
        "/sl/" + loop + "/forceup" => string address;
        engine.startMsg(address, "s");
        "multiply" => engine.addString;
    }

    fun void hitMultiply(int loop)
    {
        "/sl/" + loop + "/hit" => string address;
        engine.startMsg(address, "s");
        "multiply" => engine.addString;
    }

    fun void downInsert()
    {
        downInsert(-1);
    }

    fun void upInsert()
    {
        upInsert(-1);
    }

    fun void forceUpInsert()
    {
        forceUpInsert(-1);
    }

    fun void hitInsert()
    {
        hitInsert(-1);
    }

    fun void downInsert(int loop)
    {
        "/sl/" + loop + "/down" => string address;
        engine.startMsg(address, "s");
        "insert" => engine.addString;
    }

    fun void upInsert(int loop)
    {
        "/sl/" + loop + "/up" => string address;
        engine.startMsg(address, "s");
        "insert" => engine.addString;
    }

    fun void forceUpInsert(int loop)
    {
        "/sl/" + loop + "/forceup" => string address;
        engine.startMsg(address, "s");
        "insert" => engine.addString;
    }

    fun void hitInsert(int loop)
    {
        "/sl/" + loop + "/hit" => string address;
        engine.startMsg(address, "s");
        "insert" => engine.addString;
    }

    fun void downReplace()
    {
        downReplace(-1);
    }

    fun void upReplace()
    {
        upReplace(-1);
    }

    fun void forceUpReplace()
    {
        forceUpReplace(-1);
    }

    fun void hitReplace()
    {
        hitReplace(-1);
    }

    fun void downReplace(int loop)
    {
        "/sl/" + loop + "/down" => string address;
        engine.startMsg(address, "s");
        "replace" => engine.addString;
    }

    fun void upReplace(int loop)
    {
        "/sl/" + loop + "/up" => string address;
        engine.startMsg(address, "s");
        "replace" => engine.addString;
    }

    fun void forceUpReplace(int loop)
    {
        "/sl/" + loop + "/forceup" => string address;
        engine.startMsg(address, "s");
        "replace" => engine.addString;
    }

    fun void hitReplace(int loop)
    {
        "/sl/" + loop + "/hit" => string address;
        engine.startMsg(address, "s");
        "replace" => engine.addString;
    }

    fun void downReverse()
    {
        downReverse(-1);
    }

    fun void upReverse()
    {
        upReverse(-1);
    }

    fun void forceUpReverse()
    {
        forceUpReverse(-1);
    }

    fun void hitReverse()
    {
        hitReverse(-1);
    }

    fun void downReverse(int loop)
    {
        "/sl/" + loop + "/down" => string address;
        engine.startMsg(address, "s");
        "reverse" => engine.addString;
    }

    fun void upReverse(int loop)
    {
        "/sl/" + loop + "/up" => string address;
        engine.startMsg(address, "s");
        "reverse" => engine.addString;
    }

    fun void forceUpReverse(int loop)
    {
        "/sl/" + loop + "/forceup" => string address;
        engine.startMsg(address, "s");
        "reverse" => engine.addString;
    }

    fun void hitReverse(int loop)
    {
        "/sl/" + loop + "/hit" => string address;
        engine.startMsg(address, "s");
        "reverse" => engine.addString;
    }

    fun void downMute()
    {
        downMute(-1);
    }

    fun void upMute()
    {
        upMute(-1);
    }

    fun void forceUpMute()
    {
        forceUpMute(-1);
    }

    fun void hitMute()
    {
        hitMute(-1);
    }

    fun void downMute(int loop)
    {
        "/sl/" + loop + "/down" => string address;
        engine.startMsg(address, "s");
        "mute" => engine.addString;
    }

    fun void upMute(int loop)
    {
        "/sl/" + loop + "/up" => string address;
        engine.startMsg(address, "s");
        "mute" => engine.addString;
    }

    fun void forceUpMute(int loop)
    {
        "/sl/" + loop + "/forceup" => string address;
        engine.startMsg(address, "s");
        "mute" => engine.addString;
    }

    fun void hitMute(int loop)
    {
        "/sl/" + loop + "/hit" => string address;
        engine.startMsg(address, "s");
        "mute" => engine.addString;
    }

    fun void downUndo()
    {
        downUndo(-1);
    }

    fun void upUndo()
    {
        upUndo(-1);
    }

    fun void forceUpUndo()
    {
        forceUpUndo(-1);
    }

    fun void hitUndo()
    {
        hitUndo(-1);
    }

    fun void downUndo(int loop)
    {
        "/sl/" + loop + "/down" => string address;
        engine.startMsg(address, "s");
        "undo" => engine.addString;
    }

    fun void upUndo(int loop)
    {
        "/sl/" + loop + "/up" => string address;
        engine.startMsg(address, "s");
        "undo" => engine.addString;
    }

    fun void forceUpUndo(int loop)
    {
        "/sl/" + loop + "/forceup" => string address;
        engine.startMsg(address, "s");
        "undo" => engine.addString;
    }

    fun void hitUndo(int loop)
    {
        "/sl/" + loop + "/hit" => string address;
        engine.startMsg(address, "s");
        "undo" => engine.addString;
    }

    fun void downRedo()
    {
        downRedo(-1);
    }

    fun void upRedo()
    {
        upRedo(-1);
    }

    fun void forceUpRedo()
    {
        forceUpRedo(-1);
    }

    fun void hitRedo()
    {
        hitRedo(-1);
    }

    fun void downRedo(int loop)
    {
        "/sl/" + loop + "/down" => string address;
        engine.startMsg(address, "s");
        "redo" => engine.addString;
    }

    fun void upRedo(int loop)
    {
        "/sl/" + loop + "/up" => string address;
        engine.startMsg(address, "s");
        "redo" => engine.addString;
    }

    fun void forceUpRedo(int loop)
    {
        "/sl/" + loop + "/forceup" => string address;
        engine.startMsg(address, "s");
        "redo" => engine.addString;
    }

    fun void hitRedo(int loop)
    {
        "/sl/" + loop + "/hit" => string address;
        engine.startMsg(address, "s");
        "redo" => engine.addString;
    }

    fun void downOneShot()
    {
        downOneShot(-1);
    }

    fun void upOneShot()
    {
        upOneShot(-1);
    }

    fun void forceUpOneShot()
    {
        forceUpOneShot(-1);
    }

    fun void hitOneShot()
    {
        hitOneShot(-1);
    }

    fun void downOneShot(int loop)
    {
        "/sl/" + loop + "/down" => string address;
        engine.startMsg(address, "s");
        "oneshot" => engine.addString;
    }

    fun void upOneShot(int loop)
    {
        "/sl/" + loop + "/up" => string address;
        engine.startMsg(address, "s");
        "oneshot" => engine.addString;
    }

    fun void forceUpOneShot(int loop)
    {
        "/sl/" + loop + "/forceup" => string address;
        engine.startMsg(address, "s");
        "oneshot" => engine.addString;
    }

    fun void hitOneShot(int loop)
    {
        "/sl/" + loop + "/hit" => string address;
        engine.startMsg(address, "s");
        "oneshot" => engine.addString;
    }

    fun void downTrigger()
    {
        downTrigger(-1);
    }

    fun void upTrigger()
    {
        upTrigger(-1);
    }

    fun void forceUpTrigger()
    {
        forceUpTrigger(-1);
    }

    fun void hitTrigger()
    {
        hitTrigger(-1);
    }

    fun void downTrigger(int loop)
    {
        "/sl/" + loop + "/down" => string address;
        engine.startMsg(address, "s");
        "trigger" => engine.addString;
    }

    fun void upTrigger(int loop)
    {
        "/sl/" + loop + "/up" => string address;
        engine.startMsg(address, "s");
        "trigger" => engine.addString;
    }

    fun void forceUpTrigger(int loop)
    {
        "/sl/" + loop + "/forceup" => string address;
        engine.startMsg(address, "s");
        "trigger" => engine.addString;
    }

    fun void hitTrigger(int loop)
    {
        "/sl/" + loop + "/hit" => string address;
        engine.startMsg(address, "s");
        "trigger" => engine.addString;
    }

    fun void downSubstitute()
    {
        downSubstitute(-1);
    }

    fun void upSubstitute()
    {
        upSubstitute(-1);
    }

    fun void forceUpSubstitute()
    {
        forceUpSubstitute(-1);
    }

    fun void hitSubstitute()
    {
        hitSubstitute(-1);
    }

    fun void downSubstitute(int loop)
    {
        "/sl/" + loop + "/down" => string address;
        engine.startMsg(address, "s");
        "substitute" => engine.addString;
    }

    fun void upSubstitute(int loop)
    {
        "/sl/" + loop + "/up" => string address;
        engine.startMsg(address, "s");
        "substitute" => engine.addString;
    }

    fun void forceUpSubstitute(int loop)
    {
        "/sl/" + loop + "/forceup" => string address;
        engine.startMsg(address, "s");
        "substitute" => engine.addString;
    }

    fun void hitSubstitute(int loop)
    {
        "/sl/" + loop + "/hit" => string address;
        engine.startMsg(address, "s");
        "substitute" => engine.addString;
    }

    fun void downUndoAll()
    {
        downUndoAll(-1);
    }

    fun void upUndoAll()
    {
        upUndoAll(-1);
    }

    fun void forceUpUndoAll()
    {
        forceUpUndoAll(-1);
    }

    fun void hitUndoAll()
    {
        hitUndoAll(-1);
    }

    fun void downUndoAll(int loop)
    {
        "/sl/" + loop + "/down" => string address;
        engine.startMsg(address, "s");
        "undo_all" => engine.addString;
    }

    fun void upUndoAll(int loop)
    {
        "/sl/" + loop + "/up" => string address;
        engine.startMsg(address, "s");
        "undo_all" => engine.addString;
    }

    fun void forceUpUndoAll(int loop)
    {
        "/sl/" + loop + "/forceup" => string address;
        engine.startMsg(address, "s");
        "undo_all" => engine.addString;
    }

    fun void hitUndoAll(int loop)
    {
        "/sl/" + loop + "/hit" => string address;
        engine.startMsg(address, "s");
        "undo_all" => engine.addString;
    }

    fun void downRedoAll()
    {
        downRedoAll(-1);
    }

    fun void upRedoAll()
    {
        upRedoAll(-1);
    }

    fun void forceUpRedoAll()
    {
        forceUpRedoAll(-1);
    }

    fun void hitRedoAll()
    {
        hitRedoAll(-1);
    }

    fun void downRedoAll(int loop)
    {
        "/sl/" + loop + "/down" => string address;
        engine.startMsg(address, "s");
        "redo_all" => engine.addString;
    }

    fun void upRedoAll(int loop)
    {
        "/sl/" + loop + "/up" => string address;
        engine.startMsg(address, "s");
        "redo_all" => engine.addString;
    }

    fun void forceUpRedoAll(int loop)
    {
        "/sl/" + loop + "/forceup" => string address;
        engine.startMsg(address, "s");
        "redo_all" => engine.addString;
    }

    fun void hitRedoAll(int loop)
    {
        "/sl/" + loop + "/hit" => string address;
        engine.startMsg(address, "s");
        "redo_all" => engine.addString;
    }

    fun void downMuteOn()
    {
        downMuteOn(-1);
    }

    fun void upMuteOn()
    {
        upMuteOn(-1);
    }

    fun void forceUpMuteOn()
    {
        forceUpMuteOn(-1);
    }

    fun void hitMuteOn()
    {
        hitMuteOn(-1);
    }

    fun void downMuteOn(int loop)
    {
        "/sl/" + loop + "/down" => string address;
        engine.startMsg(address, "s");
        "mute_on" => engine.addString;
    }

    fun void upMuteOn(int loop)
    {
        "/sl/" + loop + "/up" => string address;
        engine.startMsg(address, "s");
        "mute_on" => engine.addString;
    }

    fun void forceUpMuteOn(int loop)
    {
        "/sl/" + loop + "/forceup" => string address;
        engine.startMsg(address, "s");
        "mute_on" => engine.addString;
    }

    fun void hitMuteOn(int loop)
    {
        "/sl/" + loop + "/hit" => string address;
        engine.startMsg(address, "s");
        "mute_on" => engine.addString;
    }

    fun void downMuteOff()
    {
        downMuteOff(-1);
    }

    fun void upMuteOff()
    {
        upMuteOff(-1);
    }

    fun void forceUpMuteOff()
    {
        forceUpMuteOff(-1);
    }

    fun void hitMuteOff()
    {
        hitMuteOff(-1);
    }

    fun void downMuteOff(int loop)
    {
        "/sl/" + loop + "/down" => string address;
        engine.startMsg(address, "s");
        "mute_off" => engine.addString;
    }

    fun void upMuteOff(int loop)
    {
        "/sl/" + loop + "/up" => string address;
        engine.startMsg(address, "s");
        "mute_off" => engine.addString;
    }

    fun void forceUpMuteOff(int loop)
    {
        "/sl/" + loop + "/forceup" => string address;
        engine.startMsg(address, "s");
        "mute_off" => engine.addString;
    }

    fun void hitMuteOff(int loop)
    {
        "/sl/" + loop + "/hit" => string address;
        engine.startMsg(address, "s");
        "mute_off" => engine.addString;
    }

    fun void downSolo()
    {
        downSolo(-1);
    }

    fun void upSolo()
    {
        upSolo(-1);
    }

    fun void forceUpSolo()
    {
        forceUpSolo(-1);
    }

    fun void hitSolo()
    {
        hitSolo(-1);
    }

    fun void downSolo(int loop)
    {
        "/sl/" + loop + "/down" => string address;
        engine.startMsg(address, "s");
        "solo" => engine.addString;
    }

    fun void upSolo(int loop)
    {
        "/sl/" + loop + "/up" => string address;
        engine.startMsg(address, "s");
        "solo" => engine.addString;
    }

    fun void forceUpSolo(int loop)
    {
        "/sl/" + loop + "/forceup" => string address;
        engine.startMsg(address, "s");
        "solo" => engine.addString;
    }

    fun void hitSolo(int loop)
    {
        "/sl/" + loop + "/hit" => string address;
        engine.startMsg(address, "s");
        "solo" => engine.addString;
    }

    fun void downPause()
    {
        downPause(-1);
    }

    fun void upPause()
    {
        upPause(-1);
    }

    fun void forceUpPause()
    {
        forceUpPause(-1);
    }

    fun void hitPause()
    {
        hitPause(-1);
    }

    fun void downPause(int loop)
    {
        "/sl/" + loop + "/down" => string address;
        engine.startMsg(address, "s");
        "pause" => engine.addString;
    }

    fun void upPause(int loop)
    {
        "/sl/" + loop + "/up" => string address;
        engine.startMsg(address, "s");
        "pause" => engine.addString;
    }

    fun void forceUpPause(int loop)
    {
        "/sl/" + loop + "/forceup" => string address;
        engine.startMsg(address, "s");
        "pause" => engine.addString;
    }

    fun void hitPause(int loop)
    {
        "/sl/" + loop + "/hit" => string address;
        engine.startMsg(address, "s");
        "pause" => engine.addString;
    }

    fun void downSoloNext()
    {
        downSoloNext(-1);
    }

    fun void upSoloNext()
    {
        upSoloNext(-1);
    }

    fun void forceUpSoloNext()
    {
        forceUpSoloNext(-1);
    }

    fun void hitSoloNext()
    {
        hitSoloNext(-1);
    }

    fun void downSoloNext(int loop)
    {
        "/sl/" + loop + "/down" => string address;
        engine.startMsg(address, "s");
        "solo_next" => engine.addString;
    }

    fun void upSoloNext(int loop)
    {
        "/sl/" + loop + "/up" => string address;
        engine.startMsg(address, "s");
        "solo_next" => engine.addString;
    }

    fun void forceUpSoloNext(int loop)
    {
        "/sl/" + loop + "/forceup" => string address;
        engine.startMsg(address, "s");
        "solo_next" => engine.addString;
    }

    fun void hitSoloNext(int loop)
    {
        "/sl/" + loop + "/hit" => string address;
        engine.startMsg(address, "s");
        "solo_next" => engine.addString;
    }

    fun void downSoloPrevious()
    {
        downSoloPrevious(-1);
    }

    fun void upSoloPrevious()
    {
        upSoloPrevious(-1);
    }

    fun void forceUpSoloPrevious()
    {
        forceUpSoloPrevious(-1);
    }

    fun void hitSoloPrevious()
    {
        hitSoloPrevious(-1);
    }

    fun void downSoloPrevious(int loop)
    {
        "/sl/" + loop + "/down" => string address;
        engine.startMsg(address, "s");
        "solo_prev" => engine.addString;
    }

    fun void upSoloPrevious(int loop)
    {
        "/sl/" + loop + "/up" => string address;
        engine.startMsg(address, "s");
        "solo_prev" => engine.addString;
    }

    fun void forceUpSoloPrevious(int loop)
    {
        "/sl/" + loop + "/forceup" => string address;
        engine.startMsg(address, "s");
        "solo_prev" => engine.addString;
    }

    fun void hitSoloPrevious(int loop)
    {
        "/sl/" + loop + "/hit" => string address;
        engine.startMsg(address, "s");
        "solo_prev" => engine.addString;
    }

    fun void downRecordSolo()
    {
        downRecordSolo(-1);
    }

    fun void upRecordSolo()
    {
        upRecordSolo(-1);
    }

    fun void forceUpRecordSolo()
    {
        forceUpRecordSolo(-1);
    }

    fun void hitRecordSolo()
    {
        hitRecordSolo(-1);
    }

    fun void downRecordSolo(int loop)
    {
        "/sl/" + loop + "/down" => string address;
        engine.startMsg(address, "s");
        "record_solo" => engine.addString;
    }

    fun void upRecordSolo(int loop)
    {
        "/sl/" + loop + "/up" => string address;
        engine.startMsg(address, "s");
        "record_solo" => engine.addString;
    }

    fun void forceUpRecordSolo(int loop)
    {
        "/sl/" + loop + "/forceup" => string address;
        engine.startMsg(address, "s");
        "record_solo" => engine.addString;
    }

    fun void hitRecordSolo(int loop)
    {
        "/sl/" + loop + "/hit" => string address;
        engine.startMsg(address, "s");
        "record_solo" => engine.addString;
    }

    fun void downRecordSoloNext()
    {
        downRecordSoloNext(-1);
    }

    fun void upRecordSoloNext()
    {
        upRecordSoloNext(-1);
    }

    fun void forceUpRecordSoloNext()
    {
        forceUpRecordSoloNext(-1);
    }

    fun void hitRecordSoloNext()
    {
        hitRecordSoloNext(-1);
    }

    fun void downRecordSoloNext(int loop)
    {
        "/sl/" + loop + "/down" => string address;
        engine.startMsg(address, "s");
        "record_solo_next" => engine.addString;
    }

    fun void upRecordSoloNext(int loop)
    {
        "/sl/" + loop + "/up" => string address;
        engine.startMsg(address, "s");
        "record_solo_next" => engine.addString;
    }

    fun void forceUpRecordSoloNext(int loop)
    {
        "/sl/" + loop + "/forceup" => string address;
        engine.startMsg(address, "s");
        "record_solo_next" => engine.addString;
    }

    fun void hitRecordSoloNext(int loop)
    {
        "/sl/" + loop + "/hit" => string address;
        engine.startMsg(address, "s");
        "record_solo_next" => engine.addString;
    }

    fun void downRecordSoloPrevious()
    {
        downRecordSoloPrevious(-1);
    }

    fun void upRecordSoloPrevious()
    {
        upRecordSoloPrevious(-1);
    }

    fun void forceUpRecordSoloPrevious()
    {
        forceUpRecordSoloPrevious(-1);
    }

    fun void hitRecordSoloPrevious()
    {
        hitRecordSoloPrevious(-1);
    }

    fun void downRecordSoloPrevious(int loop)
    {
        "/sl/" + loop + "/down" => string address;
        engine.startMsg(address, "s");
        "record_solo_prev" => engine.addString;
    }

    fun void upRecordSoloPrevious(int loop)
    {
        "/sl/" + loop + "/up" => string address;
        engine.startMsg(address, "s");
        "record_solo_prev" => engine.addString;
    }

    fun void forceUpRecordSoloPrevious(int loop)
    {
        "/sl/" + loop + "/forceup" => string address;
        engine.startMsg(address, "s");
        "record_solo_prev" => engine.addString;
    }

    fun void hitRecordSoloPrevious(int loop)
    {
        "/sl/" + loop + "/hit" => string address;
        engine.startMsg(address, "s");
        "record_solo_prev" => engine.addString;
    }

    fun void downSetSyncPosition()
    {
        downSetSyncPosition(-1);
    }

    fun void upSetSyncPosition()
    {
        upSetSyncPosition(-1);
    }

    fun void forceUpSetSyncPosition()
    {
        forceUpSetSyncPosition(-1);
    }

    fun void hitSetSyncPosition()
    {
        hitSetSyncPosition(-1);
    }

    fun void downSetSyncPosition(int loop)
    {
        "/sl/" + loop + "/down" => string address;
        engine.startMsg(address, "s");
        "set_sync_pos" => engine.addString;
    }

    fun void upSetSyncPosition(int loop)
    {
        "/sl/" + loop + "/up" => string address;
        engine.startMsg(address, "s");
        "set_sync_pos" => engine.addString;
    }

    fun void forceUpSetSyncPosition(int loop)
    {
        "/sl/" + loop + "/forceup" => string address;
        engine.startMsg(address, "s");
        "set_sync_pos" => engine.addString;
    }

    fun void hitSetSyncPosition(int loop)
    {
        "/sl/" + loop + "/hit" => string address;
        engine.startMsg(address, "s");
        "set_sync_pos" => engine.addString;
    }

    fun void downResetSyncPosition()
    {
        downResetSyncPosition(-1);
    }

    fun void upResetSyncPosition()
    {
        upResetSyncPosition(-1);
    }

    fun void forceUpResetSyncPosition()
    {
        forceUpResetSyncPosition(-1);
    }

    fun void hitResetSyncPosition()
    {
        hitResetSyncPosition(-1);
    }

    fun void downResetSyncPosition(int loop)
    {
        "/sl/" + loop + "/down" => string address;
        engine.startMsg(address, "s");
        "reset_sync_pos" => engine.addString;
    }

    fun void upResetSyncPosition(int loop)
    {
        "/sl/" + loop + "/up" => string address;
        engine.startMsg(address, "s");
        "reset_sync_pos" => engine.addString;
    }

    fun void forceUpResetSyncPosition(int loop)
    {
        "/sl/" + loop + "/forceup" => string address;
        engine.startMsg(address, "s");
        "reset_sync_pos" => engine.addString;
    }

    fun void hitResetSyncPosition(int loop)
    {
        "/sl/" + loop + "/hit" => string address;
        engine.startMsg(address, "s");
        "reset_sync_pos" => engine.addString;
    }
}
