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

class DrumKit
{
    GarageBandMidi @ _garageBand;

    fun void kick(int velocity)
    {
        <<<"kick not available in this drum kit">>>;
    }

    fun void sideStick(int velocity)
    {
        <<<"sideStick not available in this drum kit">>>;
    }

    fun void claves(int velocity)
    {
        <<<"claves not available in this drum kit">>>;
    }

    fun void snare(int velocity)
    {
        <<<"snare not available in this drum kit">>>;
    }

    fun void rim(int velocity)
    {
        <<<"rim not available in this drum kit">>>;
    }

    fun void clap(int velocity)
    {
        <<<"clap not available in this drum kit">>>;
    }

    fun void lowTom(int velocity)
    {
        <<<"lowTom not available in this drum kit">>>;
    }

    fun void middleTom(int velocity)
    {
        <<<"middleTom not available in this drum kit">>>;
    }

    fun void highTom(int velocity)
    {
        <<<"highTom not available in this drum kit">>>;
    }

    fun void closedHat(int velocity)
    {
        <<<"closedHat not available in this drum kit">>>;
    }

    fun void openHat(int velocity)
    {
        <<<"openHat not available in this drum kit">>>;
    }

    fun void pedalHat(int velocity)
    {
        <<<"pedalHat not available in this drum kit">>>;
    }

    fun void ride(int velocity)
    {
        <<<"ride not available in this drum kit">>>;
    }

    fun void crash(int velocity)
    {
        <<<"crash not available in this drum kit">>>;
    }

    fun void cowbell(int velocity)
    {
        <<<"cowbell not available in this drum kit">>>;
    }

    fun void fx(int velocity)
    {
        <<<"fx not available in this drum kit">>>;
    }

    fun void bell(int velocity)
    {
        <<<"bell not available in this drum kit">>>;
    }

    fun void shaker(int velocity)
    {
        <<<"shaker not available in this drum kit">>>;
    }
}

/*

 c2  kick
 c#2 side stick
 d2  snare
 d#2 rim
 e2  rim
 f2  lowTom
 f#2 closedHat
 g2
 g#2 pedalHat
 a2  middleTom
 a#2 openHat
 b2
 c3  highTom
 c#3 crash
 d3
 d#3 ride
 e3
 f3  bell

*/
class ClassicStudioKit extends DrumKit
{
    fun void kick(int velocity)
    {
        _garageBand.noteOn(36, velocity);
    }

    fun void sideStick(int velocity)
    {
        _garageBand.noteOn(37, velocity);
    }

    fun void snare(int velocity)
    {
        _garageBand.noteOn(38, velocity);
    }

    fun void rim(int velocity)
    {
        _garageBand.noteOn(39, velocity);
    }

    fun void lowTom(int velocity)
    {
        _garageBand.noteOn(41, velocity);
    }

    fun void closedHat(int velocity)
    {
        _garageBand.noteOn(42, velocity);
    }

    fun void pedalHat(int velocity)
    {
        _garageBand.noteOn(44, velocity);
    }

    fun void middleTom(int velocity)
    {
        _garageBand.noteOn(45, velocity);
    }

    fun void openHat(int velocity)
    {
        _garageBand.noteOn(46, velocity);
    }

    fun void highTom(int velocity)
    {
        _garageBand.noteOn(48, velocity);
    }

    fun void crash(int velocity)
    {
        _garageBand.noteOn(49, velocity);
    }

    fun void ride(int velocity)
    {
        _garageBand.noteOn(51, velocity);
    }

    fun void bell(int velocity)
    {
        _garageBand.noteOn(53, velocity);
    }
}

/*

 c2  kick
 c#2 side stick
 d2  snare
 d#2
 e2  rim
 f2  lowTom
 f#2 closedHat
 g2
 g#2 pedalHat
 a2  middleTom
 a#2 openHat
 b2
 c3  highTom
 c#3 crash
 d3
 d#3 ride
 e3
 f3  bell

*/
class VintageKit extends DrumKit
{
    fun void kick(int velocity)
    {
        _garageBand.noteOn(36, velocity);
    }

    fun void sideStick(int velocity)
    {
        _garageBand.noteOn(37, velocity);
    }

    fun void snare(int velocity)
    {
        _garageBand.noteOn(38, velocity);
    }

    fun void rim(int velocity)
    {
        _garageBand.noteOn(40, velocity);
    }

    fun void lowTom(int velocity)
    {
        _garageBand.noteOn(41, velocity);
    }

    fun void closedHat(int velocity)
    {
        _garageBand.noteOn(42, velocity);
    }

    fun void pedalHat(int velocity)
    {
        _garageBand.noteOn(44, velocity);
    }

