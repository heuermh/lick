
class DumpPitch extends IntIntProcedure
{
    fun void run(int value0, int value1)
    {
        <<<"pitch", value0, value1>>>;
    }
}

class DumpMod extends IntProcedure
{
    fun void run(int value)
    {
        <<<"mod", value>>>;
    }
}

class DumpKeyOn extends IntIntProcedure
{
    fun void run(int value0, int value1)
    {
        <<<"keyOn", value0, value1>>>;
    }
}

class DumpKeyOff extends IntProcedure
{
    fun void run(int value)
    {
        <<<"keyOff", value>>>;
    }
}

class DumpSustainOn extends Procedure
{
    fun void run()
    {
        <<<"sustainOn">>>;
    }
}

class DumpSustainOff extends Procedure
{
    fun void run()
    {
        <<<"sustainOff">>>;
    }
}

DumpPitch pitch;
DumpMod mod;
DumpKeyOn keyOn;
DumpKeyOff keyOff;
DumpSustainOn sustainOn;
DumpSustainOff sustainOff;

Ozone ozone;
pitch @=> ozone.pitchBend;
mod @=> ozone.modulation;
mod @=> ozone.rotary1;
mod @=> ozone.rotary2;
mod @=> ozone.rotary3;
mod @=> ozone.rotary4;
mod @=> ozone.rotary5;
mod @=> ozone.rotary6;
mod @=> ozone.rotary7;
mod @=> ozone.rotary8;
keyOn @=> ozone.keyOn;
keyOff @=> ozone.keyOff;
sustainOn @=> ozone.sustainPedalOn;
sustainOff @=> ozone.sustainPedalOff;
ozone.open(8);

1::minute => now;