    fun void middleTom(int velocity)
    {
        _garageBand.noteOn(45, velocity);
    }

    fun void openHat(int velocity)
    {
        _garageBand.noteOn(46, velocity);
    }

    fun void highTom(int velocity)
    {
        _garageBand.noteOn(48, velocity);
    }

    fun void crash(int velocity)
    {
        _garageBand.noteOn(49, velocity);
    }

    fun void ride(int velocity)
    {
        _garageBand.noteOn(51, velocity);
    }

    fun void bell(int velocity)
    {
        _garageBand.noteOn(53, velocity);
    }
}

/*

 c2  kick
 c#2 side stick
 d2  snare
 d#2 rim
 e2  rim
 f2  lowTom
 f#2 closedHat
 g2
 g#2 pedalHat
 a2  middleTom
 a#2 openHat
 b2
 c3  highTom
 c#3 crash
 d3
 d#3 ride
 e3
 f3  bell

*/
class LiveRockKit extends DrumKit
{
    fun void kick(int velocity)
    {
        _garageBand.noteOn(36, velocity);
    }

    fun void sideStick(int velocity)
    {
        _garageBand.noteOn(37, velocity);
    }

    fun void snare(int velocity)
    {
        _garageBand.noteOn(38, velocity);
    }

    fun void rim(int velocity)
    {
        _garageBand.noteOn(39, velocity);
    }

    fun void lowTom(int velocity)
    {
        _garageBand.noteOn(41, velocity);
    }

    fun void closedHat(int velocity)
    {
        _garageBand.noteOn(42, velocity);
    }

    fun void pedalHat(int velocity)
    {
        _garageBand.noteOn(44, velocity);
    }

    fun void middleTom(int velocity)
    {
        _garageBand.noteOn(45, velocity);
    }

    fun void openHat(int velocity)
    {
        _garageBand.noteOn(46, velocity);
    }

    fun void highTom(int velocity)
    {
        _garageBand.noteOn(48, velocity);
    }

    fun void crash(int velocity)
    {
        _garageBand.noteOn(49, velocity);
    }

    fun void ride(int velocity)
    {
        _garageBand.noteOn(51, velocity);
    }

    fun void bell(int velocity)
    {
        _garageBand.noteOn(53, velocity);
    }
}

/*

 c2  kick
 c#2 claves
 d2  snare
 d#2 clap
 e2  clap
 f2  lowTom
 f#2 closedHat
 g2  (unknown tom)
 g#2 ride
 a2
 a#2 openHat
 b2
 c3
 c#3 crash
 d3  middleTom
 d#3 cowbell
 e3
 f3  shaker

*/
class ClassicDrumMachine extends DrumKit
{
    fun void kick(int velocity)
    {
        _garageBand.noteOn(36, velocity);
    }

    fun void claves(int velocity)
    {
        _garageBand.noteOn(37, velocity);
    }

    fun void snare(int velocity)
    {
        _garageBand.noteOn(38, velocity);
    }

    fun void clap(int velocity)
    {
        _garageBand.noteOn(39, velocity);
    }

    fun void lowTom(int velocity)
    {
        _garageBand.noteOn(41, velocity);
    }

    fun void closedHat(int velocity)
    {
        _garageBand.noteOn(42, velocity);
    }

    fun void ride(int velocity)
    {
        _garageBand.noteOn(44, velocity);
    }

    fun void openHat(int velocity)
    {
        _garageBand.noteOn(46, velocity);
    }

    fun void crash(int velocity)
    {
        _garageBand.noteOn(49, velocity);
    }

    fun void middleTom(int velocity)
    {
        _garageBand.noteOn(50, velocity);
    }

    fun void cowbell(int velocity)
    {
        _garageBand.noteOn(51, velocity);
    }

    fun void shaker(int velocity)
    {
        _garageBand.noteOn(53, velocity);
    }
}

/*

 c2  kick
 c#2 claves
 d2  snare
 d#2 clap
 e2  clap
 f2  lowTom
 f#2 closedHat
 g2  (unknown tom)
 g#2 openHat
 a2
 a#2 ride
 b2  lowTom
 c3
 c#3 crash
 d3  middleTom
 d#3 fx
 e3
 f3  shaker

*/
class HouseDrumMachine extends DrumKit
{
    fun void kick(int velocity)
    {
        _garageBand.noteOn(36, velocity);
    }

    fun void claves(int velocity)
    {
        _garageBand.noteOn(37, velocity);
    }

    fun void snare(int velocity)
    {
        _garageBand.noteOn(38, velocity);
    }

    fun void clap(int velocity)
    {
        _garageBand.noteOn(39, velocity);
    }

    fun void lowTom(int velocity)
    {
        _garageBand.noteOn(41, velocity);
    }

    fun void closedHat(int velocity)
    {
        _garageBand.noteOn(42, velocity);
    }

    fun void openHat(int velocity)
    {
        _garageBand.noteOn(44, velocity);
    }

    fun void ride(int velocity)
    {
        _garageBand.noteOn(46, velocity);
    }

    fun void lowTom(int velocity)
    {
        _garageBand.noteOn(47, velocity);
    }

    fun void crash(int velocity)
    {
        _garageBand.noteOn(49, velocity);
    }

    fun void middleTom(int velocity)
    {
        _garageBand.noteOn(50, velocity);
    }

    fun void fx(int velocity)
    {
        _garageBand.noteOn(51, velocity);
    }

    fun void shaker(int velocity)
    {
        _garageBand.noteOn(53, velocity);
    }
}

/*

 c2  kick
 c#2 side stick
 d2  snare
 d#2 clap
 e2  clap
 f2  lowTom
 f#2 closedHat
 g2
 g#2 pedalHat
 a2
 a#2 openHat
 b2  lowTom
 c3
 c#3 crash
 d3  middleTom
 d#3 ride
 e3
 f3  shaker
 f#3 rim

*/
class HipHopDrumMachine extends DrumKit
{
    fun void kick(int velocity)
    {
        _garageBand.noteOn(36, velocity);
    }

    fun void sideStick(int velocity)
    {
        _garageBand.noteOn(37, velocity);
    }

    fun void snare(int velocity)
    {
        _garageBand.noteOn(38, velocity);
    }

    fun void clap(int velocity)
    {
        _garageBand.noteOn(39, velocity);
    }

    fun void lowTom(int velocity)
    {
        _garageBand.noteOn(41, velocity);
    }

    fun void closedHat(int velocity)
    {
        _garageBand.noteOn(42, velocity);
    }

    fun void pedalHat(int velocity)
    {
        _garageBand.noteOn(44, velocity);
    }

    fun void openHat(int velocity)
    {
        _garageBand.noteOn(46, velocity);
    }

    fun void lowTom(int velocity)
    {
        _garageBand.noteOn(47, velocity);
    }

    fun void crash(int velocity)
    {
        _garageBand.noteOn(49, velocity);
    }

    fun void middleTom(int velocity)
    {
        _garageBand.noteOn(50, velocity);
    }

    fun void ride(int velocity)
    {
        _garageBand.noteOn(51, velocity);
    }

    fun void shaker(int velocity)
    {
        _garageBand.noteOn(53, velocity);
    }

    fun void rim(int velocity)
    {
        _garageBand.noteOn(54, velocity);
    }
}


// interacts with the GarageBand iOS app over MIDI
public class GarageBandMidi extends GarageBand
{
    MidiOut out;
    ControlChangeMidiMsg ccMsg;
    NoteOnMidiMsg noteOnMsg;
    NoteOffMidiMsg noteOffMsg;

    440.0 => float _freq;

    DrumKit @ _drumKit;

    ClassicStudioKit _classicStudioKit;
    VintageKit _vintageKit;
    LiveRockKit _liveRockKit;
    ClassicDrumMachine _classicDrumMachine;
    HouseDrumMachine _houseDrumMachine;
    HipHopDrumMachine _hipHopDrumMachine;

    {
        this @=> _classicStudioKit._garageBand;
        this @=> _vintageKit._garageBand;
        this @=> _liveRockKit._garageBand;
        this @=> _classicDrumMachine._garageBand;
        this @=> _houseDrumMachine._garageBand;
        this @=> _hipHopDrumMachine._garageBand;
    }


    // todo:  this class should use polyphony
    // todo:  refactor common code to AbstractMidiApp or some such


    fun void open(int device)
    {
        out.open(device);
    }

    // MIDI instrument API

    fun void noteOn(int note, int velocity)
    {
        noteOnMsg.note(note);
        noteOnMsg.velocity(velocity);
        out.send(noteOnMsg);
    }

    fun void noteOff(int note, int velocity)
    {
        noteOffMsg.note(note);
        noteOffMsg.velocity(velocity);
        out.send(noteOffMsg);
    }
    

    // StkInstrument-like API

    fun void noteOn(float velocity)
    {
        noteOn(freq2midi(_freq), vel2midi(velocity));
    }

    fun void noteOff(float velocity)
    {
        noteOff(freq2midi(_freq), vel2midi(velocity));
    }

    fun void freq(float frequency)
    {
        frequency => _freq;
    }


    // controls


    // drum kits

    fun void classicStudioKit()
    {
        _classicStudioKit @=> _drumKit;
    }

    fun void vintageKit()
    {
        _vintageKit @=> _drumKit;
    }

    fun void liveRockKit()
    {
        _liveRockKit @=> _drumKit;
    }

    fun void classicDrumMachine()
    {
        _classicDrumMachine @=> _drumKit;
    }

    fun void houseDrumMachine()
    {
        _houseDrumMachine @=> _drumKit;
    }

    fun void hipHopDrumMachine()
    {
        _hipHopDrumMachine @=> _drumKit;
    }

    fun void kick(int velocity)
    {
        _drumKit.kick(velocity);
    }

    fun void kick(float velocity)
    {
        _drumKit.kick(vel2midi(velocity));
    }

    fun void sideStick(int velocity)
    {
        _drumKit.sideStick(velocity);
    }

    fun void sideStick(float velocity)
    {
        _drumKit.sideStick(vel2midi(velocity));
    }

    fun void claves(int velocity)
    {
        _drumKit.claves(velocity);
    }

    fun void claves(float velocity)
    {
        _drumKit.claves(vel2midi(velocity));
    }

    fun void snare(int velocity)
    {
        _drumKit.snare(velocity);
    }

    fun void snare(float velocity)
    {
        _drumKit.snare(vel2midi(velocity));
    }

    fun void rim(int velocity)
    {
        _drumKit.rim(velocity);
    }

    fun void rim(float velocity)
    {
        _drumKit.rim(vel2midi(velocity));
    }

    fun void clap(int velocity)
    {
        _drumKit.clap(velocity);
    }

    fun void clap(float velocity)
    {
        _drumKit.clap(vel2midi(velocity));
    }

    fun void lowTom(int velocity)
    {
        _drumKit.lowTom(velocity);
    }

    fun void lowTom(float velocity)
    {
        _drumKit.lowTom(vel2midi(velocity));
    }

    fun void middleTom(int velocity)
    {
        _drumKit.middleTom(velocity);
    }

    fun void middleTom(float velocity)
    {
        _drumKit.middleTom(vel2midi(velocity));
    }

    fun void highTom(int velocity)
    {
        _drumKit.highTom(velocity);
    }

    fun void highTom(float velocity)
    {
        _drumKit.highTom(vel2midi(velocity));
    }

    fun void closedHat(int velocity)
    {
        _drumKit.closedHat(velocity);
    }

    fun void closedHat(float velocity)
    {
        _drumKit.closedHat(vel2midi(velocity));
    }

    fun void openHat(int velocity)
    {
        _drumKit.openHat(velocity);
    }

    fun void openHat(float velocity)
    {
        _drumKit.openHat(vel2midi(velocity));
    }

    fun void pedalHat(int velocity)
    {
        _drumKit.pedalHat(velocity);
    }

    fun void pedalHat(float velocity)
    {
        _drumKit.pedalHat(vel2midi(velocity));
    }

    fun void ride(int velocity)
    {
        _drumKit.ride(velocity);
    }

    fun void ride(float velocity)
    {
        _drumKit.ride(vel2midi(velocity));
    }

    fun void crash(int velocity)
    {
        _drumKit.crash(velocity);
    }

    fun void crash(float velocity)
    {
        _drumKit.crash(vel2midi(velocity));
    }

    fun void cowbell(int velocity)
    {
        _drumKit.cowbell(velocity);
    }

    fun void cowbell(float velocity)
    {
        _drumKit.cowbell(vel2midi(velocity));
    }

    fun void fx(int velocity)
    {
        _drumKit.fx(velocity);
    }

    fun void fx(float velocity)
    {
        _drumKit.fx(vel2midi(velocity));
    }

    fun void bell(int velocity)
    {
        _drumKit.bell(velocity);
    }

    fun void bell(float velocity)
    {
        _drumKit.bell(vel2midi(velocity));
    }

    fun void shaker(int velocity)
    {
        _drumKit.shaker(velocity);
    }

    fun void shaker(float velocity)
    {
        _drumKit.shaker(vel2midi(velocity));
    }


    // utility methods

    fun int freq2midi(float f)
    {
        return Std.ftom(f) $ int;
    }

    fun int vel2midi(float v)
    {
        if (v < 0.0)
        {
            return 0;
        }
        if (v > 1.0)
        {
            return 127;
        }
        return (v * 127.0) $ int;
    }

    fun int toCC(float value)
    {
        if (value < 0.0)
        {
            return 0;
        }
        if (value > 1.0)
        {
            return 121;
        }
        return (value * 121.0) $ int;
    }
}
